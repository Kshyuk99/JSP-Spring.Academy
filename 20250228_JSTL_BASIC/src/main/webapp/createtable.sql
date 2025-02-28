CREATE DATABASE book_management;

USE book_management;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    year INT NOT NULL
);

DELETE FROM books;

-- 한국 도서 테스트 데이터 삽입
INSERT INTO books (title, author, publisher, year) VALUES
('혼자 공부하는 자바', '신용권', '한빛미디어', 2020),
('자바의 정석', '남궁성', '도우출판', 2004),
('Ego 트립', '정우영', '리더스북', 2018),
('클린 코드', '로버트 C. 마틴', '인사이트', 2009),
('Do it! 자바Script', '윤인성', '이지스퍼블리싱', 2021),
('파이썬으로 데이터 분석 시작하기', '한빛미디어', '한빛미디어', 2020),
('디지털 미니멀리즘', '칼 뉴포트', '윌북', 2019),
('책 읽어주는 남자', '김지혜', '마음의숲', 2019),
('불행을 막는 경제학', '홍춘욱', '미래의창', 2017),
('성공하는 사람들의 7가지 습관', '스티븐 코비', '김영사', 2015);