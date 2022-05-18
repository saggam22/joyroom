-- 유저 정보
CREATE TABLE cfn_user
(
    user_id          VARCHAR2(30),
   user_pwd           VARCHAR2(30),
    user_nick           VARCHAR2(20),
    user_tel         VARCHAR2(11),
    user_img          CLOB,
   user_grade      VARCHAR2(10),
   
    PRIMARY KEY(user_id)
   
);

-- 공지사항 게시판
CREATE TABLE notice
(
    notice_no           NUMBER,
    notice_title         VARCHAR2(50),
    notice_content    CLOB,
    notice_date         DATE,
    notice_img          CLOB,
    notice_view         NUMBER,
    notice_user          VARCHAR2(20),
   
    PRIMARY KEY(notice_no)
   
);

-- 커뮤니티 게시판
CREATE TABLE board
(
   board_no             NUMBER,
    board_title          VARCHAR2(50),
   board_user          VARCHAR2(20),
    board_content       CLOB,
    board_date           DATE,
    board_img           CLOB,
    board_view          NUMBER,
   
    PRIMARY KEY(board_no)
   
);

-- 커뮤니티 게시판 댓글
CREATE TABLE cfn_comment
(
   board_no              NUMBER,
   comment_no         NUMBER,
   comment_content   CLOB,
   comment_date      DATE,
   comment_img      CLOB,
   comment_user      VARCHAR2(20),
   
   PRIMARY KEY(comment_no),
   FOREIGN KEY(board_no) REFERENCES board(board_no)
   
);

-- 커뮤니티 게시판 대댓글
CREATE TABLE cfn_recomment
(
   comment_no               NUMBER,
   recomment_no         NUMBER,
   recomment_content      CLOB,
   recomment_date         DATE,
   recomment_img          CLOB,
   recomment_user         VARCHAR2(20),
   
   PRIMARY KEY(recomment_no),
   FOREIGN KEY(comment_no) REFERENCES cfn_comment(comment_no)
   
);

-- 카페 정보
CREATE TABLE cafe
(
    cafe_no         NUMBER,
    cafe_name      VARCHAR2(30),
    cafe_address      VARCHAR2(100),
    cafe_tel         VARCHAR2(15),
    cafe_img          CLOB,
    cafe_region         VARCHAR2(10),
   
    PRIMARY KEY(cafe_no)
);

-- 카페 리뷰
CREATE TABLE review
(
    cafe_no              NUMBER,
    review_user          VARCHAR2(20),
    review_date          DATE,
    review_like          NUMBER,
   review_star          NUMBER,
    review_content      CLOB,
    review_img          CLOB,
   
    FOREIGN KEY(cafe_no) REFERENCES cafe(cafe_no)
   
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
    cafe_no              NUMBER,
    user_id          VARCHAR2(30),
   
   FOREIGN KEY(cafe_no) REFERENCES cafe(cafe_no),
   FOREIGN KEY(user_id) REFERENCES cfn_user(user_id)
);

-- 유저 정보 전화번호 컬럼 수정(필요시 사용)
alter table cfn_user modify (user_tel VARCHAR2(11));

-- 카페 정보 컬럼 추가(필요시 사용)
alter table cafe add (cafe_region VARCHAR2(10));