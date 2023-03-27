package xsj284.gradblog.security;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import jakarta.annotation.Resource;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import xsj284.gradblog.config.properties.ApiPrefixProperties;

@Configuration
public class SaTokenInterceptor implements WebMvcConfigurer {
    @Resource
    private ApiPrefixProperties apiPrefixProperties;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String apiUrl = apiPrefixProperties.getV1();
        registry.addInterceptor(new SaInterceptor(handler -> {
            SaRouter.match(apiUrl + "/**", r -> StpUtil.checkLogin());

            SaRouter.match(apiUrl + "/admin/**", r -> StpUtil.checkRoleOr("admin", "super_admin"));

            SaRouter.match(apiUrl + "/user/**", r -> {
            });
        })).addPathPatterns("/**");
    }
}
