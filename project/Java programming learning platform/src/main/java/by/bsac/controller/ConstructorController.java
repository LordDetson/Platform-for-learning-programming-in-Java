package by.bsac.controller;

import by.bsac.dao.CourseRepository;
import by.bsac.entity.User;
import by.bsac.entity.content.Course;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Controller
@RequestMapping("/constructor")
@PreAuthorize("hasAuthority('ADMIN')")
public class ConstructorController {
    private final CourseRepository courseRepository;

    @Value("${upload.path}")
    private String pathImgCourse;

    public ConstructorController(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
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
        saveImg(course, imgFile);
        courseRepository.save(course);
        return "redirect:/constructor/course";
    }

    private void saveImg(Course course,@RequestParam MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            String uuidFilename = UUID.randomUUID().toString();
            String filename = uuidFilename + "-" + file.getOriginalFilename();
            File pathImgCourse = new File(this.pathImgCourse + "/" + filename);
            file.transferTo(pathImgCourse);
            course.setImgName(filename);
        }
    }
}

