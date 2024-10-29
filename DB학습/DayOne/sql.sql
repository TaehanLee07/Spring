
SQL*Plus: Release 11.2.0.2.0 Production on 화 10월 29 16:21:10 2024

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL> conn system/1234
Connected.
SQL> create user scott2 identified by 1234
  2  default tablespace users
  3  temporary tablespace temp;

User created.

SQL> conn scott2/1234
ERROR:
ORA-01045: user SCOTT2 lacks CREATE SESSION privilege; logon denied


Warning: You are no longer connected to ORACLE.
SQL> conn system/1234;
Connected.
SQL> grant connect, resource, dba to scott2;

Grant succeeded.

SQL> conn scott2/1234
Connected.
SQL> create table emp (
  2  empno number(4) not null,
  3  ename varchar2(10) not null,
  4  job varchar2(9),
  5  mgr number(4),
  6  hiredate date
  7  sal number(7, 2),
  8  comm number(7, 2),
  9  deptno number(2),
 10  constraints emp_pk primary key(empno)
 11  );
sal number(7, 2),
*
ERROR at line 7:
ORA-00907: missing right parenthesis


SQL> create table emp (
  2  empno number(4) not null,
  3  ename varchar2(10) not null,
  4  job varchar2(9),
  5  mgr number(4),
  6  hiredate date,
  7  sal number(7, 2),
  8  comm number(7, 2),
  9  deptno number(2),
 10  constraints emp_pk primary key(empno)
 11  );

Table created.

SQL> drop table emp;

Table dropped.

SQL> create table dept (
  2  deptno number(2) not null,
  3  dname varchar2(14) not null,
  4  loc varchar2(13),
  5  constraints dept_pk primary key (dept_no)
  6
SQL> );
SP2-0042: unknown command ")" - rest of line ignored.
SQL> create table dept (
  2  deptno number(2) not null,
  3  dname varchar2(14) not null,
  4  loc varchar2(13),
  5  constraints dept_pk primary key (dept_no)
  6  );
constraints dept_pk primary key (dept_no)
                                 *
ERROR at line 5:
ORA-00904: "DEPT_NO": invalid identifier


SQL> create table dept (
  2  deptno number(2) not null,
  3  dname varchar2(14) not null,
  4  loc varchar2(13),
  5  constraints dept_pk primary key (deptno)
  6  );

Table created.

SQL> create table emp (
  2  empno number(4) not null,
  3  ename varchar2(10) not null,
  4  job varchar2(9),
  5  mgr number(4),
  6  hiredate date,
  7  sal number(7, 2),
  8  comm number(7, 2),
  9  deptno number(2),
 10  constraints emp_pk primary key(empno),
 11  constraints emp_dept_fk foreign key(deptno) references dept(deptno)
 12  );

Table created.

SQL>
SQL> insert into dept
  2  values (10, 'ACCOUNTING', 'NEW YORK');

1 row created.

SQL> insert into dept
  2  values (20, 'RESEARCH', 'DALLAS');

1 row created.

SQL> insert into dept(deptno, dname)
  2  values (30, 'SALES');

1 row created.

SQL>
SQL> insert into dept
  2  values(40, 'OPERATIONS', '');

1 row created.

SQL> update dept
  2  set loc = 'CHICAGO'
  3  where deptno = 30;

1 row updated.

SQL> update dept
  2  set loc = 'BOSTON'
  3  where deptno = 40;

1 row updated.

SQL> select * from dept;

    DEPTNO DNAME                        LOC
---------- ---------------------------- --------------------------
        10 ACCOUNTING                   NEW YORK
        20 RESEARCH                     DALLAS
        30 SALES                        CHICAGO
        40 OPERATIONS                   BOSTON

