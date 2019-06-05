package by.bsac.controller;

import by.bsac.entity.Role;
import by.bsac.entity.User;
import by.bsac.service.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/admin")
public class AdminController {
    private final UserService userService;

    public AdminController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/userList")
    public String userList(Model model) {
        model.addAttribute("userList", userService.findAll());
        return "userList";
    }

    @PostMapping("/user/{user}")
    public String editUser(
            @PathVariable User user,
            @RequestParam String action,
            @RequestParam Map<String, String> form,
            Model model
    ) {
        if (action.equals("delete")) {
            userService.deleteUser(user);
            return "redirect:/admin/userList";
        } else if (action.equals("save")) {
            userService.save(user, form);
            return "redirect:/admin/userList";
        } else {
            model.addAttribute("userList", userService.findAll());
            model.addAttribute("userEditId", user.getId());
            model.addAttribute("roles", Role.values());
            return "userList";
        }
    }
}
