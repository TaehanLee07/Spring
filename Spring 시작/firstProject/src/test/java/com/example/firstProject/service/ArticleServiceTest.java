package com.example.firstProject.service;

import com.example.firstProject.dto.ArticleForm;
import com.example.firstProject.entity.Article;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest // 스프링 부트랑 연동해서 통합 테스트 수행
class ArticleServiceTest {

    @Autowired
    ArticleService articleService;

    @Test
    void index() {
        // 예상 값
        Article a = new Article(1L, "ㄱㄱㄱㄱㄱ", "1111");
        Article b = new Article(2L, "ㄴㄴㄴㄴㄴ", "2222");
        Article c = new Article(3L, "ㄷㄷㄷㄷㄷ", "3333");

        List<Article> excepted = new ArrayList<>(Arrays.asList(a,b,c));
        // 실제 값
        List<Article> articles = articleService.index();

        // 비교
        assertEquals(excepted.toString(), articles.toString());
    }

    @Test
    void show_성공() {
        // 예
        Long id = 1L;
        Article excepted = new Article(1L, "ㄱㄱㄱㄱㄱ", "1111");


        // 실
        Article article = articleService.show(id);

        // 비교
        assertEquals(excepted.toString(), article.toString());
    }
    @Test
    void show_실패() {
        // 예
        Long id = -1L;
        Article excepted = null;

        // 실
        Article article = articleService.show(id);

        // 비교
        assertEquals(excepted, article);
    }

    @Test
    @Transactional
    void create_성공___title과content만__있는_dto__입력() {
        // 예상
        String title = "라라라라";
        String content = "4444";
        ArticleForm dto = new ArticleForm(null, title, content);
        Article expected = new Article(4L, title, content);

        // 실제
        Article article = articleService.create(dto);
        // 비교
        assertEquals(expected.toString(), article.toString());
    }

    @Test
    @Transactional
    void create_실패_id가_포함된_dto__입력() {
        // 예상
        String title = "라라라라";
        String content = "4444";
        ArticleForm dto = new ArticleForm(4L, title, content);
        Article expected = null;

        // 실제
        Article article = articleService.create(dto);
        // 비교
        assertEquals(expected, article);
    }

    @Test
    @Transactional
    void update_성공____존재하는_id와타이틀_콘텐츠_까지_전부있는_DTO입력시() {

        // 예상
        String newTitle = "라라라라";
        String newContent = "4444";
        ArticleForm dto = new ArticleForm(2L, newTitle, newContent);
        Article expected = new Article(2L, newTitle, newContent);

        // 실제
        Article article = articleService.update(2L, dto);
        // 비교
        assertEquals(expected.toString(), article.toString());
    }

    @Test
    @Transactional
    void update_성공_title만_있는_DTO입력() {

        // 예
        Long id = 1L;
        String title = "가나다라";
        String content = null;
        ArticleForm dto = new ArticleForm(id, title, content);
        Article excepted = new Article(id, title, "1111");

        // 실
        Article article = articleService.update(id, dto);

        // 비교
        assertEquals(excepted.toString(), article.toString());



//        Long id = 2L;
//        Article default_data = new Article(id, "ㄴㄴㄴㄴㄴ", "2222");
//
//        // 예상
//        String newTitle = "라라라라";
//        String originContent = default_data.getContent();
//
//        ArticleForm dto = new ArticleForm(2L, newTitle, originContent);
//        Article expected = new Article(2L, newTitle, originContent);
//
//        // 실제
//        Article article = articleService.update(2L, dto);
//        // 비교
//        assertEquals(expected.toString(), article.toString());
    }

    @Test
    @Transactional
    void update_실패_존재하지않는_id의_DTO입력() {

    }

    @Test
    @Transactional
    void delete_성공____존재하는_id_입력() {

        Long id = 1L;
        Article expected = new Article(id, "가가가가", "1111");


        Article article = articleService.delete(id);


        assertEquals(expected.toString(), article.toString());
    }

    @Test
    @Transactional
    void delete_실패____존재하지_않는_id_입력() {
        Long id = -1L;
        Article expected = null;

        Article article = articleService.delete(id);

        assertEquals(expected, article);
    }
}