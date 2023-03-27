package xsj284.gradblog.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 属性-api前缀
 *
 * @author xsj284
 */
@Data
@Component
@ConfigurationProperties(prefix = "api.prefix")
public class ApiPrefixProperties {
    private String v1;
}
