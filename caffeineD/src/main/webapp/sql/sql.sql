drop table review_like;
drop table review;
drop table cfn_user;
drop table cafe;
drop table bookmark;

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

-- 카페 정보
CREATE TABLE cafe
(
    cafe_no         NUMBER,
    cafe_name      VARCHAR2(50),
    cafe_address      VARCHAR2(100),
    cafe_tel         VARCHAR2(15),
    cafe_img          CLOB DEFAULT 'cafe.jpg',
    cafe_region         VARCHAR2(10),
   
    PRIMARY KEY(cafe_no)
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

-- 카페 번호 부여 시퀀스
CREATE SEQUENCE seq_cafe_no
INCREMENT BY 1
start with 100
NOCACHE
NOCYCLE;

-- 리뷰 시퀀스
CREATE SEQUENCE review_seq INCREMENT BY 1 NOCYCLE NOCACHE;

— 리뷰 좋아요
CREATE TABLE review_like
(
    review_no      NUMBER,
    like_user      VARCHAR2(20),
    like_check     VARCHAR2(10),
	
    FOREIGN KEY(review_no) REFERENCES review(review_no) ON DELETE CASCADE
);

-- 카페-회원 매핑테이블(북마크 기능)
CREATE TABLE bookmark
(
    cafe_no              NUMBER,
    user_id          VARCHAR2(30),
   
   FOREIGN KEY(cafe_no) REFERENCES cafe(cafe_no) ON DELETE CASCADE,
   FOREIGN KEY(user_id) REFERENCES cfn_user(user_id) ON DELETE CASCADE
);


INSERT INTO review
values(1, 4, 'jeeesubb@naver.com', '숩숩', 'userProf.jpg', '2022-05-16', 0, 5, '지나가다가 들러봤는데 앞으로 자주 가게 될 것 같아요', null);

INSERT INTO review
values(1, 3, 'wlqls12@naver.com', '수빙글', 'basic.png', '2022-05-14', 0, 5, '저 또 왔어요!', null);

INSERT INTO review
values(1, 2, 'wlqls12@naver.com', '수빙글', 'basic.png', '2022-04-22', 0, 5, '최애 카페중 하나인데요 경대 근처에 빵은 빵답고 커피 가격도 착해서 자주 가요!!', 'KakaoTalk_Photo_2022-05-13-00-33-38.jpeg');

INSERT INTO review
values(1, 1, 'wlqls12@naver.com', '지숩', 'basic.png', '2022-04-10', 3, 4, '사장님 넘 친절하고 분위기도 좋아요! 커피도 빵도 넘 저렴한데 맛있기까지 집에 왔는데 바질피자랑 소시지빵 또 생각납니다~ 또 먹으러 갈게요!!', 'KakaoTalk_Photo_2022-05-13-00-33-49.jpeg');

INSERT INTO cfn_user
VALUES ('admin', 'admin', '관리자', null, 'basic.png');

INSERT INTO cfn_user
VALUES ('wlqls12@naver.com', '1234', '수빙글', '01012341234', 'basic.png');

INSERT INTO cfn_user
VALUES ('jeeesubb@naver.com', '1234', '숩숩', '01012341234', 'userProf.jpg');

commit;