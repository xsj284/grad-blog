package xsj284.gradblog.annotation;

import org.springframework.web.bind.annotation.RestController;

import java.lang.annotation.*;


/**
 * 统一前缀的RestController
 *
 * @author xsj284
 */
@RestController
@Documented
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface ApiV1RestController {
}