SQL> INSERT INTO EMP VALUES
  2  (7369, 'SMITH', 'CLERK', 7902, '80/12/17', 800, NULL, 20);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7499, 'ALLEN', 'SALESMAN', 7698, '81/02/20', 1600, 300, 30);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7521, 'WARD', 'SALESMAN', 7698, '81/02/22', 1250, 500, 30);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7566, 'JONES', 'MANAGER', 7839, '81/04/02', 2975, NULL, 20);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7654, 'MARTIN', 'SALESMAN', 7698, '81/09/28', 1250, 1400, 30);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7698, 'BLAKE', 'MANAGER', 7839, '81/05/01', 2850, NULL, 30);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7782, 'CLARK', 'MANAGER', 7839, '81/06/09', 2450, NULL, 10);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7788, 'SCOTT', 'ANALYST', 7566, '81/07/21', 3000, NULL, 20);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7839, 'KING', 'PRESIDENT', NULL, '81/11/17', 5000, NULL, 10);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7844, 'TURNER', 'SALESMAN', 7698, '81/09/08', 1500, 0, 30);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7876, 'ADAMS', 'CLERK', 7788, '81/11/15', 1100, NULL, 20);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7900, 'JAMES', 'CLERK', 7698, '81/12/03', 950, NULL, 30);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7902, 'FORD', 'ANALYST', 7566, '81/12/03', 3000, NULL, 20);

1 row created.

SQL>
SQL> INSERT INTO EMP VALUES
  2  (7934, 'MILLER', 'CLERK', 7782, '82/01/23', 1300, NULL, 10);

1 row created.

SQL> select * from emp;

     EMPNO ENAME                JOB                       MGR HIREDATE
---------- -------------------- ------------------ ---------- --------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7369 SMITH                CLERK                    7902 80/12/17
       800                    20

      7499 ALLEN                SALESMAN                 7698 81/02/20
      1600        300         30

      7521 WARD                 SALESMAN                 7698 81/02/22
      1250        500         30


     EMPNO ENAME                JOB                       MGR HIREDATE
---------- -------------------- ------------------ ---------- --------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7566 JONES                MANAGER                  7839 81/04/02
      2975                    20

      7654 MARTIN               SALESMAN                 7698 81/09/28
      1250       1400         30

      7698 BLAKE                MANAGER                  7839 81/05/01
      2850                    30


     EMPNO ENAME                JOB                       MGR HIREDATE
---------- -------------------- ------------------ ---------- --------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7782 CLARK                MANAGER                  7839 81/06/09
      2450                    10

      7788 SCOTT                ANALYST                  7566 81/07/21
      3000                    20

      7839 KING                 PRESIDENT                     81/11/17
      5000                    10


     EMPNO ENAME                JOB                       MGR HIREDATE
---------- -------------------- ------------------ ---------- --------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7844 TURNER               SALESMAN                 7698 81/09/08
      1500          0         30

      7876 ADAMS                CLERK                    7788 81/11/15
      1100                    20

      7900 JAMES                CLERK                    7698 81/12/03
       950                    30


     EMPNO ENAME                JOB                       MGR HIREDATE
---------- -------------------- ------------------ ---------- --------
       SAL       COMM     DEPTNO
---------- ---------- ----------
      7902 FORD                 ANALYST                  7566 81/12/03
      3000                    20

      7934 MILLER               CLERK                    7782 82/01/23
      1300                    10


14 rows selected.

SQL> set linesize 300;
SQL> select * from emp;

     EMPNO ENAME                JOB                       MGR HIREDATE        SAL       COMM     DEPTNO
---------- -------------------- ------------------ ---------- -------- ---------- ---------- ----------
      7369 SMITH                CLERK                    7902 80/12/17        800                    20
      7499 ALLEN                SALESMAN                 7698 81/02/20       1600        300         30
      7521 WARD                 SALESMAN                 7698 81/02/22       1250        500         30
      7566 JONES                MANAGER                  7839 81/04/02       2975                    20
      7654 MARTIN               SALESMAN                 7698 81/09/28       1250       1400         30
      7698 BLAKE                MANAGER                  7839 81/05/01       2850                    30
      7782 CLARK                MANAGER                  7839 81/06/09       2450                    10
      7788 SCOTT                ANALYST                  7566 81/07/21       3000                    20
      7839 KING                 PRESIDENT                     81/11/17       5000                    10
      7844 TURNER               SALESMAN                 7698 81/09/08       1500          0         30
      7876 ADAMS                CLERK                    7788 81/11/15       1100                    20

     EMPNO ENAME                JOB                       MGR HIREDATE        SAL       COMM     DEPTNO
