create table member(
name varchar2(30) not null,
id varchar2(30) unique, --기본키, unique, not null, 무결성 제약 조건
pwd varchar2(100) not null,// 100으로 수정함
// 삭제 gender varchar2(3),
email1 varchar2(20),
email2 varchar2(20),
tel1 varchar2(10),
tel2 varchar2(10),
tel3 varchar2(10),
zipcode varchar2(10),
address varchar2(100),
addressDetail varchar2(100),
profileImg varchar2(50),
nickName varchar2(50),
logtime date);