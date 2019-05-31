package by.bsac.service;

import by.bsac.dao.CourseRepository;
import by.bsac.entity.User;
import by.bsac.entity.content.Course;
import org.springframework.stereotype.Service;

@Service
public class ContentService {
    private final CourseRepository courseRepository;

    public ContentService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public Iterable<Course> getCourses() {
        return courseRepository.findAll();
    }

    public Iterable<Course> getCourses(Boolean active) {
        return courseRepository.findCoursesByActive(active);
    }

    public Iterable<Course> getCourses(User editor) {
        return courseRepository.findCoursesByEditorsContains(editor);
    }
}
