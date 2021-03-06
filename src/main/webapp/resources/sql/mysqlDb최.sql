DROP TABLE FNQ;
DROP TABLE NOTICE_FILE_ATTACH;
DROP TABLE NOTICE; 
DROP TABLE SEAT;

DROP TABLE RENT;
DROP TABLE RETURNED;
DROP TABLE OVERDUE;
DROP TABLE BOOK_REPLY;
DROP TABLE BOOK;

DROP TABLE QAA;

DROP TABLE SIGN_OUT_MEMBER;
DROP TABLE MEMBER_LOG;
DROP TABLE MEMBER;
DROP TABLE DORMANT_MEMBER;


-- MEMBER(회원) 테이블 생성
CREATE TABLE MEMBER
(
    MEMBER_NO BIGINT AUTO_INCREMENT,                              -- 번호
    MEMBER_ID VARCHAR(100) NOT NULL UNIQUE,           -- 아이디
    MEMBER_PW VARCHAR(64) NOT NULL,                   -- 비밀번호
    MEMBER_NAME VARCHAR(100 ),                         -- 이름
    MEMBER_PHONE VARCHAR(20 ),                         -- 휴대전화번호
    MEMBER_EMAIL VARCHAR(100 ) NOT NULL UNIQUE,        -- 이메일
    MEMBER_POSTCODE VARCHAR(10 ),                      -- 주소(우편번호)
    MEMBER_ROAD_ADDRESS VARCHAR(100 ),                 -- 주소(도로명)
    MEMBER_DETAIL_ADDRESS VARCHAR(100 ),               -- 주소(상세)
    MEMBER_AGREE_STATE BIGINT,                              -- 동의여부
    MEMBER_SIGN_UP DATETIME NOT NULL,                           -- 가입일
    MEMBER_PW_MODIFIED DATETIME,                                -- 비번 수정일
    MEMBER_INFO_MODIFIED DATETIME,                              -- 회원정보 수정일
    MEMBER_SESSION_ID VARCHAR(50 ),                    -- 세션 아이디
    MEMBER_SESSION_LIMIT DATETIME,                               -- 세션 만료일
    PRIMARY KEY(MEMBER_NO)
);



-- MEMBER_LOG(회원 로그) 테이블 생성
CREATE TABLE MEMBER_LOG
(
    MEMBER_LOG_NO BIGINT NOT NULL AUTO_INCREMENT,              
    MEMBER_ID VARCHAR(100 ) NOT NULL,       
    MEMBER_LOG_SIGN_IN DATETIME,
    PRIMARY KEY(MEMBER_LOG_NO)
);



-- MEMBER_LOG 외래키
ALTER TABLE MEMBER_LOG
    ADD CONSTRAINT MEMBER_LOG_MEMBER_FK
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
            ON DELETE CASCADE;    -- 멤버의 정보를 삭제하면 해당 멤버의 로그가 함께 삭제된다.       


-- DORMANT_MEMBER(휴면 회원) 테이블 생성
CREATE TABLE DORMANT_MEMBER
(
    DORMANT_NO BIGINT NOT NULL AUTO_INCREMENT,
    MEMBER_NO BIGINT,                 
    MEMBER_ID VARCHAR(100 ) UNIQUE,      
    MEMBER_PW VARCHAR(64 ),         
    MEMBER_NAME VARCHAR(100 ),
    MEMBER_PHONE VARCHAR(20 ),
    MEMBER_EMAIL VARCHAR(100 ),  
    MEMBER_POSTCODE VARCHAR(10 ),                                 
    MEMBER_ROAD_ADDRESS VARCHAR(100 ),                 
    MEMBER_DETAIL_ADDRESS VARCHAR(100 ),               
    MEMBER_AGREE_STATE BIGINT,  
    MEMBER_SIGN_UP DATETIME NOT NULL,   
    MEMBER_PW_MODIFIED DATETIME,                                
    MEMBER_INFO_MODIFIED DATETIME,                              
    DORMANT_DATETIME DATETIME DEFAULT NOW(),
    PRIMARY KEY(DORMANT_NO)
);           




