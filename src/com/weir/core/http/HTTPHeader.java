package com.weir.core.http;

/**
 * @author neo
 */
public class HTTPHeader {
    private final String name;
    private final String value;

    public HTTPHeader(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String name() {
        return name;
    }

    public String value() {
        return value;
    }
}
