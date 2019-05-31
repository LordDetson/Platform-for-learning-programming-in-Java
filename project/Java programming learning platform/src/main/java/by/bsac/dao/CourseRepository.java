package by.bsac.dao;

import by.bsac.entity.User;
import by.bsac.entity.content.Course;
import org.springframework.data.repository.CrudRepository;

public interface CourseRepository extends CrudRepository<Course, Long> {
    Iterable<Course> findCoursesByActive(Boolean active);

    Iterable<Course> findCoursesByEditorsContains(User editor);
}
