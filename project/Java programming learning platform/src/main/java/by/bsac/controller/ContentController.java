package by.bsac.controller;

import by.bsac.entity.User;
import by.bsac.entity.content.Course;
import by.bsac.service.ContentService;
import by.bsac.service.Tools;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContentController {
    private final ContentService contentService;
    private final Tools tools;

    public ContentController(ContentService contentService, Tools tools) {
        this.contentService = contentService;
        this.tools = tools;
    }

    @GetMapping
    public String greeting(@AuthenticationPrincipal User user, Model model) {
        Iterable<Course> courses = contentService.getCourses(true);
        model.addAttribute("courses", courses);
        if (user != null) {
            model.addAttribute("coursesEdit", contentService.getCourses(user));
        }
        return "index";
    }

    @GetMapping("/course/{course}")
    public String openCourse(@PathVariable Course course, Model model) {
        model.addAttribute(course);
        model.addAttribute(tools);
        return "openCourse";
    }

    @GetMapping("/course/{course}/students")
    public String studentsCourse(@PathVariable Course course, Model model) {
        model.addAttribute("userList", course.getStudents());
        return "userList";
    }

    @GetMapping("/course/{course}/editors")
    public String editorsCourse(@PathVariable Course course, Model model) {
        model.addAttribute("userList", course.getEditors());
        return "userList";
    }

    @GetMapping("/course/search")
    public String searchCourse(
            @AuthenticationPrincipal User user,
            @RequestParam String valueSearch,
            Model model) {
        valueSearch = '%' + valueSearch + '%';
        model.addAttribute("courses", contentService.searchCoursesByName(true, valueSearch));
        if (user != null) {
            model.addAttribute("coursesEdit", contentService.searchCoursesByName(user, valueSearch));
        }
        return "index";
    }
}
