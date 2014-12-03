package com.weir.core.platform.context;

import java.io.IOException;
import java.util.Properties;

import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

import com.weir.core.util.AssertUtils;
import com.weir.core.util.RuntimeIOException;

/**
 * @author neo
 */
public class PropertyContext extends PropertySourcesPlaceholderConfigurer {
    private Properties allProperties;

    public void loadAllProperties() {
        AssertUtils.assertNull(allProperties, "loadAllProperties was executed already");
        try {
            allProperties = mergeProperties();
        } catch (IOException e) {
            throw new RuntimeIOException(e);
        }
    }

    public Properties getAllProperties() {
        Properties properties = new Properties();
        properties.putAll(allProperties);
        return properties;
    }
}
