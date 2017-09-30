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
    release_year int,
    "edition" int,
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
    

    