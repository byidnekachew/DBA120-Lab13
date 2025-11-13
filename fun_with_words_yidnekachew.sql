CREATE OR REPLACE VIEW WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id;

SELECT * FROM WORD_REL;


CREATE OR REPLACE VIEW WORD_ANALYSIS (word, syn_col, ant_col, word_length) AS
SELECT word, syn_col, ant_col, LENGTH(word)
FROM WORD_REL;

SELECT * FROM WORD_ANALYSIS;


CREATE OR REPLACE VIEW WORD_SUMMARY (word, syn_col, ant_col) AS
SELECT word, syn_col, ant_col
FROM WORD_REL;

SELECT * FROM WORD_SUMMARY;


SELECT view_name FROM user_views;

-- Q1