-- SIGN_OUT_MEMBER(탈퇴자) 테이블 생성
CREATE TABLE SIGN_OUT_MEMBER
(
    SIGN_OUT_NO BIGINT NOT NULL AUTO_INCREMENT,
    MEMBER_NO BIGINT,
    MEMBER_ID VARCHAR(100 ),
    MEMBER_NAME VARCHAR(100 ),
    MEMBER_PHONE VARCHAR(20 ),
    MEMBER_EMAIL VARCHAR(200 ),
    MEMBER_POSTCODE VARCHAR(10 ),                                 
    MEMBER_ROAD_ADDRESS VARCHAR(100 ),                 
    MEMBER_DETAIL_ADDRESS VARCHAR(100 ),               
    MEMBER_AGREE_STATE BIGINT,
    MEMBER_SIGN_UP DATETIME NOT NULL,
    SIGN_OUT DATETIME DEFAULT NOW(),
    PRIMARY KEY(SIGN_OUT_NO)
);



-- 4. 자주하는 질문 테이블
CREATE TABLE FNQ
(
    FNQ_NO BIGINT NOT NULL AUTO_INCREMENT,
    FNQ_TITLE VARCHAR(100 ),
    FNQ_CONTENT VARCHAR(1000 ),
    PRIMARY KEY(FNQ_NO)
);


-- 7. 공지사항 테이블
CREATE TABLE NOTICE
(
    NOTICE_NO BIGINT NOT NULL AUTO_INCREMENT,
    NOTICE_TITLE VARCHAR(500 ),
    NOTICE_CONTENT VARCHAR(4000 ),
    NOTICE_CREATED DATETIME DEFAULT NOW(),
    NOTICE_MODIFIED DATETIME,
    NOTICE_IP VARCHAR(30 ),
    NOTICE_HIT BIGINT,
    PRIMARY KEY(NOTICE_NO)
);


        


-- 8. 공지사항 파일첨부 테이블
CREATE TABLE NOTICE_FILE_ATTACH
(
   NOTICE_FILE_ATTACH_NO BIGINT NOT NULL AUTO_INCREMENT,
   NOTICE_FILE_ATTACH_PATH VARCHAR(300 ),
   NOTICE_FILE_ATTACH_ORIGIN VARCHAR(300 ),
   NOTICE_FILE_ATTACH_SAVED VARCHAR(40 ),
   NOTICE_NO BIGINT NOT NULL,
   PRIMARY KEY(NOTICE_FILE_ATTACH_NO)
);


-- 공지사항 테이블 외래키
ALTER TABLE NOTICE_FILE_ATTACH
    ADD CONSTRAINT NOTICE_FILE_ATTACH_NOTICE_FK
        FOREIGN KEY(NOTICE_NO) REFERENCES NOTICE(NOTICE_NO)
            ON DELETE CASCADE;
            

-- 좌석 테이블
CREATE TABLE SEAT(
    SEAT_NO BIGINT AUTO_INCREMENT,   -- 좌석 번호(1~100고정)
    MEMBER_NO BIGINT,             -- 이용 회원 번호
    SEAT_STATUS BIGINT,           -- 좌석 이용 여부(1가능 or 2불가능)
    SEAT_DATETIME DATETIME,               -- 입실시간
    SEAT_CODE BIGINT,              -- 좌석코드6자리랜덤(순번표?좌석표? 같은거임 퇴실할 때도 찍음.)
    PRIMARY KEY(SEAT_NO)
);

-- 좌석 테이블 외래키
ALTER TABLE SEAT 
    ADD CONSTRAINT SEAT_MEMBER_FK 
        FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO) 
            ON DELETE CASCADE;              -- SEAT < MEMBER FK



CREATE TABLE BOOK
(   
    BOOK_NO BIGINT AUTO_INCREMENT,
    BOOK_ISBN VARCHAR(50 ),
    BOOK_TITLE VARCHAR(300 ),
    BOOK_AUTHOR VARCHAR(100 ),
    BOOK_PUBLISHER VARCHAR(50 ),
    BOOK_PUBDATETIME VARCHAR(20 ),
    BOOK_DESCRIPTION VARCHAR(8000 ),
    BOOK_IMAGE VARCHAR(500 ),
    BOOK_FIELD VARCHAR(20 ),
    PRIMARY KEY(BOOK_NO)
);    
   

