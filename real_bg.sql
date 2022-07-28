Drop table USER_t;


create table USER_t(
    userID VARCHAR2(20),
    userPassword VARCHAR2(10),
    userName VARCHAR2(10),
    userGender VARCHAR2(10),
    userEmail VARCHAR2(20)
    
);
insert into USER_t values('kkan','1234','깐쇼','남','kkan@naver.com');
insert into USER_t values('dong','1234','동원','남','dong@naver.com');
insert into USER_t values('spring','1234','봄이','여','sping@naver.com');
insert into USER_t values('moon','1234','희인','여','moon@naver.com');
commit;

SELECT
    *
FROM USER_t;





DROP TABLE t_board CASCADE CONSTRAINTS;

create table t_board(
    articleNO number(10),
    parentNO number(10) default 0,
    title varchar2(500) not null,
    content varchar2(4000),
    imageFileName varchar2(30),
    writedate date default sysdate not null,
    userID varchar2(10)
);

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, userID)
values(1, 0, '질문있어요', '미국여행 어떤가요.', null, sysdate, 'kkan');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, userID)
values(2, 1, '답변입니다.', '여행 후기에 대한 내용입니다.', null, sysdate, 'dong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, userID)
values(3, 0, '가입인사', '봄이 가입인사드려요', null, sysdate, 'spring');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, userID)
values(4, 3, '답변입니다', '반갑습니다', null, sysdate, 'moon');


commit;

SELECT
    *
FROM t_board;


SELECT LEVEL,
       articleNO,
       parentNO,
       LPAD(' ', 4*(LEVEL-1)) || title title,
       content,
       writeDate,
       userID
       FROM t_board
       START WITH parentNO=0
       CONNECT BY PRIOR articleNO=parentNO
       ORDER SIBLINGS BY articleNO DESC;
       



