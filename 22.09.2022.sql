use library_system

create table Member_c(
member_id int primary key,
acc_open_date date default getdate(),
max_allowed_book int check( max_allowed_book<100),
penalty int check(penalty<100)
)

Create table Book_C (
Book_No int Primary Key,
Book_Name varchar(29) Not Null,
Category varchar(30) )

Create table Issue_C(
Lib_Issue_Id int  Primary Key,
Member_Id int Foreign Key references member_c(member_id),
Book_No int Foreign key references book_c(book_no),
return_date date,
Issue_date date --check--(Issue_date < Return_date)
)

alter table book_c
add price int check(price<2500)

alter table book
drop  price

select * from book_c

insert Book_C values(1,'.net','coding',2000)
insert Book_C values(2,'sql','rdbms',1000)
insert Book_C values(3,'networkinig','coding',200)

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='issue_c'

create view book_list 
as select book_name from Book_C where price>500

select * from book_list

create index bookindex on book_c(book_name) 

create unique index memberindex_number on member_c(member_id)

create unique index book_no_index on book_c(book_no) 