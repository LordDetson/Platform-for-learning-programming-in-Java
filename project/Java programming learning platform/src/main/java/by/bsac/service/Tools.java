package by.bsac.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.StringJoiner;
import java.util.UUID;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Component
public class Tools {
    @Value("${upload.path.page.content}")
    private String pathContentPage;

    @Value("${upload.path}")
    private String pathImgCourse;

    @Bean
    public static PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder(8);
    }

    public String readContentPage(String fileName) {
        StringBuilder builder = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new FileReader(new File(pathContentPage, fileName)))) {
            reader.lines().forEach(s -> {
                builder.append(s);
                builder.append(System.getProperty("line.separator"));
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
        return builder.toString();
    }

    public  String readContentPage(MultipartFile contentFile) {
        StringBuilder builder = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(contentFile.getInputStream()))) {
            reader.lines().forEach(s -> {
                builder.append(s);
                builder.append(System.getProperty("line.separator"));
            });
        } catch (IOException e) {
            e.printStackTrace();
        }
        return builder.toString();
    }

    public String writeContentPage(String content) {
        String uuidFilename = UUID.randomUUID().toString();
        String filename = uuidFilename + ".txt";
        File path = new File(pathContentPage, filename);
        try (FileWriter writer = new FileWriter(path)) {
            writer.write(content);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return filename;
    }

    public String convertStringToStringByte(String content, String separator) {
        StringJoiner joiner = new StringJoiner(separator);
        for (byte b : content.getBytes()) joiner.add(Byte.toString(b));
        return joiner.toString();
    }

    public String convertStringByteToString(String stringByte, String separator) {
        String[] contentBites = stringByte.split(separator);
        byte[] bytes = new byte[contentBites.length];
        for (int i = 0; i < bytes.length; i++) {
            bytes[i] = Byte.valueOf(contentBites[i]);
        }
        return new String(bytes, StandardCharsets.UTF_8);
    }

    public void deleteContentPage(String path) {
        if (!StringUtils.isEmpty(path)) {
            File file = new File(pathContentPage, path);
            file.delete();
        }
    }

    public String saveImg(MultipartFile file) throws IOException {
        String uuidFilename = UUID.randomUUID().toString();
        String filename = uuidFilename + "-" + file.getOriginalFilename();
        File pathImgCourse = new File(this.pathImgCourse, filename);
        file.transferTo(pathImgCourse);
        return filename;
    }

    public static Map<String, String> getErrorMap(BindingResult bindingResult) {
        Collector<FieldError, ?, Map<String, String>> collector = Collectors.toMap(
                fieldError -> (fieldError.getField()) + "Error",
                FieldError::getDefaultMessage
        );
        return bindingResult.getFieldErrors().stream().collect(collector);
    }
}
