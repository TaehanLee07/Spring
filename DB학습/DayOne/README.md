create table emp (
	empno number(4) not null,
	ename varchar2(10) not null,
	job varchar2(9),
	mgr number(4),
	hiredate date,
	sal number(7, 2),
	comm number(7, 2),
	deptno number(2),
	constraints emp_pk primary key(empno),
	constraints emp_dept_fk foreign key(deptno) references dept(deptno)	
);


create table dept (
	deptno number(2) not null,
	dname varchar2(14) not null,
	loc varchar2(13),
	constraints dept_pk primary key (deptno)	
);

insert into dept
values (10, 'ACCOUNTING', 'NEW YORK');


insert into dept
values (20, 'RESEARCH', 'DALLAS');

insert into dept(deptno, dname)
values (30, 'SALES');

insert into dept
values(40, 'OPERATIONS', '');

update dept
set loc = 'CHICAGO'
where deptno = 30;

update dept
set loc = 'BOSTON'
where deptno = 40;

직업(job) analyst 인 사람의 이름과 근무지(loc) 직업을 출력


select e.ename, d.loc, e.job
from emp e
join dept d on e.deptno = d.deptno
where e.job = 'analyst';

select e.ename, d.loc, e.job
from emp e , dept d
where e.deptno = d.deptno
and e.job = 'ANALYST';

-- ANSI 조인 방식
Select e.ename, d.loc, e.job
from emp e JOIN dept d
ON (e.deptno = d.deptno)
where e.job = 'ANALYST';

-- USING 절 사용
Select e.ename, d.loc, e.job
from emp e JOIN dept d
USING (deptno)
where e.job = 'ANALYST';