CREATE TABLE BOOK_REPLY
(
    BOOK_REPLY_NO BIGINT AUTO_INCREMENT,
    BOOK_NO BIGINT,
    MEMBER_ID VARCHAR(100 ),
    BOOK_REPLY_CONTENT VARCHAR(500 ),
    BOOK_REPLY_CREATED DATETIME,
    BOOK_RATING BIGINT,
    PRIMARY KEY(BOOK_REPLY_NO)
);  


ALTER TABLE BOOK_REPLY ADD CONSTRAINT BOOK_REPLY_BOOK_FK FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO);
ALTER TABLE BOOK_REPLY ADD CONSTRAINT BOOK_REPLY_MEMBER_FK FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE;

-- 1. 대여 테이블 생성
CREATE TABLE RENT
(
    RENT_NO BIGINT NOT NULL AUTO_INCREMENT,
    BOOK_NO BIGINT,
    MEMBER_ID VARCHAR(100 ) NOT NULL,
    RENT_DATETIME DATETIME DEFAULT NOW(),
    RENT_EXPIRATION_DATETIME DATETIME DEFAULT NOW(),
    PRIMARY KEY(RENT_NO)
);


-- 대여 테이블 외래키
ALTER TABLE RENT
    ADD CONSTRAINT RENT_BOOK_FK
        FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO)
            ON DELETE CASCADE;   
            
ALTER TABLE RENT
    ADD CONSTRAINT RENT_MEMBER_FK
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
            ON DELETE CASCADE; 

-- 2. 반납 테이블 생성
CREATE TABLE RETURNED
(
    RETURNED_NO BIGINT NOT NULL AUTO_INCREMENT,
    BOOK_NO BIGINT,
    MEMBER_ID VARCHAR(100 ) NOT NULL,
    RETURNED_DATETIME DATETIME DEFAULT NOW(),
    PRIMARY KEY(RETURNED_NO)
);


-- 반납 테이블 외래키
ALTER TABLE RETURNED
    ADD CONSTRAINT RETURNED_BOOK_FK
        FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO)
            ON DELETE CASCADE; 

ALTER TABLE RETURNED
    ADD CONSTRAINT RETURNED_MEMBER_FK
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
            ON DELETE CASCADE; 
            
-- 3. 연체 테이블 생성
CREATE TABLE OVERDUE
(
    OVERDUE_NO BIGINT NOT NULL AUTO_INCREMENT,
    BOOK_NO BIGINT,
    MEMBER_ID VARCHAR(100 ) NOT NULL,
    RENT_EXPIRATION_DATETIME DATETIME,
    PRIMARY KEY(OVERDUE_NO)
);


-- 연체 테이블 외래키
ALTER TABLE OVERDUE
    ADD CONSTRAINT OVERDUE_BOOK_FK
        FOREIGN KEY(BOOK_NO) REFERENCES BOOK(BOOK_NO)
            ON DELETE CASCADE; 

ALTER TABLE OVERDUE
    ADD CONSTRAINT OVERDUE_MEMBER_FK
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
            ON DELETE CASCADE; 
            

-- 6. 문의 테이블
CREATE TABLE QAA
(
    QAA_NO BIGINT NOT NULL AUTO_INCREMENT,
    MEMBER_ID VARCHAR(100) NOT NULL,
    QAA_TITLE VARCHAR(100),
    QAA_CONTENT VARCHAR(500),
    QAA_CREATED DATETIME DEFAULT NOW(),
    QAA_MODIFIED DATETIME,
    QAA_DEPTH BIGINT,
    QAA_GROUP_NO BIGINT,
    QAA_GROUP_ORD BIGINT,
    PRIMARY KEY(QAA_NO)
);

   
-- 문의 테이블 외래키
ALTER TABLE QAA
    ADD CONSTRAINT QAA_MEMBER_FK
        FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
            ON DELETE CASCADE;


commit;
