--
CREATE TABLE TBL_CLASS(
    C_CATE VARCHAR2(50) NOT NULL,
    C_TITLE VARCHAR2(4000) NOT NULL,
    C_TERM VARCHAR2(50) NOT NULL,
    C_TIME VARCHAR2(50) NOT NULL,
    C_ROOM NUMBER(3) NOT NULL,
    C_TOTAL NUMBER(2) NOT NULL
    C_PAY VARCHAR2(50) NOT NULL,
    C_DAY VARCHAR2(50) NOT NULL,
);

-- 수업 추가하기
insert into tbl_class
values(c_cate, c_title, c_term, c_title, c_room, c_total, c_pay, c_day);

-- 전체보기 --
<select>
	select * from tbl_class
</select>

--주간반 주말반 야간반 개별 조회--

-- 주간반--
<select>
	select * from tbl_class
	where c_day = '주간반'
</select>

--주말반 --
<select>
	select * from tbl_class
	where c_day = '주말반'
</select>

-- 야간반 --
<select>
	select * from tbl_class
	where c_day = '야간반'
</select>

-- 수업 과정별(카테고리) 조회 --

-- 프로그래밍 --
<select>
	select * from tbl_class
	where c_cate = '프로그래밍'
</select>

-- 디자인 --
<select>
	select * from tbl_class
	where c_cate = '디자인'
</select>

-- 제품디자인 --
<select>
	select * from tbl_class
	where c_cate = '제품디자인'
</select>

-- 3D프린트 --
<select>
	select * from tbl_class
	where c_cate = '3D프린트'
</select>

-- 사무자동화 --
<select>
	select * from tbl_class
	where c_cate = '사무자동화'
</select>


-- 온라인 신청하기
create table online_regist(
    r_num varchar2(15) primary key,  -- 주민번호
    c_day  varchar2(50) not null, -- 훈련직종분류(주간, 야간, 주말)
    c_cate varchar2(50) not null, -- 교육과정분류(디자인, 프로그램 이런거)
    c_title varchar2(500) not null, -- 과정명
    c_name varchar2(50) not null,    -- 신청자 이름
    gender varchar2(50) not null,    -- 성별
    foreigner varchar2(50) default 'KOREAN', -- 내/외국인
    phone_num varchar2(13) not null,      -- 휴대전화
    home_num varchar2(13),    -- 일반전화
    e_mail varchar2(100),     -- 이메일
    regist_path varchar2(100) default 'etc', -- 지원경로
    employment varchar2(50) default 'not',   -- 국민취업지원제도(1유형, 2유형, 미참여)
    employment_center varchar2(4000),    -- 참여센터
    employment_counselor varchar2(300), -- 담당자
    employment_num varchar2(13)         --연락처
);

insert into online_regist
values(
	?,?,?,?,?,?,?,?,?,?,?,?,?,?,?
);