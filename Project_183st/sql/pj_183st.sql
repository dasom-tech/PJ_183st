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
);
CREATE SEQUENCE BBSNO NOCACHE;
COMMIT;

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
-----------------------------------------------------------------------------------------------

DROP TABLE ORDERLIST;
COMMIT;
-------------------------
CREATE TABLE ORDERINFO (
    ORDERID NUMBER PRIMARY KEY,
    ID VARCHAR2(30),
    NAME VARCHAR2(30),
    ADDR VARCHAR2(100),
    PHONE VARCHAR2(30),
    POINT NUMBER,
    TOTALPRICE NUMBER
);
----------------------------------------------
CREATE TABLE ORDERDETAIL (
    O_DETAILID NUMBER PRIMARY KEY,
    ORDERID NUMBER,
    PRODUCTNO   VARCHAR2(50 BYTE),
    O_AMOUNT NUMBER,
    PRICE NUMBER,
    PRODUCTNAME   VARCHAR2(80 BYTE),
    FOREIGN KEY (ORDERID) REFERENCES ORDERINFO(ORDERID)
);
--------------------------------------------
CREATE SEQUENCE ORDER_SEQ NOCACHE;
CREATE SEQUENCE O_DETAIL_SEQ NOCACHE;

DROP SEQUENCE ORDERNO;
--------------------------------
ALTER TABLE PRODUCTS
ADD IMAGE_S VARCHAR2(500);

ALTER TABLE PRODUCTS
ADD IMAGE_L VARCHAR2(1000);

