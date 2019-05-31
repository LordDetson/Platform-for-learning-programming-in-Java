package by.bsac.service;

import by.bsac.dao.UserRepository;
import by.bsac.entity.Role;
import by.bsac.entity.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    private final UserRepository userRepository;
    private final MailSend mailSend;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, MailSend mailSend, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.mailSend = mailSend;
        this.passwordEncoder = passwordEncoder;
    }
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User byUsername = userRepository.findByUsername(s);
        if (byUsername == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return byUsername;
    }

    public boolean addUser(User user) {
        User byUsername = userRepository.findByUsername(user.getUsername());
        if (byUsername != null) {
            return false;
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.ADMIN));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        //Временно не работает! Подтвержение почты
        //sendActivationCode(user);
        return true;
    }

    private void sendActivationCode(User user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello %s!\n" +
                            "Welcome! Please, visit this link: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );
            mailSend.send(user.getEmail(), "Activation code mail", message);
        }
    }

    public boolean activateUser(String code) {
        User byActivationCode = userRepository.findByActivationCode(code);
        if (byActivationCode == null) {
            return false;
        }
        byActivationCode.setActivationCode(null);
        userRepository.save(byActivationCode);
        return true;
    }

    public Iterable<User> findAll() {
        return userRepository.findAll();
    }

    public void save(User user, String username, Map<String, String> form) {
        user.setUsername(username);
        Set<String> roleSet = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        form.keySet().stream()
                .filter(roleSet::contains)
                .forEach(s -> user.getRoles().add(Role.valueOf(s)));

        userRepository.save(user);
    }

    public void updateUser(User user, String username, String password, String email) {
        boolean isEmailChanged = (!StringUtils.isEmpty(email) && !email.equals(user.getEmail()));
        if (isEmailChanged) {
            user.setEmail(email);
            user.setActivationCode(UUID.randomUUID().toString());
        }
        if (!StringUtils.isEmpty(password)) {
            user.setPassword(password);
        }
        if (!StringUtils.isEmpty(username)) {
            user.setUsername(username);
        }
        userRepository.save(user);
        if (isEmailChanged) {
            //Временно не работает! Подтвержение почты
            //sendActivationCode(user);
        }
    }
}
