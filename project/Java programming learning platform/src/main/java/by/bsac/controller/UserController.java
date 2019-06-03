package by.bsac.controller;

import by.bsac.entity.User;
import by.bsac.entity.content.Course;
import by.bsac.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/{user}")
    public String profile(
            @PathVariable User user,
            Model model
    ) {
        model.addAttribute("uuser", user);
        model.addAttribute("courses", user.getCourses());
        model.addAttribute("roles", user.getRoles());
        if (!user.getGrades().isEmpty()) {
            model.addAttribute("grades", user.getGrades());
        }
        return "profile";
    }

    @GetMapping("/{user}/edit")
    public String editProfile(
            @PathVariable User user,
            Model model
    ) {
        model.addAttribute("user", user);
        return "editProfile";
    }

    @PostMapping("/{user}/edit")
    public String saveProfile(
            @PathVariable User user,
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String email
    ) {
        userService.updateUser(user, username, password, email);
        return "redirect:/user/" + user.getId();
    }

    @GetMapping("/{user}/unsubscribe/{course}")
    public String unsubscribe(
            @PathVariable User user,
            @PathVariable Course course
    ) {
        user.getCourses().remove(course);
        userService.updateUser(user);
        return "redirect:/";
    }

    @GetMapping("/{user}/subscribe/{course}")
    public String subscribe(
            @PathVariable User user,
            @PathVariable Course course
    ) {
        user.getCourses().add(course);
        userService.updateUser(user);
        return "redirect:/";
    }
}
