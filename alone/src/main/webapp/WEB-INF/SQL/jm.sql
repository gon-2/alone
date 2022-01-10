= tbl_member table

tbl_member
USERID	VARCHAR2(50 BYTE)	No		1	
USERPW	VARCHAR2(50 BYTE)	No		2	
USERPWD	VARCHAR2(50 BYTE)	No		3	
USERNAME	VARCHAR2(50 BYTE)	No		4	
BIRTHDATE	VARCHAR2(20 BYTE)	Yes		5	
EMAIL	VARCHAR2(100 BYTE)	No		6	
GENDER	CHAR(1 BYTE)	Yes	'M' 	7	
PNUMBER	VARCHAR2(20 BYTE)	Yes		8	

// 회원등록
	<insert id="insertTeam">
		insert into tbl_member(userid, userpw, userpwd, username, birthdate , email, gender, pnumber)
		values (#{userid}, #{userpw}, #{userpwd}, #{username}, #{birthdate}, #{email}, #{gender}, #{pnumber})
	</insert>
	
	<select id="selectAll" resultType="MemberVo">
		select * from tbl_member
		order by userid
	</select>
	
	<!-- 답글 -->
	<select id="memberBoardForm" resultType="MemberBoardVo">
		select bno, title, content, userid, to_char(sysdate, 'YYYY-MM-DD')
		regdate from tbl_memberboard
	</select>
	
	<!-- 답글 추가 -->
	<insert id="insertReply">
		insert into tbl_memberboard 
			(bno, title, content, userid, 
			 re_group, re_seq, re_level)
		values
			(seq_bno.nextval, #{title}, #{content}, #{userid}, 
			#{re_group}, #{re_seq} + 1, #{re_level} + 1)
	</insert>		
	
	<insert id="insertTeam">
		insert into tbl_member(userid, userpw, userpwd, username, birthdate , email, gender, pnumber)
		values (#{userid}, #{userpw}, #{userpwd}, #{username}, #{birthdate}, #{email}, #{gender}, #{pnumber})
	</insert>
	
	<select id="selectAll" resultType="MemberVo">
		select * from tbl_member
		order by userid
	</select>
	
	<!-- 답글 -->
	<select id="memberBoardForm" resultType="MemberBoardVo">
		select bno, title, content, userid, to_char(sysdate, 'YYYY-MM-DD')
		regdate from tbl_memberboard
	</select>
	
	<!-- 답글 추가 -->
	<insert id="insertReply">
		insert into tbl_memberboard 
			(bno, title, content, userid, 
			 re_group, re_seq, re_level)
		values
			(seq_bno.nextval, #{title}, #{content}, #{userid}, 
			#{re_group}, #{re_seq} + 1, #{re_level} + 1)
	</insert>		
		
	
	-- 게시판 테이블
create table tbl_memberboard(
	bno number primary key, 
	title varchar2(200) not null, 
	content varchar2(4000), 
	userid varchar2(50) references tbl_member(userid),
	regdate timestamp default sysdate, 
    re_group number default 0,
    re_seq number default 0,
    re_level number default 0
    );
    
    
    