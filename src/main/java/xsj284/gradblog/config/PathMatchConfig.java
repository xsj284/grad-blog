package xsj284.gradblog.config;

import jakarta.annotation.Resource;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import xsj284.gradblog.annotation.ApiV1RestController;
import xsj284.gradblog.config.properties.ApiPrefixProperties;

/**
 * 为类上有ApiV1Controller注解的controller接口添加对应的前缀
 *
 * @author xsj284
 */
@Configuration
public class PathMatchConfig implements WebMvcConfigurer {
    @Resource
    private ApiPrefixProperties apiPrefixProperties;

    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        configurer.addPathPrefix(
            apiPrefixProperties.getV1(),
            c -> c.isAnnotationPresent(ApiV1RestController.class)
        );
    }
}
