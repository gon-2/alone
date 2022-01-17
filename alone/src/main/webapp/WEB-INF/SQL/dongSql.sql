-- 구인 현황 테이블
create table lookJob (
    jobno number primary key,
    company varchar2(50) not null,
	employForm varchar2(50),
	companyNum varchar2(20),
	companyForm varchar2(100),
	representative varchar2(20),
	personInCharge varchar2(30),
	contact varchar2(20) not null,
	fax varchar2(20),
	mail varchar2(30),
	address varchar2(100),
	department varchar2(50),
	work varchar2(200),
	workTime varchar2(100),
	salary varchar2(100),
	recruitmentStart varchar2(100),
	recruitmentEnd varchar2(100),
	content varchar2(2000)
);

-- 구인현황 업데이트
update lookJob set
    company = '(주)엔정보기술',
    employForm = '정규직',
    companyNum = null,
    companyForm = '컴퓨터시스템 통합 자문 및 구축 서비스업',
    representative = '이장호',
    personInCharge = '김명립 (재경부)',
    contact = '010-3584-6908',
    fax = null,
    mail = null,
    address = '(44921) 울산 울주군 범서읍 대리로 89 경동빌딩3층~5층',
    department = null,
    work = '응용/시스템(솔루션) 프로그램 개발/구축, 공공기관 운영시스템 유지관리 및 분석',
    workTime = '주 5일(월~금) 09:00~18:00',
    salary = '회사내규에 따름',
    recruitmentStart = '2021년 12월 20일 (월) 14시',
    recruitmentEnd = '2022년 1월 14일 (금) 24시',
    content = '(주)엔정보기술.PNG'
where jobno = 1;

-- 구인정보 시퀸스 생성
create sequence seq_jobno;

insert into lookJob(jobno, company, employForm, companyNum, companyForm,
representative, personInCharge, contact, fax, mail, address, department,
work, workTime, salary, recruitmentStart, recruitmentEnd, content)
values(seq_jobno.nextval, '(주)엔정보기술', '정규직', null, '컴퓨터시스템 통합 자문 및 구축 서비스업',
'이장호', '김명립 (재경부)', '010-3584-6908', null, null, '(44921) 울산 울주군 범서읍 대리로 89 경동빌딩3층~5층',
null, '응용/시스템(솔루션) 프로그램 개발/구축, 공공기관 운영시스템 유지관리 및 분석','주 5일(월~금) 09:00~18:00', '회사내규에 따름','2021년 12월 20일 (월) 14시', '2022년 1월 14일 (금) 24시',
null);


-- 구인정보 테이블
create table test (
    tno number primary key,
    title varchar2(100),
    writers varchar2(30),
    test_date timestamp default sysdate
);
-- 시퀀스 생성
create sequence seq_tno;

-- 자격증 안내 게시판 추가
insert into test (tno, title, writers)
values (#{tno}, #{title}, #{writers})

-- 타임 select
select tno, title, writers, to_char(sysdate, 'YYYY-MM-DD')
test_date, to_char(sysdate, 'HH:MI') test_time from test
order by jobno desc;

-- 이미지 테이블 생성
create table images(
	image varchar2(100),
	tno number references test(tno)
);

-- 이미지 테이블 추가
insert into images(image, tno)
values('InformationTest2', 1);

-- 취업자 현황 테이블 생성
create table find (
	fno number primary key,
	company varchar2(100) not null,
	fname varchar2(30) not null,
	fday varchar2(20) not null,
	course_name varchar2(50) not null,
	image varchar2(100)
);

--취업자 현황 파업창 이미지 테이블
create table f_images (
    images varchar2(100),
	fno number references find(fno)
);

-- 취업자 현황 테이블 시퀸스
create sequence seq_fno;

-- 취업 자료실
create table tbl_reference (
	rno number primary key,
	rtitle varchar2(100) not null,
	rwriter varchar2(30) not null,
	recommend number not null,
	hits number not null,
	re_group number not null,
	re_seq number not null,
	re_level number not null,
	r_content varchar2(4000),
	reference_date timestamp default sysdate
);

-- 취업 자료실 파일 저장 테이블
create table r_file (
    r_images varchar2(100),
    rno number references tbl_reference(rno)
);

-- 취업 자료실 테이블 시퀀스
create sequence seq_rno;

select * from tbl_reference;

alter table tbl_reference add re_level number;

-- 테이블 업데이트
update tbl_reference set
    re_seq = 0,
    re_level = 0
where rno = 1;
    
    select * from tbl_reference;
    
    commit;
    
    select next,prev 
			from (
			    select rno, 
			    lead(rno,1) over(order by rno) as next, 
			    lag(rno,1) over(order by rno) as prev from tbl_reference
			)
		where rno = 3;

begin
   for i in 200..251 loop
      insert into tbl_reference(rno, rtitle, rwriter, recommend, hits, re_group, re_seq, re_level)
      values(seq_rno.nextval, 
            '면접확인서' || i,
            '김동명',
            0,
            0,
            seq_rno.nextval,
            0,
            0);
   end loop;
   
end;
/
    select rno, rtitle, rwriter, recommend, hits, to_char(sysdate, 'YYYY-MM-DD')
		reference_date, to_char(sysdate, 'HH:MI'), re_group, re_seq, re_level reference_time from 
		(select rownum rnum, a.* from 
      			 		 (select * from tbl_reference
       						 order by re_group desc, re_seq asc) a)
		where rnum between 1 and 10;
        
        select * from
  		  		(select rownum rnum, a.* from 
      			 		 (select * from tbl_board
       						 order by re_group desc, re_seq asc) a)
		where rnum between 1 and 10;