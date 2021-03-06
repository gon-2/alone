<!-- 회원테이블-->
create tbl_member(
	userid varchar2(50) not null,			
	userpw varchar2(50 byte) not null,			
	userpwd	varchar2(50 byte) not null,	
	username varchar2(50 byte)	no null,	
	birthdate varchar2(20 byte),	
	email varchar2(100 byte) not null,	
	gender char(10 byte)'m',	
	pnumber	varchar2(20 byte)
	);
<!-- 게시판 테이블-->
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
	
	<!-- 회원등록 -->	
	<insert id="insertMember">
		insert into tbl_member(userid, userpw, userpwd, username, birthdate , email, gender, pnumber)
		values (#{userid}, #{userpw}, #{userpwd}, #{username}, #{birthdate}, #{email}, #{gender}, #{pnumber})
	</insert>
	
	<select id="selectAll" resultType="MemberVo">
		select * from tbl_member
		order by userid
	</select>
	
	<!-- 게시글 -->
	<select id="memberBoardForm" resultType="MemberBoardVo">
		select bno, title, content, userid, to_char(sysdate, 'YYYY-MM-DD')
			regdate, re_group, re_seq, re_level 
		from tbl_memberboard
		order by re_group desc, re_seq asc
	</select>
	
	<!-- 게시글 추가 -->
	<insert id="insertReply">
		insert into tbl_memberboard 
			(bno, title, content, userid, re_group)
		values
			(seq_bno.nextval, #{title}, #{content}, #{userid}, seq_bno.nextval)
	</insert>		
	
	<!--  회원정보 수정 -->
	<select id="memberModify" resultType="MemberVo">
		select * from tbl_member
		where userid = #{userid}
	</select>
	
	<!--  회원정보 수정처리 -->
	<update id="modifyRun">
		update tbl_member set
			userpw = #{userpw},
			userpwd = #{userpwd},
			username = #{username},
			birthdate = #{birthdate},
			email = #{email},
			gender = #{gender},
			pnumber = #{pnumber}
		where userid = #{userid}
	</update>
	
	<!--  회원탈퇴폼  -->
	<select id="memberOut" resultType="MemberVo">
		 select * from tbl_member
		 where userid = #{userid}
	</select>
	
	<!--  회원탈퇴 처리  -->
	<delete id="memberOutRun">
		delete * from tbl_member
		where userid= #{userid}
	</delete>
	
	<!--  글 상세보기- 답글폼 -->
	<select id="getMemberBoard" resultType="MemberBoardVo">
		select * from tbl_memberBoard
		where bno = #{bno}
	
	</select>
	
	<!-- 답글 추가 -->
	<insert id="insertResponse">
		insert into tbl_memberBoard
			(bno, re_level, re_group, re_seq, regdate, title, content, userid)
		values
			(seq_bno.nextval, #{re_level} + 1, #{re_group} , #{re_seq} + 1, sysdate, 
			#{title}, #{content}, #{userid})
	</insert>
	
	<!-- 답글 순서 변경 -->
	<update id="updateReSeq">
		update tbl_memberboard set
			re_seq = re_seq + 1
		where re_seq > #{re_seq}
	</update>
	

    
    
    