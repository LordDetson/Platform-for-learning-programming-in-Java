package by.bsac.controller;

import by.bsac.entity.User;
import by.bsac.service.ContentService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContentController {
    private final ContentService contentService;

    public ContentController(ContentService contentService) {
        this.contentService = contentService;
    }

    @GetMapping
    public String greeting(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("courses", contentService.getCourses(true));
        if (user != null)
            model.addAttribute("coursesEdit", contentService.getCourses(user));
        return "index";
    }
}
