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

insert into employee values(employee_id_seq.nextval, '001', '������', '010-1111-2222', '����', 'yudajgim@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '002', '������', '010-1231-2312', '���', 'asdf@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '003', '����', '010-3333-4444', '����', 'hhgdgfs@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '004', '������', '010-1111-3333', '�븮', 'dgfsdgfsdgf@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '005', '����ȣ', '010-1111-4444', '����', 'dfasdfas@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '006', '�ִ���', '010-1111-5555', '����', 'bdgfdgf@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '007', '������', '010-1111-6666', '����', 'dfsdfs@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '008', '������', '010-1111-7777', '���', 'dfs@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '009', '������', '010-1111-8888', '����', 'yudadgfsjgim@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '010', '������', '010-1111-9999', '�븮', 'dfas@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '011', '��μ�', '010-2222-1111', '����', 'yudafedfsjgim@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '012', '������', '010-2222-2222', '����', 'dfs@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '013', '������', '010-2222-3333', '�̻�', 'dfsdfs@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '014', '������', '010-2222-4444', '��', 'rge@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '015', '��ä��', '010-2222-5555', '����', 'ghf@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '016', '�ż���', '010-2222-6666', '�λ���', 'qew@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '017', '������', '010-2222-7777', '���', 'rvgesc@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '018', 'Ȳ����', '010-2222-8888', '����', 'drfe@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '019', '������', '010-2222-9999', '�븮', 'dfeasx@naver.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '020', '�۴���', '010-3333-1111', '���', 'dfae@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '021', '������', '010-3333-2222', '���', 'dfa@gmail.com', systimestamp, systimestamp);
insert into employee values(employee_id_seq.nextval, '022', 'ȫ����', '010-3333-4444', '���', 'dfs@naver.com', systimestamp, systimestamp);