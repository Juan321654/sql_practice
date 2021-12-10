CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT
  CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
  CONCAT(author_fname, ', ', author_lname) AS 'author',
  CONCAT(stock_quantity, ' in stock') AS 'quantity'
FROM
  books;


INSERT INTO
  books (
    title,
    author_fname,
    author_lname,
    released_year,
    stock_quantity,
    pages
  )
VALUES
  ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
  ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
  (
    'Lincoln In The Bardo',
    'George',
    'Saunders',
    2017,
    1000,
    367
  );

SELECT title
FROM books
WHERE title LIKE '%\%%'

SELECT
  CONCAT(title, ' - ', released_year) AS summary
FROM
  books
ORDER BY
  released_year DESC
LIMIT
  3


SELECT
  UPPER(CONCAT('my favorite author is ',author_fname, ' ', author_lname, '!'))
FROM
  books
ORDER BY
  author_lname;

SELECT CONCAT('In ', released_year, ', ', COUNT(*), ' book(s) released')
FROM books GROUP BY released_year;

SELECT COUNT(*) FROM books;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT SUM(stock_quantity) FROM books;
SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_fname, author_lname;
SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name' FROM books ORDER BY pages DESC LIMIT 1;
SELECT released_year AS year, COUNT(*) AS '# books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year ORDER BY released_year;

CREATE TABLE comments (
  content VARCHAR(100),
  created_at TIMESTAMP DEFAULT NOW()
)

CREATE TABLE comments2 (
  content VARCHAR(100),
  changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
)

UPDATE comments2 SET content = 'new content' WHERE content = 'This is a comment';

SELECT title, released_year FROM books WHERE released_year != 2017;
SELECT title, author_fname FROM books WHERE author_fname = 'neil';

SELECT title, stock_quantity,
  CASE
    WHEN stock_quantity <= 50 THEN '*'
    WHEN stock_quantity <= 100 THEN '**'
    ELSE '***'
  END AS 'stock_status'
FROM books;

SELECT title, author_lname, 
  CASE
    WHEN title='just kids' THEN 'Memoir'
    WHEN title='A heartbreaking work of staggering genius' THEN 'Memour'
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    ELSE 'Novel'
  END AS 'type'
FROM books;


SELECT title, author_lname, author_fname,
  CASE
    WHEN COUNT(*) = 1 THEN '1 book'
    ELSE CONCAT(COUNT(*), ' books')
  END AS 'COUNT'
FROM books GROUP BY author_lname, author_fname;