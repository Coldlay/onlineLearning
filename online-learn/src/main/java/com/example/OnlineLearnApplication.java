package com.example;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author coldplay
 * @create 2023-04-12 21:44
 */
@SpringBootApplication
@MapperScan("com.example.mapper")
public class OnlineLearnApplication {
    public static void main(String[] args) {
        SpringApplication.run(OnlineLearnApplication.class,args);
    }
}
