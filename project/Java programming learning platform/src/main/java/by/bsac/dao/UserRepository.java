package by.bsac.dao;

import by.bsac.entity.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);
}
