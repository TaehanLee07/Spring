insert into article(id, title, content) values (1, 'ㄱㄱㄱㄱㄱ', '1111');
insert into article(id, title, content) values (2, 'ㄴㄴㄴㄴㄴ', '2222');
insert into article(id, title, content) values (3, 'ㄷㄷㄷㄷㄷ', '3333');

-- article 더미 데이터
INSERT INTO article(id, title, content) VALUES (4, '당신의 인생 영화는?', '댓글 ㄱ');
INSERT INTO article(id, title, content) VALUES (5, '당신의 소울 푸드는?', '댓글 ㄱㄱ');
INSERT INTO article(id, title, content) VALUES (6, '당신의 취미는?', '댓글 ㄱㄱㄱ');

-- 4번 게시글의 댓글들
INSERT INTO comment(id, article_id, nickname, body) VALUES (1, 4, 'Park', '굳 윌 헌팅');
INSERT INTO comment(id, article_id, nickname, body) VALUES (2, 4, 'Kim', '아이 엠 샘');
INSERT INTO comment(id, article_id, nickname, body) VALUES (3, 4, 'Choi', '쇼생크 탈출');

-- 5번 게시글의 댓글들
INSERT INTO comment(id, article_id, nickname, body) VALUES (4, 5, 'Park', '치킨');
INSERT INTO comment(id, article_id, nickname, body) VALUES (5, 5, 'Kim', '샤브샤브');
INSERT INTO comment(id, article_id, nickname, body) VALUES (6, 5, 'Choi', '초밥');

-- 6번 게시글의 댓글들
INSERT INTO comment(id, article_id, nickname, body) VALUES (7, 6, 'Park', '조깅');
INSERT INTO comment(id, article_id, nickname, body) VALUES (8, 6, 'Kim', '유튜브');
INSERT INTO comment(id, article_id, nickname, body) VALUES (9, 6, 'Choi', '독서');