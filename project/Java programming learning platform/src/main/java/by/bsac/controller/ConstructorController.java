package by.bsac.controller;

import by.bsac.dao.CourseRepository;
import by.bsac.dao.PageRepository;
import by.bsac.dao.TopicRepository;
import by.bsac.entity.User;
import by.bsac.entity.content.Course;
import by.bsac.entity.content.Page;
import by.bsac.entity.content.Topic;
import by.bsac.service.Tools;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/constructor")
@PreAuthorize("hasAuthority('ADMIN')")
public class ConstructorController {
    private final CourseRepository courseRepository;
    private final TopicRepository topicRepository;
    private final PageRepository pageRepository;
    private final Tools tools;

    @Value("${upload.path}")
    private String pathImgCourse;

    public ConstructorController(CourseRepository courseRepository, TopicRepository topicRepository, PageRepository pageRepository, Tools tools) {
        this.courseRepository = courseRepository;
        this.topicRepository = topicRepository;
        this.pageRepository = pageRepository;
        this.tools = tools;
    }

    @GetMapping
    public String greetingConstructor() {
        return "greetingConstructor";
    }

    @GetMapping("/course")
    public String courseConstructor() {

        return "constructorCourse";
    }

    @PostMapping("/course")
    public String createCourse(
            @AuthenticationPrincipal User user,
            Course course,
            @RequestParam MultipartFile imgFile
    ) throws IOException {
        Set<User> editors = new HashSet<>();
        editors.add(user);
        course.setEditors(editors);
        if (!imgFile.isEmpty()) {
            course.setImgName(tools.saveImg(imgFile));
        }
        Course save = courseRepository.save(course);

        return "redirect:/constructor/course/edit/" + save.getId();
    }

    @PostMapping("/course/{course}")
    public String editCourse(
            @PathVariable Course course,
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam(required = false) Boolean active,
            @RequestParam MultipartFile imgFile
    ) throws IOException {
        course.setName(name);
        course.setDescription(description);
        course.setActive(active);
        if (!imgFile.isEmpty()) {
            course.setImgName(tools.saveImg(imgFile));
        }
        courseRepository.save(course);
        return "redirect:/constructor/course/edit/" + course.getId();
    }

    @GetMapping("/course/edit/{course}")
    public String editorCourse(@PathVariable Course course, Model model) {
        model.addAttribute("course", course);
        return "editorCourse";
    }

    @GetMapping("/course/{course}/imgdelete")
    public String deleteImgCourse(@PathVariable Course course) {
        File imgCourse = new File(this.pathImgCourse, course.getImgName());
        imgCourse.delete();
        course.setImgName(null);
        courseRepository.save(course);
        return "redirect:/constructor/course/edit/" + course.getId();
    }

    @GetMapping("/course/delete/{course}")
    public String deleteCourse(@PathVariable Course course) {
        for (Topic topic : course.getTopics()) {
            for (Page page : topic.getPages()) {
                if (!StringUtils.isEmpty(page.getPath())) {
                    tools.deleteContentPage(page.getPath());
                }
            }
        }
        File imgCourse = new File(this.pathImgCourse, course.getImgName());
        imgCourse.delete();
        courseRepository.delete(course);
        return "redirect:/";
    }

    @GetMapping("/course/{course}/topic/create")
    public String createTopic(
            @PathVariable Course course,
            Topic topic
    ) {
        List<Topic> topics = course.getTopics();
        if (topics.isEmpty()) {
            topics = new ArrayList<>();
        }
        topics.add(topic);
        course.setTopics(topics);
        courseRepository.save(course);
        return "redirect:/constructor/course/edit/" + course.getId();
    }

    @GetMapping("/course/{course}/topic/{topic}")
    public String actionTopic(
            @PathVariable Course course,
            @PathVariable Topic topic,
            @RequestParam(required = false) Integer priority,
            @RequestParam(required = false) String name,
            @RequestParam String action,
            Model model
    ) {
        if (action.equals("edit")) {
            model.addAttribute("course", course);
            model.addAttribute("topicEditId", topic.getId());
            return "editorCourse";
        } else if (action.equals("delete")) {
            topic.getPages().forEach(page -> tools.deleteContentPage(page.getPath()));
            topicRepository.delete(topic);
            return "redirect:/constructor/course/edit/" + course.getId();
        } else {
            if (priority != null) {
                topic.setPriority(priority);
            }
            if (!StringUtils.isEmpty(name)) {
                topic.setName(name);
            }
            topicRepository.save(topic);
            return "redirect:/constructor/course/edit/" + course.getId();
        }
    }

    @GetMapping("/course/{course}/topic/{topic}/page/create")
    public String createPage(
            @PathVariable Course course,
            @PathVariable Topic topic,
            Page page
    ) {
        List<Page> pages = topic.getPages();
        if (pages.isEmpty()) {
            pages = new ArrayList<>();
        }
        pages.add(page);
        topic.setPages(pages);
        topicRepository.save(topic);
        return "redirect:/constructor/course/edit/" + course.getId();
    }

    @GetMapping("/course/{course}/topic/{topic}/page/{page}")
    public String actionPage(
            @PathVariable Course course,
            @PathVariable Topic topic,
            @PathVariable Page page,
            @RequestParam String action,
            Model model
    ) {
        if (action.equals("delete")) {
            tools.deleteContentPage(page.getPath());
            pageRepository.delete(page);
            return "redirect:/constructor/course/edit/" + course.getId();
        } else {
            model.addAttribute(course);
            model.addAttribute(topic);
            model.addAttribute(page);
            if (!StringUtils.isEmpty(page.getPath())) {
                model.addAttribute("content", tools.readContentPage(page.getPath()));
            }
            return "editPage";
        }
    }

    @PostMapping("/course/{course}/topic/{topic}/page/{page}/preview")
    public String previewPage(
            @PathVariable Course course,
            @PathVariable Topic topic,
            @PathVariable Page page,
            @RequestParam Integer priority,
            @RequestParam String name,
            @RequestParam String content,
            @RequestParam MultipartFile contentFile,
            Model model
    ) {
        if (!contentFile.isEmpty()) {
            content = tools.readContentPage(contentFile);
        }
        model.addAttribute("priority", priority);
        model.addAttribute("name", name);
        model.addAttribute("content", content);
        model.addAttribute("contentBit", tools.convertStringToStringByte(content, " "));
        return "previewPage";
    }

    @PostMapping("/course/{course}/topic/{topic}/page/{page}/save")
    public String savePage(
            @PathVariable Course course,
            @PathVariable Topic topic,
            @PathVariable Page page,
            @RequestParam Integer priority,
            @RequestParam String name,
            @RequestParam String contentBit
    ) {
        page.setPriority(priority);
        page.setName(name);
        String fileName = tools.writeContentPage(tools.convertStringByteToString(contentBit, " "));
        tools.deleteContentPage(page.getPath());
        page.setPath(fileName);
        pageRepository.save(page);
        return "redirect:/constructor/course/edit/" + course.getId();
    }
}

