package com.example.firstProject.repository;

import com.example.firstProject.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    // 특정 게시물의 모든 댓글 조회
    @Query(value = "Select * from comment where article_id = :articleId", nativeQuery = true)
    List<Comment> findByArticleId(Long articleId);

    // 특정 닉네이므이 모든 댓글 조회
    List<Comment> findByNickname(String nickname);
}
