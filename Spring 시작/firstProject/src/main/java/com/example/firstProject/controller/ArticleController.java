package com.example.firstProject.controller;

import com.example.firstProject.dto.ArticleForm;
import com.example.firstProject.entity.Article;
import com.example.firstProject.repository.ArticleRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@Slf4j
public class ArticleController {
    // DI 의존주입 (인스턴스화 할 필요없이 스프링이 미리 생성한 객체에 연결하는 기능)
    @Autowired
    private ArticleRepository articleRepository;

    @GetMapping("/article/new")
    public String newArticleForm() {
        return "article/new";
    }

    @PostMapping("/article/create")
    public String createArticle(ArticleForm form) {
        log.info(form.toString());
        //System.out.println(form.toString());
        // DTO 객체 변환 -> Entity
        Article article = form.toEntity();
        log.info(form.toString());
        //System.out.println(article.toString());

        // 레포지토리 에게 엔티티를 DB안에 저장하게 명령
       Article saved = articleRepository.save(article);
        log.info(form.toString());
        //System.out.println(saved.toString());
        return "";
    }
}