---------- -------------------- ------------------ ---------- -------- ---------- ---------- ----------
      7900 JAMES                CLERK                    7698 81/12/03        950                    30
      7902 FORD                 ANALYST                  7566 81/12/03       3000                    20
      7934 MILLER               CLERK                    7782 82/01/23       1300                    10

14 rows selected.

SQL> create table bonus ()
  2  sad;asd;
create table bonus ()
                    *
ERROR at line 1:
ORA-00904: : invalid identifier


SQL> create table bonus (
  2  ename varchar2(10),
  3  job varchar2(9),
  4  sal number,
  5  comm number);

Table created.

SQL> create table salgrade(
  2  grade number,
  3  losal number,
  4  hisal number);

Table created.

SQL> insert into salgrade values(1, 700, 1200);

1 row created.

SQL> insert into salgrade values(2, 1201, 1400);

1 row created.

SQL> insert into salgrade values(3, 1401, 2000);

1 row created.

SQL> insert into salgrade values(4, 2001, 3000);

1 row created.

SQL> insert into salgrade values(5, 3001, 9999);

1 row created.

SQL> create table dummy(
  2  dummy number);

Table created.

SQL> insert into dummy values(0);

1 row created.

SQL> commit;

Commit complete.

SQL> select * from emp;

     EMPNO ENAME                JOB                       MGR HIREDATE        SAL       COMM     DEPTNO
---------- -------------------- ------------------ ---------- -------- ---------- ---------- ----------
      7369 SMITH                CLERK                    7902 80/12/17        800                    20
      7499 ALLEN                SALESMAN                 7698 81/02/20       1600        300         30
      7521 WARD                 SALESMAN                 7698 81/02/22       1250        500         30
      7566 JONES                MANAGER                  7839 81/04/02       2975                    20
      7654 MARTIN               SALESMAN                 7698 81/09/28       1250       1400         30
      7698 BLAKE                MANAGER                  7839 81/05/01       2850                    30
      7782 CLARK                MANAGER                  7839 81/06/09       2450                    10
      7788 SCOTT                ANALYST                  7566 81/07/21       3000                    20
      7839 KING                 PRESIDENT                     81/11/17       5000                    10
      7844 TURNER               SALESMAN                 7698 81/09/08       1500          0         30
      7876 ADAMS                CLERK                    7788 81/11/15       1100                    20

     EMPNO ENAME                JOB                       MGR HIREDATE        SAL       COMM     DEPTNO
---------- -------------------- ------------------ ---------- -------- ---------- ---------- ----------
      7900 JAMES                CLERK                    7698 81/12/03        950                    30
      7902 FORD                 ANALYST                  7566 81/12/03       3000                    20
      7934 MILLER               CLERK                    7782 82/01/23       1300                    10

14 rows selected.

SQL> select * from dept;

    DEPTNO DNAME                        LOC
---------- ---------------------------- --------------------------
        10 ACCOUNTING                   NEW YORK
        20 RESEARCH                     DALLAS
        30 SALES                        CHICAGO
        40 OPERATIONS                   BOSTON

SQL> select * from salgrade;

     GRADE      LOSAL      HISAL
---------- ---------- ----------
         1        700       1200
         2       1201       1400
         3       1401       2000
         4       2001       3000
         5       3001       9999

SQL> select e.ename, d.loce, e.job
  2  from emp e dept d
  3  where e.deptno = d.deptno;
from emp e dept d
           *
ERROR at line 2:
ORA-00933: SQL command not properly ended


SQL> select e.ename, d.loce, e.job
  2  from emp e, dept d
  3  where e.deptno = d.deptno;
select e.ename, d.loce, e.job
                *
