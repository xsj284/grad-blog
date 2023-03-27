package xsj284.gradblog;

import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableEncryptableProperties
public class GradBlogApplication {

    public static void main(String[] args) {
        SpringApplication.run(GradBlogApplication.class, args);
    }

}
