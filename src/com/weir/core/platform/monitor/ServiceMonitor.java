package com.weir.core.platform.monitor;

/**
 * @author neo
 */
public interface ServiceMonitor {
    ServiceStatus getServiceStatus() throws Exception;

    String getServiceName();
}
