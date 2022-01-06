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

-- 댓글 테이블
create table tbl_class_board_comment(
    class_board_comment_no number primary key,
    class_board_comment_content varchar2(300) not null,
    class_board_comment_userid varchar(50) references tbl_member(userid) not null,
    class_board_comment_date timestamp default sysdate,
    class_board_comment_cnt number default 0 not null
);

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
values(? , ? , sysdate)

-- 댓글 조회 
select * from tbl_class_board_comment

-- 해당하는 아이디 게시글에 댓글단 정보
select * 
from tbl_class_board_comment
where class_board_comment_userid = (select class_board_userid 
                                    from tbl_class_board 
                                    where class_board_userid='user02');





