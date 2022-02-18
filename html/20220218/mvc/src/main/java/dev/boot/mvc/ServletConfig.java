package dev.boot.mvc;

import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dev.form.Study;
import dev.form.Study2;
import dev.controller.*;

@Configuration
public class ServletConfig {
    @Bean
    public ServletRegistrationBean<Study> getStudy() {
        ServletRegistrationBean<Study> bean = new ServletRegistrationBean<Study>(new Study()); // 객체 생성
        bean.addUrlMappings("/form/study"); // 접근 주소
        return bean;
    }

    @Bean
    public ServletRegistrationBean<Study2> getStudy2() {
        ServletRegistrationBean<Study2> bean = new ServletRegistrationBean<Study2>(new Study2()); // 객체 생성
        bean.addUrlMappings("/form/study2.kor"); // 접근 주소
        return bean;
    }
    @Bean
    public ServletRegistrationBean<Controller1> getController1() {
        ServletRegistrationBean<Controller1> bean = new ServletRegistrationBean<Controller1>(new Controller1()); // 객체 생성
        bean.addUrlMappings("*.do1"); // 접근 주소
        return bean;
    }
    @Bean
    public ServletRegistrationBean<Controller2> getController2() {
        ServletRegistrationBean<Controller2> bean = new ServletRegistrationBean<Controller2>(new Controller2()); // 객체 생성
        bean.addUrlMappings("*.do2"); // 접근 주소
        return bean;
    }
    @Bean
    public ServletRegistrationBean<Controller1ex> getController1ex() {
        ServletRegistrationBean<Controller1ex> bean = new ServletRegistrationBean<Controller1ex>(new Controller1ex()); // 객체 생성
        bean.addUrlMappings("*.do1ex"); // 접근 주소
        return bean;
    }  
    @Bean
    public ServletRegistrationBean<Controller2ex> getController2ex() {
        ServletRegistrationBean<Controller2ex> bean = new ServletRegistrationBean<Controller2ex>(new Controller2ex()); // 객체 생성
        bean.addUrlMappings("*.do2ex"); // 접근 주소
        return bean;
    }  
}