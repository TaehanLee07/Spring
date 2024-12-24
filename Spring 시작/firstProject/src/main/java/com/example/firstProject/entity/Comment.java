package com.example.firstProject.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne // 해당 댓글 엔티티 여러개가 하나의 아티클에 연관됨 (다대일 이다)
    @JoinColumn(name = "article_id") // article_id 컬럼의 대표값을 저장해줌
    private Article article;

    @Column
    private String nickname;

    @Column
    private String body;
}