ERROR at line 1:
ORA-00904: "D"."LOCE": invalid identifier


SQL> select e.ename, d.loc, e.job
  2  from emp e, dept d
  3  where e.deptno = d.deptno;

ENAME                LOC                        JOB
-------------------- -------------------------- ------------------
SMITH                DALLAS                     CLERK
ALLEN                CHICAGO                    SALESMAN
WARD                 CHICAGO                    SALESMAN
JONES                DALLAS                     MANAGER
MARTIN               CHICAGO                    SALESMAN
BLAKE                CHICAGO                    MANAGER
CLARK                NEW YORK                   MANAGER
SCOTT                DALLAS                     ANALYST
KING                 NEW YORK                   PRESIDENT
TURNER               CHICAGO                    SALESMAN
ADAMS                DALLAS                     CLERK

ENAME                LOC                        JOB
-------------------- -------------------------- ------------------
JAMES                CHICAGO                    CLERK
FORD                 DALLAS                     ANALYST
MILLER               NEW YORK                   CLERK

14 rows selected.

SQL>
SQL> select e.ename, d.loc, e.job
  2  from emp e, dept d
  3  where e.deptno = d.deptno and job = 'analyst';

no rows selected

SQL> select e.ename, d.loc, e.job
  2  from emp e, dept d
  3  where e.deptno = d.deptno and job = 'analyst';

no rows selected

SQL> select e.ename, d.loc, e.job
  2  from emp e, dept d
  3  where e.deptno = d.deptno or job = 'analyst';

ENAME                LOC                        JOB
-------------------- -------------------------- ------------------
SMITH                DALLAS                     CLERK
ALLEN                CHICAGO                    SALESMAN
WARD                 CHICAGO                    SALESMAN
JONES                DALLAS                     MANAGER
MARTIN               CHICAGO                    SALESMAN
BLAKE                CHICAGO                    MANAGER
CLARK                NEW YORK                   MANAGER
SCOTT                DALLAS                     ANALYST
KING                 NEW YORK                   PRESIDENT
TURNER               CHICAGO                    SALESMAN
ADAMS                DALLAS                     CLERK

ENAME                LOC                        JOB
-------------------- -------------------------- ------------------
JAMES                CHICAGO                    CLERK
FORD                 DALLAS                     ANALYST
MILLER               NEW YORK                   CLERK

14 rows selected.

SQL> select e.ename, d.loc, e.job
  2  from emp e
  3  join dept d on e.deptno = d.deptno
  4  where e.job = 'analyst';

no rows selected

SQL>
SQL> select e.ename, d.loc, e.job
  2  from emp e , dept d
  3  where e.deptno = d.deptno
  4  and e.job = 'analyst';

no rows selected

SQL> Select e.ename, d.loc, e.job
  2  from emp e JOIN dept d
  3  ON (e.deptno = d.deptno)
  4  where e.job = 'ANALYST';

ENAME                LOC                        JOB
-------------------- -------------------------- ------------------
SCOTT                DALLAS                     ANALYST
FORD                 DALLAS                     ANALYST

SQL>    select e.ename, d.loc, e.job
  2  from emp e , dept d
  3  where e.deptno = d.deptno
  4  and e.job = 'ANALYST';

ENAME                LOC                        JOB
-------------------- -------------------------- ------------------
SCOTT                DALLAS                     ANALYST
FORD                 DALLAS                     ANALYST

SQL> Select e.ename, d.loc, e.job
  2  from emp e JOIN dept d
  3  USING (deptno)
  4  where e.job = 'ANALYST';

ENAME                LOC                        JOB
-------------------- -------------------------- ------------------
SCOTT                DALLAS                     ANALYST
FORD                 DALLAS                     ANALYST

SQL> Select e.ename, d.loc, e.job
  2  From emp e Natural JOIN dept d
  3  where e.job = 'ANALYST';

ENAME                LOC                        JOB
-------------------- -------------------------- ------------------
SCOTT                DALLAS                     ANALYST
FORD                 DALLAS                     ANALYST

SQL>
