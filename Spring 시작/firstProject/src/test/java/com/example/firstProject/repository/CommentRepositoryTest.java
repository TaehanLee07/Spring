package com.example.firstProject.repository;

import com.example.firstProject.entity.Article;
import com.example.firstProject.entity.Comment;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest // jpa 와 연동된 테스트라고 어노테이션함
class CommentRepositoryTest {


    @Autowired CommentRepository commentRepository;

    @Test
    @DisplayName("특정 게시글의 모든 댓글 조회")
    void findByArticleId() {
        // case 1 4번 게시글의 모든 댓글 조회
        {
            // 입력 데이터 준비
            Long articleId = 1L;

            // 실제 수행
            List<Comment> comments = commentRepository.findByArticleId(articleId);

            // 예쌍
            Article article = new Article(1L, "가가가가가", "ㄱㄱㄱㄱ");
            List<Comment> excepted = Arrays.asList();


            // 검증
            assertEquals(excepted.toString(), comments.toString(), "1번 글은 댓글이 없음.");
        }

        // case 2 9번 게시글의 모든 댓글 조회
        {
            // 입력 데이터 준비
            Long articleId = 1L;

            // 실제 수행
            List<Comment> comments = commentRepository.findByArticleId(articleId);

            // 예쌍
            Article article = new Article(1L, "가가가가가", "ㄱㄱㄱㄱ");
            List<Comment> excepted = Arrays.asList();


            // 검증
            assertEquals(excepted.toString(), comments.toString(), "1번 글은 댓글이 없음.");
        }

        // case 1 4번 게시글의 모든 댓글 조회
        {
            // 입력 데이터 준비
            Long articleId = 1L;

            // 실제 수행
            List<Comment> comments = commentRepository.findByArticleId(articleId);

            // 예쌍
            Article article = new Article(1L, "가가가가가", "ㄱㄱㄱㄱ");
            List<Comment> excepted = Arrays.asList();


            // 검증
            assertEquals(excepted.toString(), comments.toString(), "1번 글은 댓글이 없음.");
        }
    }

    @Test
    @DisplayName("특정 닉네임의 모든 댓글 조회")
    void findByNickname() {
        /* 박의 모든 댓글 조회*/
        {
            // 입력 데이터 준비
            String nickname = "Park";

            // 실제 수행
            List<Comment> comments = commentRepository.findByNickname(nickname);

            // 예상
            Comment a = new Comment(1L, new Article(4L, "당신의 인생 영화는?", "댓글 ㄱ"), nickname, "굳 윌 헌팅");
            Comment b = new Comment(4L, new Article(5L, "당신의 소울 푸드는?", "댓글 ㄱㄱ"), nickname, "치킨");
            Comment c = new Comment(7L, new Article(6L, "당신의 취미는?", "댓글 ㄱㄱㄱ"), nickname, "조깅");
            List<Comment> excepted = Arrays.asList(a,b,c);
            // 검증
            assertEquals(excepted.toString(), comments.toString(), "Park의 모든 댓글 출력");
        }

        {
            /* Kim의 모든 댓글 조회 */

        }

        {
            /* null의 모든 댓글 조회*/

        }

        {
            /* I의 모든 댓글 조회*/

        }
    }
}