package com.example.firstProject.controller;

import com.example.firstProject.entity.Article;
import com.example.firstProject.dto.ArticleForm;
import com.example.firstProject.repository.ArticleRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Slf4j
public class ArticleController {

    @Autowired // 스프링부트가 미리 생성해놓은 객체를 가져다가 자동으로 연결!
    private ArticleRepository articleRepository;

    @GetMapping("/articles/new")
    public String newArticleForm()
    {
        return "articles/new";
    }

    @PostMapping("/articles/create")
    public String createArticle(ArticleForm form)
    {
        log.info(form.toString());
//        System.out.println(form.toString());

        // 1. Dto 객체를 변환 -> Entity!!
        Article article = form.toEntity();
        log.info(article.toString());
//        System.out.println(article.toString());

        // 2. Repository에게 Entity를 DB안에 저장하게 명령!!
        Article saved = articleRepository.save(article);
        log.info(saved.toString());
//        System.out.println(saved.toString());

        return "redirect:/articles/" + saved.getId();
    }

    @GetMapping("/articles/{id}")
    public String show(@PathVariable Long id, Model model) // @PathVariable : 주소 줄에 있는 변수를 가져온다.
    {
        log.info("id = " + id);

        // 1. id로 데이터를 가져옴.
        Article articleEntity = articleRepository.findById(id).orElse(null);
        // id를 가져오는데 없을 경우를 예외처리 하지 않으면 오류가 뜨기에 예외처리를 하라고 오류를 띄움
        // Optional<Article> articleEntity = articleRepository.findById(id);

        // 2. 가져온 데이터를 모델에 등록함.
        model.addAttribute("article", articleEntity);

        // 3. 보여줄 페이지를 설정!
        return "articles/show";
    }

    @GetMapping("/articles")
    public String index(Model model)
    {
        // 1. 모든 Article을 가져온다!
        List<Article> articleEntityList = articleRepository.findAll();

        // 2. 가져온 Article 묶음을 View로 전달한다!
        model.addAttribute("articleList", articleEntityList);

        // 3. View 페이지를 생성!
        return "articles/index";
    }

    @GetMapping("/articles/{id}/edit")
    public String edit(@PathVariable Long id, Model model) {
        // 수정할 데이터 가죠오기
        Article  articleEntity = articleRepository.findById(id).orElse(null);

        // 모델의 데이터를 등록
        model.addAttribute("article", articleEntity);

        // 뷰 페이지 설정
        return "articles/edit";
    }

    @PostMapping("articles/update")
    public String update(ArticleForm form) {
        log.info(form.toString());

        // dto를 엔티티로 변환
        Article articleEntity = form.toEntity();
        log.info(articleEntity.toString());

        // 엔티티를 레포지토리로 넘겨 주기 (디비저장(
        // 1. DB에서 기존데이터를 가져오고,
        Article target = articleRepository.findById(articleEntity.getId()).orElse(null);
        // 2. 기존 데이터가 존재하면 값을 갱신함
        if (target != null) {
            articleRepository.save(articleEntity);
        }


        // 수정결과 페이지로 리다이렉트


        return "redirect:/articles/" + articleEntity.getId();
    }

    @GetMapping("/articles/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes rttr) {
        log.info("삭제 요청이 들어왔습니다.");
        // 1. 삭제 대상을 가져온다
        Article target = articleRepository.findById(id).orElse(null);
        // 2. 대상을 삭제처림함
        if (target != null) {
            articleRepository.delete(target);
            rttr.addFlashAttribute("msg", "삭제가 완료되었습니다!");
        }
        // 3. 결과 데이터로 리다이렉트 함
        return "redirect:/articles";
    }
}