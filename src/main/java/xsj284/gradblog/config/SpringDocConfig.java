package xsj284.gradblog.config;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.security.SecurityScheme;
import io.swagger.v3.oas.models.annotations.OpenAPI31;
import org.springframework.context.annotation.Configuration;

@Configuration
@OpenAPI31()
@OpenAPIDefinition(info = @Info(title = "API", version = "v1.0.0"))
@SecurityScheme(
    name = "token",
    type = SecuritySchemeType.HTTP,
    bearerFormat = "JWT",
    scheme = "bearer"
)
public class SpringDocConfig {
}
