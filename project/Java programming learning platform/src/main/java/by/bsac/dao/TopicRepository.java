package by.bsac.dao;

import by.bsac.entity.content.Topic;
import org.springframework.data.repository.CrudRepository;

public interface TopicRepository extends CrudRepository<Topic, Long> {
}
