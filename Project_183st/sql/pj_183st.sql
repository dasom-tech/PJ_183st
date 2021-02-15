-- 회원 테이블
CREATE TABLE MEMBERS (
    ID VARCHAR2(35) PRIMARY KEY,
    PWD VARCHAR2(50),
    NAME VARCHAR2(30),
    EMAIL VARCHAR2(80),
    ADDR VARCHAR2(100),
    PHONE VARCHAR2(30),
    POINT NUMBER
);
COMMIT;

-- 상품 정보 테이블
CREATE TABLE PRODUCTS (
    PRODUCTNO VARCHAR2(50) PRIMARY KEY,
    PRODUCTTYPE VARCHAR2(30),
    PRODUCTNAME VARCHAR2(80),
    PRICE NUMBER,
    STOCK NUMBER,
    INFO VARCHAR2(1000)
);


-- 상품 후기 테이블
CREATE TABLE REVIEWLIST (
    REVIEWID NUMBER,
    PRODUCTNO VARCHAR2(50), 
    ID VARCHAR2(35), 
    REVIEW VARCHAR2(1000),
    R_REG DATE DEFAULT SYSDATE,
    FOREIGN KEY (PRODUCTNO) REFERENCES PRODUCTS(PRODUCTNO),
    FOREIGN KEY (ID) REFERENCES MEMBERS(ID)
);

-- 문의 테이블
CREATE TABLE QNALIST (
    PRODUCTNO VARCHAR2(50),
    ID VARCHAR2(35), 
    CONTACT VARCHAR2(1000),
    CATEGORY VARCHAR2(30),
    SUBJECT VARCHAR2(50)
    BBS_NO NUMBER(씨퀀스)
    Q_REG DATE DEFAULT SYSDATE,
    FOREIGN KEY (PRODUCTNO) REFERENCES PRODUCTS(PRODUCTNO),
    FOREIGN KEY (ID) REFERENCES MEMBERS(ID)
    CREATE SEQUENCE BBSNO NOCACHE;
);

-- 주문 내역 테이블
CREATE TABLE ORDERLIST (
    ORDERNO NUMBER PRIMARY KEY,
    PRODUCTNO VARCHAR2(50),
    ID VARCHAR2(35),
    O_AMOUNT NUMBER,
    O_ADDR VARCHAR2(100),
    O_PHONE VARCHAR2(30),
    FOREIGN KEY (PRODUCTNO) REFERENCES PRODUCTS(PRODUCTNO),
    FOREIGN KEY (ID) REFERENCES MEMBERS(ID)    
);

-- 장바구니 테이블
CREATE TABLE CARTLIST (
    CARTID NUMBER PRIMARY KEY,
    PRODUCTNO VARCHAR2(50),
    ID VARCHAR2(35),
    C_AMOUNT NUMBER,
    FOREIGN KEY (PRODUCTNO) REFERENCES PRODUCTS(PRODUCTNO),
    FOREIGN KEY (ID) REFERENCES MEMBERS(ID) 
);

CREATE SEQUENCE REVIEWID NOCACHE;
CREATE SEQUENCE ORDERNO NOCACHE;
CREATE SEQUENCE CARTID NOCACHE;
--===================================================================

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T102','T','여성용강아지티셔츠',14500,65,'강아지가 그려진 티셔츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T103','T','여성용토끼티셔츠',14500,70,'토끼가 그려진 티셔츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T104','T','여성용양티셔츠',14800,38,'양이 그려진 티셔츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T105','T','남성용곰돌이티셔츠',15000,52,'곰돌이가 그려진 티셔츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T106','T','남성용고양이티셔츠',16500,47,'고양이가 그려진 티셔츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T107','T','남성용강아지티셔츠',14500,65,'강아지가 그려진 티셔츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T108','T','남성용토끼티셔츠',14500,70,'토끼가 그려진 티셔츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T109','T','남성용양티셔츠',14800,38,'양이 그려진 티셔츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T110','T','여성용패턴블라우스',35000,80,'패턴 블라우스 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T111','T','여성용골덴블라우스',45000,80,'골덴 블라우스 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T112','T','여성용화이트블라우스',39000,38,'화이트 블라우스 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T113','T','여성용블랙블라우스',42000,50,'블랙 블라우스 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T114','T','여성용베이지니트',58000,60,'베이지 니트 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T115','T','여성용꽈배기니트',53000,60,'꽈배기 니트 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T116','T','남성용꽈배기니트',63000,50,'꽈배기 니트 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T117','T','남성용블루니트',58000,50,'블루 니트 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T118','T','남성용기본와이셔츠',48000,50,'기본 와이셔츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T119','T','남성용줄무늬와이셔츠',49000,50,'줄무늬 와이셔츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T200','B','남성용와이드팬츠',49000,50,'와이드 팬츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T201','B','남성용배기팬츠',53000,50,'배기 팬츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T202','B','남성용일자팬츠',54000,50,'일자 팬츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T203','B','남성용부츠컷팬츠',57000,50,'부츠컷 팬츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T204','B','남성용방한팬츠',59000,50,'방한 팬츠 남성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T205','B','여성용와이드팬츠',49000,50,'와이드 팬츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T206','B','여성용배기팬츠',53000,50,'배기 팬츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T207','B','여성용일자팬츠',54000,50,'일자 팬츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T208','B','여성용부츠컷팬츠',57000,50,'부츠컷 팬츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T209','B','여성용방한팬츠',59000,50,'방한 팬츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T210','B','여성용스키니팬츠',52000,50,'스키니 팬츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T211','B','여성용숏팬츠',38000,50,'숏 팬츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T212','B','여성용하프팬츠',48000,50,'하프 팬츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T213','B','여성용하이웨스트팬츠',51000,50,'하이웨스트 팬츠 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T214','B','여성용하이웨스트스커트',52000,50,'하이웨스트 스커트 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T215','B','여성용H라인스커트',48000,50,'H라인 스커트 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T216','B','여성용A라인스커트',47000,50,'A라인 스커트 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T217','B','여성용미니스커트',44000,50,'미니 스커트 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T218','B','여성용롱스커트',48000,50,'롱 스커트 여성용') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO) 
VALUES('T219','B','여성용청스커트',43000,50,'청 스커트 여성용') ;
===================================================

ALTER TABLE QNALIST ADD(SUBJECT VARCHAR2(50));
------------------------------------------------------------------

CREATE SEQUENCE BBSNO NOCACHE;
ALTER TABLE QNALIST ADD(BBS_NO NUMBER);
------------------------------------------------------------------------------------

ALTER TABLE QNALIST ADD(Q_REG DATE DEFAULT SYSDATE);
ALTER TABLE REVIEWLIST ADD(R_REG DATE DEFAULT SYSDATE);
COMMIT;
---------------------------------------------------------------------------

SELECT SUBSTR(PRODUCTNO,2,4) FROM PRODUCTS;
UPDATE  PRODUCTS
SET     PRODUCTNO = 'B'||SUBSTR(PRODUCTNO,2,4)
WHERE   PRODUCTTYPE = 'B' ;
COMMIT;
