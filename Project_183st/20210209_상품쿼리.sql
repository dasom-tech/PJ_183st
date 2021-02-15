
-- 1. ��ǰ ����Ʈ ��ȸ
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
    WHERE   1 = 1               -- ALL�� ���
         -- PRODUCTTYPE = 'T'   -- TOP�� ���
         -- PRODUCTTYPE = 'B'   -- BOTTOM�� ���
    ORDER BY PRODUCTNO 
) A
WHERE A.RNUM BETWEEN 11 AND 40 -- strNum / endNum
;

-- 2. ��ǰ ����ȸ
SELECT  PRODUCTNO
      , PRODUCTTYPE
      , PRODUCTNAME
      , PRICE
      , STOCK
      , INFO
FROM    PRODUCTS
WHERE   PRODUCTNO = 'T110' --ǰ��
;

-- 3. ��ǰ ��ٱ��� �ֱ�
-- 3-1) CARTLIST�� INSERT�� ���� ��������
-- CARTID
SELECT CASE WHEN CARTID.CURRVAL IS NULL THEN 0
        ELSE CARTID.NEXTVAL END CARTID FROM DUAL ;

-- ID, PRODUCTNO, O_AMOUNT(PRICE * ����)�� ȭ�鿡�� ��������
INSERT INTO CARTLIST(CARTID, PRODUCTNO, ID, C_AMOUNT)
VALUES('','','',) ;


-- 4. ��ǰ �ֹ��ϱ�
-- 4-1) ��ǰ ��� ������Ʈ
UPDATE  PRODUCTS
SET     STOCK = STOCK - 2   --�ֹ��� ����
WHERE   PRODUCTNO = 'T110'  --ǰ��
;

-- 4-2) ORDERLIST�� INSERT�� ���� ��������
-- ORDERNO
SELECT CASE WHEN ORDERNO.CURRVAL IS NULL THEN 0
       ELSE ORDERNO.NEXTVAL END ORDERNO FROM DUAL ;

-- PRODUCTNO, O_AMOUNT(PRICE * ����)�� ȭ�鿡�� ��������

-- ID, O_ADDR, O_PHONE
SELECT  ID
      , ADDR O_ADDR
      , PHONE O_PHONE
FROM    MEMBERS
WHERE   ID = '' --�����ID
;

-- 4-3) 4-2)���� ������ ���� ORDERLIST�� INSERT
INSERT INTO ORDERLIST(ORDERNO, PRODUCTNO, ID, O_AMOUNT, O_ADDR, O_PHONE)
VALUES(ORDERNO.NEXTVAL,'','',,'','') ;




