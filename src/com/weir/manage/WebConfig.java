package com.weir.manage;

import javax.inject.Inject;
import javax.persistence.EntityManagerFactory;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.orm.jpa.support.OpenEntityManagerInViewInterceptor;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import com.weir.manage.interceptor.JspViewInterceptor;



@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.weir" })
//public class WebConfig extends WebMvcConfigurationSupport {
  public class WebConfig extends WebMvcConfigurerAdapter  {

    @Inject
    EntityManagerFactory entityManagerFactory;
    
    


    @Bean
	public ViewResolver viewResolver() {
    	InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		//viewResolver.setViewClass(UrlBasedViewResolver.class);
		viewResolver.setSuffix(".jsp");
		viewResolver.setPrefix("/view/");
		viewResolver.setOrder(9);
		return viewResolver;
	}
    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer cfg = new TilesConfigurer();
        cfg.setDefinitions(new String[] { "/WEB-INF/tiles/cfg/tiles-defs.xml" });
        return cfg;
    }

    @Bean
    public TilesViewResolver tilesViewResolver() {
        TilesViewResolver resolver = new TilesViewResolver();
        resolver.setViewClass(org.springframework.web.servlet.view.tiles3.TilesView.class);
        resolver.setContentType("text/html; charset=UTF-8");
        resolver.setOrder(0);
        return resolver;
    }

    @Bean
    public MultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(5 * 1024 * 1024);
        return multipartResolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**", "/images/**", "/img/**", "/js/**", "/fonts/**", "/bower_components/**", "/misc/**")
        	.addResourceLocations("/css/", "/images/", "/img/", "/js/", "/fonts/", "/bower_components/", "/misc/");
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    }
    @Bean
    public JspViewInterceptor jspViewInterceptor() {
        return new JspViewInterceptor();
    }
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        OpenEntityManagerInViewInterceptor interceptor = new OpenEntityManagerInViewInterceptor();
        interceptor.setEntityManagerFactory(entityManagerFactory);
        registry.addWebRequestInterceptor(interceptor);
        registry.addInterceptor(jspViewInterceptor());
    }
    
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("forward:/member/login");
    }
}
