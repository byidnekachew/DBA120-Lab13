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
SELECT * FROM word_rel;

-- Q2
UPDATE word_rel
    SET syn_col = 'blithe'
    WHERE word = 'insouciant';

-- Q3
CREATE OR REPLACE VIEW word_rel (word, syn_col, ant_col) AS
    SELECT s.word_term, s.syn_word, a.ant_word
    FROM word_synonyms s, word_antonyms a
    WHERE a.word_id = s.word_id
    WITH READ ONLY;

-- Q4
SELECT * FROM word_analysis;

-- Q5
SELECT word, word_length
    FROM (SELECT word, word_length FROM word_analysis ORDER BY word_length desc)
    WHERE rownum <= 2;

-- Q6
DROP VIEW word_rel;

CREATE OR REPLACE VIEW word_rel (word, syn_col, ant_col) AS
    SELECT s.word_term, s.syn_word, a.ant_word
    FROM word_synonyms s, word_antonyms a
    WHERE a.word_id = s.word_id;

-- Q7
SELECT * FROM word_summary;

-- Q8
CREATE OR REPLACE VIEW word_homonyms AS 
    SELECT word_term AS homonym,
       MIN(meaning) AS "Primary definition",
       MAX(meaning) AS "Secondary definition"
    FROM HOMONYMS
    GROUP BY word_term;
