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
        model.addAttribute("courses", contentService.getCourses(true));
        if (user != null)
            model.addAttribute("coursesEdit", contentService.getCourses(user));
        return "index";
    }

    @GetMapping("/course/{course}")
    public String openCourse(@PathVariable Course course, Model model) {
        model.addAttribute(course);
        model.addAttribute(tools);
        return "openCourse";
    }
}
