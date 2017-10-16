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
SELECT level, cname
FROM Customer, Author
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
WHERE btitle = 'Beautiful Mind';
/* 10 */
DELETE FROM Customer
WHERE "level" = 'children';
