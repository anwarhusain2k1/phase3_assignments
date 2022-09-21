create database library_system
use library_system

create table member(
memberid	Numeric(5),
name  char(25),
Acc_Open_Date	Date,
Max_Books_Allowed	Numeric(2),
Penalty_Amount	Numeric(7,2),

)


create table book(
Book_No	Numeric(6),
Book_Name		VarChar(30),
Author	Char(30),
Cost	Numeric(7,2),
Category	Char(10),

)

create table issue(
Lib_Issue_Id	Numeric(10), 
Book_No	Numeric(6) foreign key references book(Book_No),
Member_Id	Numeric(5),
Issue_Date	Date,
Return_date	Date
)

alter table issue
--drop column Member_id
add Member_Id Numeric(5) foreign key references member(memberid)

alter table issue
--add Comments char(100)
--add reference char(30)
--drop column reference
drop column comments

insert into member values (1,'Richa Sharma'	,'10-Dec-05',5,50)
insert into member values (2,'Garima Sen',getdate(),3,Null)
insert into member values (3,'sam','12-jan-2000',12,20)
insert into member values (4,'john',getdate(),8,Null)
insert into member values (5,'ken',null,1,Null)

insert into member values (6,'jack','10-july-1990',110,null)
--Arithmetic overflow error converting int to data type numeric.

create table Member101(select * from member)
--Incorrect syntax near the keyword 'select'.

insert into book values (101,'Let us C','Denis Ritchie',450	,'System')
insert into book values (102,'Oracle – Complete Ref','Loni',550	,'Database')
insert into book values (103,'Mastering SQL','Loni',250	,'Database')
insert into book values (104,'PL SQL-Ref','Scott Urman',750	,'Database')

insert into book values (105,'basics_of c#','Scott Urman',150,'system') , (106,'sql_server','Abdul',120,'dbms')

select * from member,book,Lib_Issue

sp_rename 'Lib_Issue','Issue'

insert into issue values (7001,101,'10-Dec-06','' ,1)
insert into issue values (7002,102,'25-Dec-06','' ,2)
insert into issue values (7003,	104,'15-Jan-06','',	1)
insert into issue values (7004,	101,'04-Jul-06','',	1)
insert into issue values (7005,	104,'15-Nov-06','',	2)
insert into issue values (7006,	101,'18-Feb-06','',	3)

update issue
set return_date='19-jul-06' where Lib_Issue_Id =7004

update issue
set return_date='30-nov-06' where Lib_Issue_Id =7005
 
 select * from Issue

 update member set Penalty_Amount = 100 where name='Garima Sen'

 delete from Issue where Member_Id=1 and Issue_Date<'10-Dec-06'

 drop table Member101

 drop table Book101

 select * from member,book,Issue

 select * from member where Year(Acc_Open_Date)='2006'

 select * from book where Author='loni' and Cost<600

 select * from issue where Return_date=''

 update issue set Return_date='31-Dec-06' where Return_date='' and Lib_Issue_Id!=7005 and Lib_Issue_Id!=7006
 
 
 select * from book where cost> 500 and Cost <750

 select * from book where Category in ('Science', 'Database', 'Fiction', 'Management')

 select * from member order by Penalty_Amount desc

 select * from book order by Category ,cost desc

 SELECT * FROM book WHERE Book_Name like '%SQL%'

 select * from member where name like 'r%' or name like 'g%' and name like '%i%'

 select UPPER( author) Author,Book_Name from book 

 select book_no ,'	is written by	' as '---',Author from book 

 select Book_Name,Author,Cost,substring(Category,1,1) from book
 
 select Book_Name ,'*' as '---',Author from book  

 select Lib_Issue_Id, Issue_Date, Return_Date , datediff(Day,Issue_Date, Return_Date)  from issue

 select * from member order by Acc_Open_Date

 select  member_id ,count(Book_no) 'no of books' from issue  group by Member_Id 

 select sum(Penalty_Amount) from member

 select sum(cost) from book where Category = 'database'

 select min(cost) from book

 select min(issue_date) from Issue

 select avg(cost) from book where Category='database'

 select category,count(Book_No) from book group by Category

 select book_no,count(issue_date) from issue group by issue_date

 select min(Penalty_Amount) minimum,max(Penalty_Amount) maximum,sum(Penalty_Amount) total,avg(Penalty_Amount) average from member

 select  Member_Id,Book_No,count(book_no)  from issue group by book_no,Member_Id

 select month(issue_date),count(book_no) 'no of books issue' from issue group by Issue_Date,Book_No

 select member_id from issue 

select  Member_Id,Book_No,count(book_no) 'no of books' from issue group by book_no,Member_Id

select * from issue where month(issue_date)='10' or month(issue_date)='7'

select issue.Book_No,Book_Name,Issue_Date from issue,book where month(issue_date)='10' and Category = 'database'

select i.Member_Id,m.name from member m inner join Issue i
 on m.memberid=i.Member_Id group by(Member_Id)

select category ,max(cost) from book 
 group by Category

select Category,max(cost) as maxcost  from book group by category


