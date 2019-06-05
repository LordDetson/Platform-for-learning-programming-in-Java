package by.bsac.dao;

import by.bsac.entity.User;
import by.bsac.entity.content.Course;
import org.springframework.data.repository.CrudRepository;

public interface CourseRepository extends CrudRepository<Course, Long> {
    Iterable<Course> findCoursesByActive(Boolean active);

    Iterable<Course> findCoursesByEditorsContains(User editor);

    Iterable<Course> findCoursesByActiveAndNameLike(Boolean active, String regex);

    Iterable<Course> findCoursesByEditorsContainsAndNameLike(User editor, String regex);
}