ALTER TABLE CARTLIST
ADD IMAGE_S VARCHAR2(500);
COMMIT;
-------------------------------------------------

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L) 
VALUES('T100','T','20FW 에센셜 오버핏 후드 CREAM BRULEE',41860,65,'Cotton 100%***
복원력이 매우 우수한 하이텐션 퀄리티의 시보리 제작***
20FW의 트렌드 컬러 및 엘무드의 독자적 더스키함을 믹스한 자체 염색된 포인트 컬러들로 적재적소에 스타일 매칭이 가능***
일반 세탁기 테스트 결과 큰 수축률 및 변형없이 착용 가능 합니다.***
원단 특성상 뜨거운물 세탁과 건조기능은 가급적 피해주시길 바랍니다.','t100s.jpg','t100l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T101','T','에센셜 실켓 롱 슬리브 BLUE',43000,70,'Cotton 100%***
탄탄함과 고급스러움을 동시에 잡는 독자적인 실켓가공 방식***
표면의 깔끔한 결을 위한 바이오가공***
소매의 절개 라인과 옆트임으로 활동성 및 디자인적 요소 가미***
25~30도 이하 저온수 중성세제 사용/ 손세탁 권장','t101s.jpg','t101l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T102','T','에센셜 오버핏 맨투맨 BLACK',37800,1,'Cotton 100%***
850g에 달하는 고밀도의 탄탄한 쭈리 원단 개발***
기존 코마사에서 코마 컴팩사로 업그레이드***
수축을 최소화하기 위한 텐타/ 덤블 워싱 처리***
중성세제 사용/ 저온 다리미/ 손세탁 권장','t102s.jpg','t102l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T103','T','YOUNG 프리미엄 실켓 티셔츠',13000,20,'Cotton 100%***
50수의 굉장히 가는 프리미엄 컴팩사를 2합 고밀도로 편직***
세탁 축률 1% 이내로 변형 없이 오랜 기간 착용 가능한 엘무드 시그니처 원단***
가슴과 어깨가 넓어 보일 수 있도록 제작된 인체 공학적 입체 패턴 접목***
클래식 포멀 룩 무드로 신체 실루엣에 맞춰 매끈하게 떨어지는 핏 - 티셔츠 옆트임으로 활동성 및 심미적 요소 부여***
* 세탁 후 반드시 뉘어서 건조/ 건조기 사용 금지/ 옷걸이 건조 시 변형이 올 수 있음','t103s.jpg','t103l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T104','T','365 슬리브리스 WHITE',27920,42,'Cotton 50%, Tencel 15%, Polyester 30%, Span 5%***
텐셀이 함유된 부드러운 촉감으로 한 여름철에도 쾌적한 착용을 자랑하는 기능성 개발 원단
30수 2합 코마 강연사(MVS)로 편직된 원단에 텐셀이 함유되어 부드러운 촉감***
원단 표면감은 코튼재질이라 여름철 단품코디로도 좋고, 
원단 내부면은 기능 섬유 재질로서 데일리 룩, 운동복 등 적재적소 활용 가능***
찬물 세탁/ 저온 다리미','t104s.jpg','t104l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T105','T','익스클루시브 코튼 맨투맨 BLACK',34000,8,'Cotton 88% Polyester 10% Polyurethane 2%***
클래식 캐주얼 무드에 스타일쉬함을 더한 코튼 셋업***
2%의 폴리우레탄을 섞어 복원력과 전체적인 탄성력 강화로 우수한 활동성 부여***
퓨처리즘에서 영감을 받아 제작된 미래적이며 스트릿하고 여유로운 와이드 핏 연출***
드라이 클리닝','t105s.jpg','t105l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T106','T','에센셜 스탠다드 맨투맨 CREAM',36400,12,'Fabric Information, cotton 100%***
모든 시즌과 체형의 제약 없이 데일리 웨어로 착장 가능한 우수한 데일리 맨투맨 개발***
독자적으로 개발된 헤비 코튼 쮸리 원단 사용 및 갈라 삼봉 기법으로 완성도 높은 맨투맨 구현***
가볍고 편안한 착장을 위해 보다 가벼운 원단으로 제작***
원단 특성상 뜨거운물 세탁과 건조기능은 가급적 피해주시길 바랍니다.','t106s.jpg','t106l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T107','T','코어 후드 집업 자켓 MELANGE',57400,32,'Fabric Information, cotton 100%***
덴타/ 덤블/ 바이오 가공으로 수축과 변형 없이 착장 가능
착장 시, 시접에 의한 불편함 제거를 위하여 갈라 삼봉 봉제 기법 적용
판매량으로 인증된 엘무드의 기존 컬러로 풀어낸 제품으로 적재적소에 스타일링 가능
고급스러운 윤광을 위해 제품 컬러에 맞게 염색 후 도금 처리
*일반 세탁기 테스트 결과 큰 수축률 및 변형없이 착용 가능 합니다.
*원단 특성상 뜨거운물 세탁과 건조기능은 가급적 피해주시길 바랍니다.','t107s.jpg','t107l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T108','T','아머 니트 베스트 MOCHA BEIGE',90300,5,'Wool 60% Acrylic 20% Cashnylon 20%***
국내 최고 수준의 편사회사와 협업을 통해 새롭게 개발한 벌키 타입 소모사***
필링 방지에 탁월하며, 부드러움까지 공존하는 원사 - 7게이지 변형 골조직으로 편직으로 고밀도 고중량의 아머 베스트***
소매, 밑단, 절개 부분 더블 시보리 작업***
하프넥과 라운드넥의 중간 정도 되는 트렌디한 넥 라인***
아우터 위에 착용을 위해 변형 골조직 작업으로 유연성 있는 니트 제작***
드라이크리닝.','t108s.jpg','t108l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T109','T','뮬란 야크 니트 MULTI ORANGE',90300,5,'Merino Yak 25% Superfine Merino Wool 55% Cashnylon 15% Span 5%***
야크사중에서도 곱고 정제된 최우수한 원사들만 선별된 메리노 야크 원료 수입 방적 설계***
이태리 생산 라인을 통해, 멀티 멜란지 컬러로 선염 작업하여 세련된 색감과 독특한 텍스처로 생산***
듀퐁사의 프리미엄 스판사로 작업하여 착용감이 우수한 동시 안정감 있는 형태 라인***
적당한 세미오버핏으로 부담스럽지 않으며 원단에 고유한 느낌만을 살려 고객 취향에 맞게 다양한 코디 가능***
드라이크리닝.','t109s.jpg','t109l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T110','T','대한 캐시미어 니트 MELANGE GRAY',118300,53,'Cashmere 10% Superfine Merino Wool 65% Cashnylon 25%***
17마이크론의 호주산 수퍼 파인 메리노울 + 몽골산 캐시미어를 혼방한 프리미엄 방모사 사용***
정확한 데이터를 기반한 멜란지 선염 작업을 통해 퀄리티를 높여 원사 개발***
방모 고유의 까칠함을 걷어내고 부드러움을 극대화하며 동시의 보온성을 높인 제품***
고난도 7G 변형 골조직 편직하여 세련되고 안정감 있는 디자인***
드라이크리닝','t110s.jpg','t110l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T111','T','엘프 캐시미어 니트 BLACK',70850,9,'Wool 35% Cashmere 15% Acrylic 25% Cashnylon 25%***
몽골산 캐시미어를 사용하여, 매끈하며 부드러운 촉감, 뛰어난 보온성***
천연 유연 후가공 처리***
4G 버드 아이 조직 고밀도 편직***
국내 최초 준 소모사 안티 필링 원료 혼방***
드라이크리닝','t111s.jpg','t111l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T112','T','엘프 캐시미어 니트 ASH BLUE',70850,35,'Wool 35% Cashmere 15% Acrylic 25% Cashnylon 25%***
몽골산 캐시미어를 사용하여, 매끈하며 부드러운 촉감, 뛰어난 보온성***
천연 유연 후가공 처리***
4G 버드 아이 조직 고밀도 편직***
국내 최초 준 소모사 안티 필링 원료 혼방***
드라이크리닝','t112s.jpg','t112l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T113','T','알파카 노이즈 가디건 MULTI NAVY',68600,9,'Alpaca 10% Wool 20% Acrylic 43% Nylon 24% Span3%***
알파카의 단점을 보완하여 R&D 기술 개발 협업을 통해 독자적으로 새롭게 개발한 원사***
자연스러운 드롭 숄더 라인의 여유로운 실루엣***
이태리 생산 라인을 통해, 멀티 멜란지 컬러로 선염 작업하여 세련된 색감과 독특한 텍스처로 생산***
듀퐁사의 프리미엄 스판사로 작업하여 착용감이 우수한 동시 안정감 있는 형태 라인***
드라이크리닝','t113s.jpg','t113l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T114','T','화란 세미오버 니트 POP GREEN',79900,27,'WOOL 60% ACRYLIC 20% CASHNYLON23%***
21SS를 위한 업그레이드된 원사와 봄 시즌에 적합한 두께감으로 수정 및 개발***
20% 증가시킨 편직 도목(바퀴수)과 14게이지의 촘촘한 버드아이 조직으로 편직***
필링 문제 개선과 함께 천연 유연 가공으로 보다 더 부드러워진 터치감***
천연 유연 가공 처리로 옷의 수축 방지 강화***
이태리산 캐시나일론 원료 혼방','t114s.jpg','t114l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T115','T','코튼 유틸리티 후드 점퍼 MINT GREY',194000,35,'COTTON 100%***
일반적인 순수 면 소재에서 볼 수 없는 광택감과 부드러움을 지닌 최고급 이중 코튼 원단 사용***
바람막이의 근본적인 기능이 내재된 스트링, 포켓 등의 디테일 사용으로 실용적인 디자인***
기존의 스포티한 바람막이, 후드점퍼와 달리 미니멀한 디자인***
내구성 높은 자체제작 부자재 사용***
cotton100% 소재 특성상 구김이 있을 수 있습니다.','t115s.jpg','t115l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T116','T','390 지퍼 데님 자켓 CLOUD',189000,66,'COTTON 100%***
워싱 가공된 데님원단을 사용하여 낮은 이염 및 수축률***
탄탄하면서도 부드러운 터치감을 지닌 워싱가공 데님원단***
에비에이터 점퍼와 블루종 디자인을 데님원단과 결합함으로써 다양한 무드 연출***
투웨이 지퍼 사용으로 높은 활용도***
드롭 숄더라인의 오버핏 실루엣','t116s.jpg','t116l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T117','T','뉴페이스 후드 코트 CREAM',261000,54,'Wool 80% Nylon 10% Cashmere 10%***
25OZ의 무게감 있는 소재에 캐시미어를 블렌드 하여 부드럽고 고급스러운 원단***
중량 대비 뻣뻣하지 않아 편안한 착용감과 부드러운 터치감의 조화로운***
하프 래글런 숄더 라인의 여유로운 핏 감과 무너지지 않는 어깨 라인 디자인***
우수한 심미성과 내구성의 천연 너트 단추를 원단 컬러에 맞춰 염색 가공***
입체 패턴과 고급 봉제 기법을 접목시킨 높은 완성도의 디자인***
2온스 레이저 퀼팅 안감을 등판 안쪽에 한 번 더 부분 덧댐 하여 높은 보온성 유지엣','t117s.jpg','t117l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T118','T','알란 오버핏 더블 코트 PEACOCK BLUE',222000,17,'Wool 80% Cashmere 20%***
호주산 메리노울 방적 및 캐시미어 혼방***
울마크 컴퍼니 인증 23-24oz의 고밀도 프리미엄 울 원단***
캐시미어 20% 함유로 부드러운 터치감과 고급스러운 표면감***
기본에 충실한 더블코트로, 캐주얼부터 포멀한 스타일 연출 가능한 디테일을 지닌 디자인***
드랍숄더의 과하지 않은 오버핏으로 개발한 패턴과 센터 벤트 작업으로 높은 활동성v
캐시미어 함유량을 20%로 높여 보다 부드럽고, 고급스럽게 제작***
등판 안쪽에 레이저 퀼팅 부분 안감 추가***
테일러링에 적용되는 부자재 및 공법을 추가하여, 무너짐 없이 단단한 핏 감***
기존 A 라인으로 핏이 뜨던 현상을 개선','t118s.jpg','t118l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('T119','T','히든 벨티드 캐시미어 싱글 코트 SAND BEIGE',223500,23,'Wool 80% Cashmere 20%***
가장 기본에 충실한 싱글 벨트 코트로, 보이지 않는 곳까지 디테일을 잃지 않은 디자인***
2온스 레이저 퀼팅 안감을 등판 안쪽에 한 번 더 부분 덧댐 하여 높은 보온성 유지***
체형 보정과 동시에 최적의 라인을 형성하여 실측 사이즈에 구애받지 않는 입체 패턴 접목***
히든 단작으로 제작한 앞여밈 스타일로 깔끔한 디자인과 센터 벤트 작업으로 높은 활동성 유지***
벨트의 비죠 디테일로 벨트를 고정해 다양한 스타일링 가능***
드라이크리닝','t119s.jpg','t119l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B200','B','브리티쉬 캐시미어 턴업 슬랙스 CHARCOAL',83300,15,'Wool 80% Cashmere 20%***
가장 기본에 충실한 싱글 벨트 코트로, 보이지 않는 곳까지 디테일을 잃지 않은 디자인***
2온스 레이저 퀼팅 안감을 등판 안쪽에 한 번 더 부분 덧댐 하여 높은 보온성 유지***
체형 보정과 동시에 최적의 라인을 형성하여 실측 사이즈에 구애받지 않는 입체 패턴 접목***
히든 단작으로 제작한 앞여밈 스타일로 깔끔한 디자인과 센터 벤트 작업으로 높은 활동성 유지***
벨트의 비죠 디테일로 벨트를 고정해 다양한 스타일링 가능***
드라이크리닝','b200s.jpg','b200l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B201','B','썸머 울 세레니티 슬랙스',47400,26,'Wool 50%, Tetron 40%, Zentra 10%***
정통 클래식 및 비포스크 시장을 대표하는 원단들의 편직 방식을 현 트렌드에 맞게 재해석하여 개발***
한 여름에도 시원한 착용이 가능한 동시에 사계절에 구애 받지 않고 두루 착용할 수 있는 원사***
최고급, 고난도 봉제로 오랜 기간 착용 가능***
복원력이 우수하고 편안한 착용감을 위한 젠트라사가 함유되어 고급스러움과 편안함이 접목된 슬랙스***
울 원료 그레이드를 높여 울 고유의 까슬거리는 터치감을 최소화***
엘무드의 슬랙스 제품은 기장수선의 용이함을 위해 풀려 출고 됩니다.***
드라이 클리닝','b201s.jpg','b201l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B202','B','썸머 울 세미와이드 슬랙스',47400,54,'Wool 50%, Tetron 40%, Zentra 10%***
정통 클래식 및 비포스크 시장을 대표하는 원단들의 편직 방식을 현 트렌드에 맞게 재해석하여 개발***
한 여름에도 시원한 착용이 가능한 동시에 사계절에 구애 받지 않고 두루 착용할 수 있는 원사***
최고급, 고난도 봉제로 오랜 기간 착용 가능***
엘무드의 슬랙스 제품은 기장수선의 용이함을 위해 풀려 출고 됩니다.***
드라이 클리닝','b202s.jpg','b202l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B203','B','썸머 울 노블 슬랙스',47400,21,'Wool 50%, Tetron 40%, Zentra 10%***
정통 클래식 및 비포스크 시장을 대표하는 원단들의 편직 방식을 현 트렌드에 맞게 재해석하여 개발***
한 여름에도 시원한 착용이 가능한 동시에 사계절에 구애 받지 않고 두루 착용할 수 있는 원사***
복원력이 우수하고 편안한 착용감을 위한 젠트라사가 함유되어 고급스러움과 편안함이 접목된 슬랙스***
울 원료 그레이드를 높여 울 고유의 까슬거리는 터치감을 최소화
드라이 클리닝','b203s.jpg','b203l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B203','B','썸머 울 노블 슬랙스',47400,21,'Wool 50%, Tetron 40%, Zentra 10%***
정통 클래식 및 비포스크 시장을 대표하는 원단들의 편직 방식을 현 트렌드에 맞게 재해석하여 개발***
한 여름에도 시원한 착용이 가능한 동시에 사계절에 구애 받지 않고 두루 착용할 수 있는 원사***
복원력이 우수하고 편안한 착용감을 위한 젠트라사가 함유되어 고급스러움과 편안함이 접목된 슬랙스***
울 원료 그레이드를 높여 울 고유의 까슬거리는 터치감을 최소화
드라이 클리닝','b203s.jpg','b203l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B204','B','프리미엄 울 노블 슬랙스 CREAM(셋업용)',79000,60,'Fabric Information wool 60% tetron 30% zentra 10%***
고밀도의 짜임으로 직조된 프리미엄 울혼방 원단***
젠트라사 함유로 인한 우수한 복원력 및 착용감***
울마크컴퍼니의 인증된 원단으로 제작***
최고급 부자재 사용***
세미테이퍼드 "노블 핏"***
블레이저, 자켓류와 셋업착용 가능***
드라이크리닝 권장','b204s.jpg','b204l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B204','B','프리미엄 울 노블 슬랙스 CREAM(셋업용)',79000,60,'Fabric Information wool 60% tetron 30% zentra 10%***
고밀도의 짜임으로 직조된 프리미엄 울혼방 원단***
젠트라사 함유로 인한 우수한 복원력 및 착용감***
울마크컴퍼니의 인증된 원단으로 제작***
최고급 부자재 사용***
세미테이퍼드 "노블 핏"***
블레이저, 자켓류와 셋업착용 가능***
드라이크리닝 권장','b204s.jpg','b204l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B205','B','시그니처 와이드 슬랙스 MAUVE BEIGE',65900,72,'Fabric Information polyester 65%, rayon 30%, lycra 5%***
고밀도, 고중량, 사계절용 하이브리드 TR원단***
안티필링, 주름방지등 장점만을 집약한 개발 원단***
손세탁 및 드라이크리닝 권장***
기존 세미와이드에 핏감이 아쉬운 분들을 위해 제작되었습니다.***
전반적인 여유로운 핏감을 살리면서 안정화된 라인을 위해 원턱작업으로 제작되었습니다.***
여유로운 와이드핏을 원하시는분들께 추천드립니다.','b205s.jpg','b205l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B206','B','에센셜 우븐 트랙 팬츠 CLOUD',43200,69,'
탄탄하고 부드러운 터치감과 내츄럴한 윤광이 특징인 고밀도 CN 원단 사용***
겉면 코팅 작업으로 생활 방수가 가능하며, 안쪽 면은 흡습 · 속건을 유지하여 쾌적한 착용 가능***
전체 스티치에 코아사 사용을 통해 심미성과 내구성을 높임***
미니멀 스포티즘에 기반한 디자인으로, 활동성 · 실용성은 극대화하며 불필요한 디테일 삭제***
허리 안쪽에 밴딩과 스트링을 동시 작업하여, 착용 시 높은 안정감 구현***
살에 직접 닿는 시접 부분은 한 번 더 마무리 작업하여, 편안한 착용감 고려***
모든 체형을 아우르는 루즈한 조거핏','b206s.jpg','b206l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B207','B','익스클루시브 코튼 조거 팬츠 CHARCOAL',32000,9,'Cotton 88% Polyester 10% Polyurethane 2%***
프리미엄 코마사에 수입 폴리 섬유로 강연 처리 이후 고난이도 양면 편직한 원단***
내구성이 우수하며 탄탄함을 유지한 컴팩 가공***
고급스러운 윤기나며 터치감 및 우수한 원단***
여유롭고 박시하게 딱떨어지는 오버핏***
전체 밴딩에 와이드한 핏, 밑단 밴딩으로 스타일리쉬한 핏을 구현하는 조거 팬츠***
퓨처리즘에서 영감을 받아 제작된 미래적이며 스트릿한 무드 연출***드라이 클리닝','b207s.jpg','b207l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B208','B','센터 컷 코튼 트라우저 CREAM',50400,17,'Cotton 100%***
계절 구애 없이 착용 가능한 20수 치노 원단 사용***
하이 웨이스트 라인에 밑단으로 갈수록 좁아지는 세미 핏***
상동 부분은 여유롭고, 턱 디테일을 넣어서 편안한 착용감 선사***
클래식한 패턴에 트렌디한 디테일을 추가한 디자인***
드라이 클리닝','b208s.jpg','b208l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B209','B','테이퍼드 핏 치노 슬랙스 CEMENT',51800,66,'Cotton 98% Polyurethane 2%***
계절 구애 없이 착용 가능한 20수 치노 원단 사용***
신축성 있는 원단 사용하여, 자유로운 활동성과 편안한 착용감***
워싱 작업으로 마무리하여 변형과 수축 최소화***
슬림하게 떨어지는 테이퍼드 핏***
칼 주름 잡아서 다리 라인의 실루엣 보정 효과***
포멀 룩부터 캐주얼 코디까지 다양하게 매치할 수 있는 아이템***
드라이 클리닝','b209s.jpg','b209l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B210','B','원턱 와이드 치노 팬츠 BEGIE',47530,82,'Polyester 65% Rayon 30% Lycra 5%***
광택이 덜하고 탄탄함이 장점인 TR원단을 셀렉하여 제작***
특유의 벌룬 실루엣이 특징인 세미 배기 핏***
크롭하게 떨어지는 기장감과 밑단 디테일로, 런던의 신사적인 무드가 느껴지는 디자인***
상동 부분은 여유롭고, 턱 디테일을 넣어서 편안한 착용감 선사***
클래식한 패턴에 트렌디한 디테일을 추가한 디자인***
드라이 클리닝','b210s.jpg','b210l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B210','B','원턱 와이드 치노 팬츠 BEGIE',47530,82,'Polyester 65% Rayon 30% Lycra 5%***
광택이 덜하고 탄탄함이 장점인 TR원단을 셀렉하여 제작***
특유의 벌룬 실루엣이 특징인 세미 배기 핏***
크롭하게 떨어지는 기장감과 밑단 디테일로, 런던의 신사적인 무드가 느껴지는 디자인***
상동 부분은 여유롭고, 턱 디테일을 넣어서 편안한 착용감 선사***
클래식한 패턴에 트렌디한 디테일을 추가한 디자인***
드라이 클리닝','b210s.jpg','b210l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B211','B','프리미엄 울 세레니티 슬랙스 CHARCOAL',79000,21,'Fabric Information
wool 60% tetron 30% zentra 10%***
고밀도의 짜임으로 직조된 프리미엄 울혼방 원단***
젠트라사 함유로 인한 우수한 복원력 및 착용감***
울마크컴퍼니의 인증된 원단으로 제작***
최고급 부자재 사용***
블레이저, 자켓류와 셋업착용 가능***
드라이크리닝 권장','b211s.jpg','b211l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B212','B','프리미엄 울 노블 슬랙스 CHARCOAL',79000,17,'Fabric Information
wool 60% tetron 30% zentra 10%***
고밀도의 짜임으로 직조된 프리미엄 울혼방 원단***
젠트라사 함유로 인한 우수한 복원력 및 착용감***
울마크컴퍼니의 인증된 원단으로 제작***
최고급 부자재 사용***
블레이저, 자켓류와 셋업착용 가능***
*드라이크리닝 권장','b212s.jpg','b212l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B213','B','프리미엄 울 세미와이드 슬랙스 CHARCOAL',79000,43,'Fabric Information
wool 60% tetron 30% zentra 10%***
고밀도의 짜임으로 직조된 프리미엄 울혼방 원단***
젠트라사 함유로 인한 우수한 복원력 및 착용감***
울마크컴퍼니의 인증된 원단으로 제작***
최고급 부자재 사용***
블레이저, 자켓류와 셋업착용 가능','b213s.jpg','b213l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B214','B','EDM 히든밴딩 포멀 슬랙스 DUSKY GREY',67900,52,'Fabric Information
polyester 65%, rayon 30%, lycra 5%***
고밀도, 고중량, 사계절용 하이브리드 TR원단***
안티필링, 주름방지등 장점만을 집약한 개발 원단***
허리 히든 디테일 이중직 2단 밴딩 작업***
Easy(편안하게), Daily(매일매일), Multi(다양한코디)***
드라이크리닝 권장','b214s.jpg','b214l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B215','B','시그니처 테크니컬 슬랙스 BLACK',69900,70,'Fabric Information
polyester 65%, rayon 30%, lycra 5%***
고밀도, 고중량, 사계절용 하이브리드 TR원단***
안티필링, 주름방지등 장점만을 집약한 개발 원단***
엘라스틴 고밀도 이중직 밴딩 작업***
조절 끈, 자체팁 작업***
시그니처 라인***
손세탁 및 드라이크리닝 권장','b215s.jpg','b215l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B216','B','뉴 클래식 크롭 중청 데님',84000,35,'Cotton 100%/ 14oz***
여유롭게 떨어지면서 세련된 느낌으로 패턴화된 클래식 크롭 핏***
내추럴 노말 워싱 / 유연제 가공 처리로 착장 시 부드러운 촉감***
세계적인 친환경 데님 원단업체 보싸(BOSSA)의 원단을 채택, 수입하여 제작***
누렇거나 붉은 빛이 돌지 않는 퓨어한 크림컬러 내추럴 고밀도 데님 원단***
기존 데님 패턴과 차별화된 '테일러링'을 적용하여 입체감과 라인감에 집중한 패턴***
드라이 클리닝','b216s.jpg','b216l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B217','B','콘트라스트 스티치 데님 팬츠 BLACK',63000,37,'Cotton 100%***
셔츠 or 자켓 그 경계를 무너뜨린 웨어러블 한 아이템***
후발 워싱 작업(원단 상태로 워싱 가공)을 통해 수축과 이염 우려를 보완***
탄탄하며 내구성 좋은 수입 고밀도 데님 패브릭***
고밀도 데님 원단의 빳빳함이 아닌 부드러움이 공존하여 자연스러운 착용감을 선사***
배색 스티치와 포켓, 플리츠 디테일 등 다양한 포인트 요소와 차별화된 디자인***
중성세제 사용/ 그늘에서 건조/ 저온 다리미','b217s.jpg','b217l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B218','B','퓨어크림 클래식 크롭 데님',84000,2,'Fabric Information
13~14oz, 100%cotton***
고밀도 사계절용 터키 프리미엄 원단***
붉은빛이 전혀 안도는 독자적인 퓨어크림 컬러감***
코아사 사용 및 자체생산 부자재 부착***
수입 엑셀라 지퍼 부착***
클래식 데님의 장점을 극대화하고, 동양인의 체형의 맞춰 패턴화 된 "클래식 크롭핏"***
제품은 세탁시 손세탁 추천 드립니다','b218s.jpg','b218l.jpg') ;

INSERT INTO PRODUCTS(PRODUCTNO, PRODUCTTYPE, PRODUCTNAME, PRICE, STOCK, INFO, IMAGE_S, IMAGE_L)
VALUES('B219','B','뉴 슬림 LST 데님',84000,21,'Fabric Information
13~14oz, 100%cotton***
고밀도 사계절용 터키 프리미엄 원단***
붉은빛이 전혀 안도는 독자적인 퓨어크림 컬러감***
코아사 사용 및 자체생산 부자재 부착***
수입 엑셀라 지퍼 부착***
클래식 데님의 장점을 극대화하고, 동양인의 체형의 맞춰 패턴화 된 "클래식 크롭핏"***
제품은 세탁시 손세탁 추천 드립니다','b219s.jpg','b219l.jpg') ;
===================================================
DROP SEQUENCE  REVIEWID;

CREATE SEQUENCE REVIEW_SEQ NOCACHE;
---------------------------------------------------------
drop table orderdetail;
drop table orderinfo;
drop SEQUENCE ORDER_SEQ;
drop sequence O_DETAIL_SEQ;

CREATE TABLE ORDERINFO (
    ORDERID VARCHAR2(100) PRIMARY KEY,
    ID VARCHAR2(30),
    NAME VARCHAR2(30),
    ADDR VARCHAR2(100),
    PHONE VARCHAR2(30),
    POINT NUMBER,
    TOTALPRICE NUMBER
);
----------------------------------------------
CREATE TABLE ORDERDETAIL (
    O_DETAILID NUMBER PRIMARY KEY,
    ORDERID VARCHAR2(100),
    PRODUCTNO   VARCHAR2(50 BYTE),
    O_AMOUNT NUMBER,
    PRICE NUMBER,
    PRODUCTNAME   VARCHAR2(80 BYTE),
    FOREIGN KEY (ORDERID) REFERENCES ORDERINFO(ORDERID)
);
--------------------------------------------
CREATE SEQUENCE ORDER_SEQ NOCACHE;
CREATE SEQUENCE O_DETAIL_SEQ NOCACHE;

commit;
---------------------------------------------------
alter table orderdetail
add (image_s varchar2(500));
commit;
---------------------------------------







