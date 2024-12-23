package com.example.firstProject.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController // rest api 컨트롤러 인데 이는 json 과 같은 데이터를 반화낳는 역할임
public class FirstApiController {
    @GetMapping("/api/hello")
    public String hello() {
        return "hello world";
    }
}
