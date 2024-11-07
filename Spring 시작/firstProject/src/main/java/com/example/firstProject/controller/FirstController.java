package com.example.firstProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class FirstController {

    @GetMapping("/hi")
    public String niceToMeetYou(Model model) {
        model.addAttribute("username","손오공");
        return "greetings";
    }

    @GetMapping("/bye")
    public String seeYouAgain(Model model) {
        model.addAttribute("username","손오공");
        return "bye";
    }
}
