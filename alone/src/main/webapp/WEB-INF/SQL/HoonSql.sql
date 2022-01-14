-- 고객센터 => 수강신청 테이블 ( 진모형 로그인 성공하시면 그때 테이블 수정합니다! )
create table TBL_CLASS_BOARD(
    class_board_number number primary key,
    class_board_enroll varchar2(40) not null,
    class_board_title varchar2(300) not null,
    class_board_content varchar2(3000) not null,
    class_board_userid varchar2(40) not null,
    class_board_postdate timestamp default SYSDATE ,
    class_board_viewcnt number,
    class_board_comment varchar2(500)
);

drop table tbl_class_board;


-- 고객센터 => 수강신청 테이블 ( 수정 후 )
create table tbl_class_board(
	class_board_number number primary key,
	class_board_enroll varchar2(40) not null,
	class_board_title varchar2(300) not null,
	class_board_content varchar2(3000) not null,
	class_board_userid varchar2(50) references tbl_member(userid) not null,
    class_board_postdate timestamp default SYSDATE ,
    class_board_viewcnt number,
    class_board_comment varchar2(500)
);

-- 고객센터 => 수강신청 테이블  ( 조회 수 추가 , 댓글은 댓글 테이블에서 만듦. ) 
create table tbl_class_board(
	class_board_number number primary key,
	class_board_enroll varchar2(40) not null,
	class_board_title varchar2(300) not null,
	class_board_content varchar2(3000) not null,
	class_board_userid varchar2(50) references tbl_member(userid) not null,
    class_board_postdate timestamp default SYSDATE ,
    class_board_viewcnt number default 0 not null
);

-- 댓글 테이블 (아이디와 게시판 번호를 참조할 수 있게 수정 , 기본 키는 아이디 , 상담자 일회성 댓글만 보임.) 
create table tbl_class_board_comment(
    class_board_comment_no number references tbl_class_board(class_board_number),
    class_board_comment_content varchar2(300) not null,
    class_board_comment_userid varchar(50) references tbl_member(userid) not null primary key,
    class_board_comment_date timestamp default sysdate
);


-- 건의사항 게시판 테이블 ( 글번호 , 게시자 아이디 , 글제목 , 글내용 , 글보기위한 비밀번호 , 게시일 , 조회수 ) 
create table tbl_inquiry_board(
    inquiry_number number primary key,
    inquiry_userid varchar2(50) references tbl_member(userid) not null,
    inquiry_title varchar2(300) not null,
    inquiry_photoname varchar2(400) not null,
    inquiry_content varchar2(3000) not null,
    inquiry_password varchar2(4) not null,
    inquiry_date timestamp default sysdate,
    inquiry_viewcnt number default 0
);

-- 건의사항 게시판 댓글 테이블 ( 글번호 , 게시자 아이디 , 댓글내용 , 댓글 날짜 )
create table tbl_inquiry_board_comment(
    inquiry_comment_userid varchar2(50) references tbl_member(userid) not null primary key,
    inquiry_comment_content varchar2(300) not null,
    inquiry_comment_date timestamp default sysdate
);

-- 메세지 테이블 (보낸사람 , 받는사람 , 메세지 제목 , 내용 , 보낸 날짜 )  
create table tbl_service_message(
    service_message_sender varchar(50) references tbl_member(userid) not null,                                                  
    service_message_receiver varchar(50) references tbl_member(userid) not null,                                                                        
    service_message_title varchar2(500) not null,                                                                               
    service_message_content varchar2(1000) not null,
    service_message_count number default 0,
    service_message_date timestamp default sysdate                                                                  
);

-- 건의사항 게시판 댓글 글번호 시퀀스
create sequence seq_inquiry_comment_no;

-- 건의사항 게시판 테이블 조회수 추가
alter table tbl_inquiry_board
add INQUIRY_VIEWCNT number default 0;

-- 댓글 올린 시간 추가
alter table tbl_class_board
add class_board_comment_date timestamp default sysdate;

-- 댓글 개수 추가
alter table tbl_class_board
add class_board_comment_cnt number default 0 not null;

-- 수강신청 테이블 게시기간 기준 최신글 3개만 보기
select class_board_title , class_board_content , class_board_userid
from (select * from tbl_class_board order by class_board_postdate desc)
where rownum <= 3;


-- 게시글 클릭했을 때 내용 보이기
select * from tbl_class_board
where class_board_title = '안녕하세요';

-- 게시글 등록
insert into tbl_class_board(class_board_number , class_board_enroll , class_board_title , class_board_content , class_board_userid)
values(? , ? , ? , ? , ?);

-- 게시글 클릭 시 조회수 증가
update tbl_class_board
set class_board_viewcnt = class_board_viewcnt + 1
where class_board_title = ?;


-- 댓글 입력
insert into tbl_class_board_comment(class_board_comment_content , class_board_comment_userid , class_board_comment_date)
values(? , ? , sysdate);

-- 댓글 조회 ( 해당 게시글 번호에 댓글은 누가 달았는지? ) 
select * from tbl_class_board_comment
where class_board_comment_no = (select class_board_number from tbl_class_board where CLASS_BOARD_NUMBER = ?);


-- 해당하는 아이디 게시글에 댓글단 정보
select * from tbl_class_board_comment
where class_board_comment_no = (select class_board_number 
							    from tbl_class_board 
							    where CLASS_BOARD_NUMBER = ?)

-- 건의사항 테이블 최신글 3개만 보기
select inquiry_title , inquiry_content , inquiry_userid
from (select * from tbl_inquiry_board order by inquiry_date desc)
where rownum <= 3;

-- 자주묻는 질문 , 건의사항 테이블 조회수 10이상의 최신글 3개만 보기
select inquiry_title , inquiry_content , inquiry_userid
from (select * from tbl_inquiry_board order by inquiry_viewcnt desc)
where inquiry_viewcnt >= 10 and rownum <= 3;

-- 수강신청 테이블 최신글 3개만 보기
select class_board_title , class_board_content , class_board_userid
from (select * from tbl_class_board order by class_board_postdate desc)
where rownum <= 3;

-- 자주묻는 질문 , 수강신청 테이블 조회수 10이상의 최신글 3개만 보기
select class_board_title , class_board_content , class_board_userid
from (select * from tbl_class_board order by class_board_viewcnt desc)
where class_board_viewcnt >= 10 and rownum <= 3;

