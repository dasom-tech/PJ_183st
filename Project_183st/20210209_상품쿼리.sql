
-- 1. 상품 리스트 조회
SELECT  A.PRODUCTNO
      , A.PRODUCTTYPE
      , A.PRODUCTNAME
      , A.PRICE
      , A.STOCK
      , A.INFO
      , A.RNUM
FROM (
    SELECT  PRODUCTNO
          , PRODUCTTYPE
          , PRODUCTNAME
          , PRICE
          , STOCK
          , INFO
          , ROWNUM RNUM
    FROM    PRODUCTS
    WHERE   1 = 1               -- ALL인 경우
         -- PRODUCTTYPE = 'T'   -- TOP인 경우
         -- PRODUCTTYPE = 'B'   -- BOTTOM인 경우
    ORDER BY PRODUCTNO 
) A
WHERE A.RNUM BETWEEN 11 AND 40 -- strNum / endNum
;

-- 2. 상품 상세조회
SELECT  PRODUCTNO
      , PRODUCTTYPE
      , PRODUCTNAME
      , PRICE
      , STOCK
      , INFO
FROM    PRODUCTS
WHERE   PRODUCTNO = 'T110' --품번
;

-- 3. 상품 장바구니 넣기
-- 3-1) CARTLIST에 INSERT할 정보 가져오기
-- CARTID
SELECT CASE WHEN CARTID.CURRVAL IS NULL THEN 0
        ELSE CARTID.NEXTVAL END CARTID FROM DUAL ;

-- ID, PRODUCTNO, O_AMOUNT(PRICE * 수량)은 화면에서 가져오기
INSERT INTO CARTLIST(CARTID, PRODUCTNO, ID, C_AMOUNT)
VALUES('','','',) ;


-- 4. 상품 주문하기
-- 4-1) 상품 재고 업데이트
UPDATE  PRODUCTS
SET     STOCK = STOCK - 2   --주문한 수량
WHERE   PRODUCTNO = 'T110'  --품번
;

-- 4-2) ORDERLIST에 INSERT할 정보 가져오기
-- ORDERNO
SELECT CASE WHEN ORDERNO.CURRVAL IS NULL THEN 0
       ELSE ORDERNO.NEXTVAL END ORDERNO FROM DUAL ;

-- PRODUCTNO, O_AMOUNT(PRICE * 수량)은 화면에서 가져오기

-- ID, O_ADDR, O_PHONE
SELECT  ID
      , ADDR O_ADDR
      , PHONE O_PHONE
FROM    MEMBERS
WHERE   ID = '' --사용자ID
;

-- 4-3) 4-2)에서 가져온 정보 ORDERLIST에 INSERT
INSERT INTO ORDERLIST(ORDERNO, PRODUCTNO, ID, O_AMOUNT, O_ADDR, O_PHONE)
VALUES(ORDERNO.NEXTVAL,'','',,'','') ;




