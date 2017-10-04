CREATE TABLE Author(
    aid int,
    aname varchar(20),
    age int,
    number_of_publication int,
    primary key(aid)
);

CREATE TABLE Translator(
    tid int,
    tname varchar(20),
    salary float,
    primary key(tid)
);
    
CREATE TABLE Customer(
    cid int,
    cname varchar(20),
    number_of_orders int,
    "level" varchar(20),
    primary key(cid)
);

CREATE TABLE Book(
    "btitle" varchar(20),
    "category" varchar(20),
    "edition" int,
    release_year int,
    tid int,
    primary key("btitle"),
    foreign key (tid) references Translator
);

CREATE TABLE Wrote(
    aid int,
    "btitle" varchar(20),
    primary key (aid, "btitle"),
    foreign key (aid) references Author,
    foreign key ("btitle") references Book
);


CREATE TABLE Purchased(
    cid int,
    "btitle" varchar(20),
    primary key (cid, "btitle"),
    foreign key (cid) references Customer,
    foreign key ("btitle") references Book
);

insert into Author values(1, 'Morgan', 60, 26);
insert into Author values(2, 'Cruz', 38, 8);
insert into Author values(3, 'Adams', 30, 5);
insert into Author values(4, 'Perry', 65, 24);
insert into Author values(5, 'Derek', 50, 10);
insert into Author values(6, 'Derek', 32, 4);
insert into Author values(7, 'Lewis', 70, 20);
insert into Author values(8, 'Alice', 47, 7);
  
insert into Translator values(101, 'Mark', 58000);
insert into Translator values(102, 'Black', 25000);
insert into Translator values(103, 'Ed', 30000);
insert into Translator values(104, 'Mark', 82000);
  
insert into Book values('Jurassic Park', 'Novel', 8, 1984, 101);
insert into Book values('The Power of Habit', 'Business', 10, 2001, 102);
insert into Book values('Heidi', 'Children', 9, 1960, 104);
insert into Book values('Anna Karenina', 'Novel', 20, 1994, 103);
insert into Book values('War and Peace', 'Novel', 17, 1968, 104);
insert into Book values('The Lion King', 'Children', 5, 1990, 103);
insert into Book values('Rich Dad', 'Business', 9, 1997, 103);
insert into Book values('The Goal', 'Business', 14, 1963, 103);
insert into Book values('Rework', 'Business', 6, 2003, 102);
insert into Book values('Beautiful Mind', 'Phycology', 3, 1979, 102);
  
insert into Customer values(200, 'John', 10, 'Children');
insert into Customer values(201, 'Emily', 7 , 'Adult');
insert into Customer values(202, 'Ashely', 19, 'Adult');
insert into Customer values(203, 'Edward', 3, 'Children');
insert into Customer values(204, 'Wu', 12, 'Adult');

insert into Wrote values(4, 'Jurassic Park');
insert into Wrote values(7, 'The Goal');
insert into Wrote values(1, 'Heidi');
insert into Wrote values(8, 'Rework');
insert into Wrote values(5, 'Rework');
insert into Wrote values(1, 'Anna Karenina');
insert into Wrote values(2, 'Rework');
insert into Wrote values(3, 'The Lion King');
insert into Wrote values(4, 'Rich Dad');
insert into Wrote values(8, 'The Power of Habit');
  
insert into Purchased values(200, 'Anna Karenina');
insert into Purchased values(200, 'The Lion King');
insert into Purchased values(201, 'Anna Karenina');
insert into Purchased values(202, 'War and Peace');
insert into Purchased values(203, 'War and Peace');
insert into Purchased values(204, 'Heidi');
insert into Purchased values(204, 'Rework');
insert into Purchased values(204, 'The Lion King');
    
/* 1 */
select *
from author;
select *
from translator;
select *
from book;
select *
from wrote;
select * 
from customer;
select *
from purchased;
/* 2 */
SELECT "level", cname
FROM (select "level", cname, o
WHERE aname = 'Adams';
/* 3 */
select "category", "btitle" as "name"
from book
where tid in (select tid from translator where tname = 'Mark')
and "edition" > 10;
/* 4. Find the Authors' names of all books, each of which has more than 2 authors. */
SELECT aname FROM author WHERE aid in (SELECT aid FROM wrote WHERE "btitle" IN (SELECT "btitle" FROM wrote GROUP BY "btitle" HAVING COUNT(*) > 1));
/* 5. Find the names of the translators for whom the combined number of authors for all books that 
they translated is equal to or more than 2.*/
select tname
from Translator
where tid in (
select ttid
from (select ttid, count (distinct aid) authcount
     from (select Translator.tid ttid, Book.tid, Book."btitle", Wrote."btitle", Wrote.aid aid
         from Translator, Book, Wrote
         where (Translator.tid = Book.tid and Book."btitle" = Wrote."btitle"))
     group by ttid)
where authcount >= 2);
/* 6. Find the categories which have exactly 2 translators. */
select "category"
from (select "category", count (distinct tid) as translator_count
      from BOOK
      group by "category")
where translator_count = 2;
/* 7. Find the names and aids of all authors who wrote two books that are in the same category. */
select aname, aid
from Author
where aid in
(select aaid
from    (select aaid, count (distinct "category") catcount
        from    (select Author.aid aaid, Wrote.aid, Wrote."btitle", Book."btitle", Book."category" "category"
                from Author, Wrote, Book
                where (Author.aid = Wrote.aid and Wrote."btitle" = Book."btitle"))
        group by aaid)
where catcount >= 2);
/* 8. For each category, display the category and the average number of editions for that category. */
select "category", avg ("edition")
from BOOK
group by "category";
/* 9 */
update Translator
set salary = salary * 1.10
WHERE tid in (select tid
              from book
              where "btitle" = "Beautiful Mind");
/* 10 */
DELETE FROM Customer
WHERE "level" = 'Children';
    
/* Used to drop tables quickly for testing
DROP TABLE WROTE;
DROP TABLE PURCHASED;
DROP TABLE BOOK;
DROP TABLE TRANSLATOR;
DROP TABLE CUSTOMER;
DROP TABLE AUTHOR;*/