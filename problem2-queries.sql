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

/* 3 */

select "category", "btitle" as "name"
from book
where tid in (select tid from translator where tname = 'Mark')
and "edition" > 10;

/* 4. Find the Authors' names of all books, each of which has more than 2 authors. */

SELECT aname FROM author WHERE aid in (SELECT aid FROM wrote WHERE "btitle" IN (SELECT "btitle" FROM wrote GROUP BY "btitle" HAVING COUNT(*) > 1));

/* 5. Find the names of the translators for whom the combined number of authors for all books that 
they translated is equal to or more than 2.*/
/* 6. Find the categories which have exactly 2 translators. */
/* 7. Find the names and aids of all authors who wrote two books that are in the same category. */
/* 8. For each category, display the category and the average number of editions for that category. */