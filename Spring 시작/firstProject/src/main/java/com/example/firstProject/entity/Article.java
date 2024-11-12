package com.example.firstProject.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@ToString

@Entity // DB가 해당 객체를 인식 가능
public class Article {

    @Id // 대표값 (학번 같은거)
    @GeneratedValue // 1번 부터 자동으로 생성 어노테이션
    private Long id;

    @Column
    private String title;
    @Column
    private String content;
}
