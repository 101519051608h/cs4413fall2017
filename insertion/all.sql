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
