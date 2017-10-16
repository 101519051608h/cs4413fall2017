DECLARE
    book_title VARCHAR2(20);
    search_type VARCHAR2(20);
    translator VARCHAR2(20);
    "other" VARCHAR2(20);
    
BEGIN
    book_title := 'Jurassic Park';
    search_type := 'AUTHOR';
    translator :=  'TRANSLATOR';
    "other" := 'OTHER';
    
    BOOK_INFO(book_title, search_type);
    BOOK_INFO(book_title, translator);
    BOOK_INFO(book_title, "other");
END;
