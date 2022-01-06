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
