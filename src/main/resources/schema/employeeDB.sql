DROP TABLE employee;

DROP SEQUENCE employee_id_seq;

CREATE TABLE employee(
	employee_id number   primary key,
	employee_number VARCHAR2(3)   NOT NULL,
	employee_name        VARCHAR2(15)		NOT NULL,
	employee_tel	varchar2(13)		NOT NULL,
	employee_position	varchar2(15)		NOT NULL,
	employee_email	varchar2(255)		NOT NULL,
    employee_insert_date    timestamp   default systimestamp   NOT NULL,
    employee_update_date    timestamp   default systimestamp   NOT NULL
);

create sequence employee_id_seq;

insert into employee values(employee_id_seq.nextval, '001', '김유다', '010-1111-2222', '사장', 'yudajgim@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '002', '강서연', '010-1231-2312', '사원', 'asdf@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '003', '고서윤', '010-3333-4444', '주임', 'hhgdgfs@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '004', '이지우', '010-1111-3333', '대리', 'dgfsdgfsdgf@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '005', '박지호', '010-1111-4444', '과장', 'dfasdfas@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '006', '최다현', '010-1111-5555', '차장', 'bdgfdgf@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '007', '정서현', '010-1111-6666', '부장', 'dfsdfs@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '008', '강지안', '010-1111-7777', '사원', 'dfs@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '009', '조하은', '010-1111-8888', '주임', 'yudadgfsjgim@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '010', '윤하윤', '010-1111-9999', '대리', 'dfas@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '011', '장민서', '010-2222-1111', '과장', 'yudafedfsjgim@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '012', '임지유', '010-2222-2222', '차장', 'dfs@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '013', '한윤서', '010-2222-3333', '이사', 'dfsdfs@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '014', '오지민', '010-2222-4444', '상무', 'rge@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '015', '서채원', '010-2222-5555', '전무', 'ghf@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '016', '신수아', '010-2222-6666', '부사장', 'qew@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '017', '권지아', '010-2222-7777', '사원', 'rvgesc@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '018', '황지윤', '010-2222-8888', '주임', 'drfe@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '019', '안은서', '010-2222-9999', '대리', 'dfeasx@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '020', '송다은', '010-3333-1111', '사원', 'dfae@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '021', '전예은', '010-3333-2222', '사원', 'dfa@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '022', '홍수빈', '010-3333-4444', '사원', 'dfs@naver.com', systimestamp, systimestamp);