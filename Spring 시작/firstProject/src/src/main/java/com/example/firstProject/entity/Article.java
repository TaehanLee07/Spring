package com.example.firstProject.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;


@NoArgsConstructor // 꼭 default 생성자를 만들어야하기에 사용.
@AllArgsConstructor
@ToString
@Entity // DB가 해당 객체를 인식가능
@Getter // 모든 객체에 Getter 생성
public class Article {

    @Id // 대표값을 지정! like a 학번!!
    @GeneratedValue(strategy = GenerationType.IDENTITY) //DB가 id 를 자동으로 생성해줌 1, 2, 3, ... 자동 생성 어노테이션!!
    private Long id;

    @Column
    private String title;

    @Column
    private String content;

    public void patch(Article article) {
        if (article.title != null) {
            this.title = article.title;
        }
        if (article.content != null) {
            this.content = article.content;
        }
    }

    //    public Article(Long id, String title, String content)
//    {
//        this.id = id;
//        this.title = title;
//        this.content = content;
//    }
//
//    @Override
//    public String toString()
//    {
//        return "Article{" +
//                "id=" + id +
//                ", title='" + title + '\'' +
//                ", content='" + content + '\'' +
//                '}';
//    }

}