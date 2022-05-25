DROP TABLE cfn_user;
DROP TABLE review;
DROP TABLE review_like;
DROP TABLE ad_cafe;
DROP SEQUENCE review_seq;
DROP TABLE board;
DROP SEQUENCE seq_board;
DROP TABLE cfn_comment;
DROP SEQUENCE seq_code;
DROP TABLE notice;
DROP SEQUENCE seq_notice_no;
DROP TABLE cafe;
DROP SEQUENCE seq_cafe_no;
DROP TABLE bookmark;


-- 유저
CREATE TABLE cfn_user
(
    user_id      VARCHAR2(30),
    user_pwd     VARCHAR2(30),
    user_nick    VARCHAR2(20) UNIQUE,
    user_tel     VARCHAR2(11),
    user_img     CLOB DEFAULT 'basic.png',
   
    PRIMARY KEY(user_id)
   
);

-- 리뷰
CREATE TABLE review
(
    cafe_no             NUMBER,
    review_no           NUMBER,
    review_userid       VARCHAR2(20),
    review_usernick     VARCHAR2(20),
    review_userimg      CLOB,
    review_date         DATE,
    review_like         NUMBER,
    review_star         NUMBER,
    review_content      CLOB,
    review_img          CLOB,
   
   PRIMARY KEY(review_no),
   FOREIGN KEY(cafe_no) REFERENCES cafe(cafe_no) ON DELETE CASCADE
   
);

-- 리뷰 좋아요
CREATE TABLE review_like
(
    review_no      NUMBER,
    like_user      VARCHAR2(20),
    like_check     VARCHAR2(10),
	
    FOREIGN KEY(review_no) REFERENCES review(review_no) ON DELETE CASCADE
);

-- 메인 페이지 광고
CREATE TABLE ad_cafe
(
	ad_cafe_no         NUMBER UNIQUE,
  	ad_cafe_info       VARCHAR2(1000),

	FOREIGN KEY(ad_cafe_no) REFERENCES cafe(cafe_no) ON DELETE CASCADE
);

-- 리뷰 시퀀스
CREATE SEQUENCE review_seq 
INCREMENT BY 1 
NOCYCLE 
NOCACHE;

-- 커뮤니티 게시판
CREATE TABLE board
(
    board_no             NUMBER,
    board_title          VARCHAR2(50),
    user_id         VARCHAR2(20),
    board_content       CLOB,
    board_date           DATE,
    board_img           CLOB,
    board_view          NUMBER,
   
    PRIMARY KEY(board_no)
   
);

-- 테이블 번호 시퀀스
create sequence seq_board;

-- 커뮤니티 게시판 댓글
CREATE TABLE cfn_comment
(
   comment_code             NUMBER,
   board_no              NUMBER,
   comment_no         NUMBER,
   comment_content   CLOB,
   comment_date      DATE,
   comment_img      CLOB,
   user_id      VARCHAR2(20),
   
   PRIMARY KEY(comment_code)   
);

--댓글 코드 시퀀스
create sequence seq_code;

-- 공지사항 게시판
CREATE TABLE notice
(
    notice_no           NUMBER,
    notice_title         VARCHAR2(100),
    notice_content    CLOB,
    notice_date         DATE,
    notice_img          CLOB,
    notice_view         NUMBER,
    notice_user          VARCHAR2(20),
    notice_check          VARCHAR2(20),
   
    PRIMARY KEY(notice_no)
);

-- 공지사항 게시글 시퀀스
CREATE SEQUENCE seq_notice_no
INCREMENT BY 1
start with 1
NOCACHE
NOCYCLE;

-- 카페 정보
CREATE TABLE cafe
(
    cafe_no        NUMBER,
    cafe_name      VARCHAR2(100),
    cafe_address   VARCHAR2(100),
    cafe_tel       VARCHAR2(20),
    cafe_img       CLOB DEFAULT 'cafe.jpg',
    cafe_region    VARCHAR2(10),
   
    PRIMARY KEY(cafe_no)
);

-- 카페 번호 부여 시퀀스
CREATE SEQUENCE seq_cafe_no
INCREMENT BY 1
start with 100
NOCACHE
NOCYCLE;

-- 카페-회원 매핑테이블(북마크 기능)
CREATE TABLE bookmark
(
    cafe_no          NUMBER,
    user_id          VARCHAR2(30),
   
   FOREIGN KEY(cafe_no) REFERENCES cafe(cafe_no) ON DELETE CASCADE,
   FOREIGN KEY(user_id) REFERENCES cfn_user(user_id) ON DELETE CASCADE
);