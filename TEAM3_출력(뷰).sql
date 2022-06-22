-- TEAM3 ���(��)

/*
���� ������ �� �䱸�м�(������) - 3.������ ���� ���� ��� ���� ����
������ ��, ������ �����, ���� �Ⱓ(���� ������, �� ������), ���� ��, ���ǽ�, ���� ���� ����(���� ����, ���� ��, ���� ����)
*/

CREATE OR REPLACE VIEW VIEW_PROFESSORS
AS
SELECT P.PROF_NAME "������", C.COURSE_NAME "������", SJ.SUBJECT_NAME "������ �����"
     , OS.START_DATE "������", OS.END_DATE "������" , BK.BOOK_NAME "�����", CL.CLASS_NAME "���ǽ�" 
     , CASE WHEN (OS.END_DATE - SYSDATE < 0) AND (SYSDATE - OS.START_DATE > 0)  THEN '���� ����'
            WHEN (OS.END_DATE - SYSDATE > 0) AND (SYSDATE - OS.START_DATE > 0)  THEN '���� ������'
            WHEN (OS.END_DATE - SYSDATE > 0) AND (SYSDATE - OS.START_DATE < 0)  THEN '���� ����'
            ELSE '�˼�����' 
            END "�������࿩��"  
FROM PROF P JOIN OPEN_COUR OC
ON P.PROF_ID = OC.PROF_ID 
    JOIN COURSE C 
    ON OC.COURSE_ID = C.COURSE_ID
    JOIN OPEN_SUBJ OS
    ON OC.OPEN_COUR_ID = OS.OPEN_COUR_ID
    JOIN SUBJECT SJ 
    ON OS.SUBJECT_ID = SJ.SUBJECT_ID
    JOIN BOOK BK 
    ON OS.BOOK_ID = BK.BOOK_ID
    JOIN CLASS CL
    ON OC.CLASS_ID =CL.CLASS_ID;

SELECT *
FROM VIEW_PROFESSORS;          

--------------------------------------------------------------------------------

/*
���� ������ �� �䱸�м�(������) - 4.���� ���� ��� ���� ����
������, ���ǽ�, �����, ���� �Ⱓ(���� ������, �� ������), ���� ��, ������ ��
*/

CREATE OR REPLACE VIEW VIEW_COURSES
AS
SELECT CO.COURSE_NAME "������"
     , CL.CLASS_NAME "���ǽǸ�"
     , SB.SUBJECT_NAME "�����"
     , OS.START_DATE "���������"
     , OS.END_DATE "����������"
     , BK.BOOK_NAME "�����"
     , PR.PROF_NAME "�����̸�"
FROM OPEN_SUBJ OS
JOIN OPEN_COUR OC
ON OS.OPEN_COUR_ID = OC.OPEN_COUR_ID
JOIN CLASS CL
ON OC.CLASS_ID = CL.CLASS_ID
JOIN COURSE CO
ON OC.COURSE_ID = CO.COURSE_ID
JOIN SUBJECT SB
ON OS.SUBJECT_ID = SB.SUBJECT_ID
JOIN BOOK BK
ON OS.BOOK_ID = BK.BOOK_ID
JOIN PROF PR
ON OC.PROF_ID = PR.PROF_ID;

SELECT *
FROM VIEW_COURSES;           

--------------------------------------------------------------------------------

/*
���� ������ �� �䱸�м�(������) - 5.���� ���� ��� ���� ����
������, ���ǽ�, �����, ���� �Ⱓ(���� ������, �� ������), ���� ��, ������ ��
*/

CREATE OR REPLACE VIEW VIEW_STUDENTS
AS
SELECT ST.STU_NAME "�л� �̸�", CO.COURSE_NAME "������", SU.SUBJECT_NAME "��������"
     , NVL(SC.ATTEND_SCORE * OS.ATTEND_POINT/100 + SC.WRITE_SCORE * WRITE_POINT/100 + SC.PRACTICE_SCORE * PRACTICE_POINT/100, 0) "������������"
     , (CASE WHEN AP.APP_ID = DR.APP_ID THEN '�ߵ�Ż��O' ELSE '�ߵ�Ż��X' END) "�ߵ�Ż��"
FROM STU ST JOIN APP AP  
ON ST.STU_ID = AP.STU_ID
    JOIN OPEN_COUR OC
    ON AP.OPEN_COUR_ID = OC.OPEN_COUR_ID
	JOIN COURSE CO
        ON OC.COURSE_ID = CO.COURSE_ID     
	    JOIN OPEN_SUBJ OS
            ON OC.OPEN_COUR_ID = OS.OPEN_COUR_ID
                JOIN SUBJECT SU
                ON OS.SUBJECT_ID = SU.SUBJECT_ID
                    JOIN SCORE SC
                    ON OS.OPEN_SUBJ_ID = SC.OPEN_SUBJ_ID AND SC.APP_ID = AP.APP_ID
                        LEFT JOIN DROPOUT DR
                        ON AP.APP_ID = DR.APP_ID;

SELECT *
FROM VIEW_STUDENTS;                        
                        
--------------------------------------------------------------------------------

/*
���� ����� �� �䱸�м�(������) - 3.���� ��� ��� ���� ����
�����, ���� �Ⱓ(���� ������, �� ������), ���� ��, �л� ��, ���, �Ǳ�, �ʱ�, ����, ��� 
*/

CREATE OR REPLACE VIEW VIEW_PROFESSOR_GRADE
AS
SELECT T.�����, T.����Ⱓ, T.�����, T.�л���, T.���, T.�Ǳ�, T. �ʱ�, T.����
     , RANK() OVER(PARTITION BY T.���������ڵ� ORDER BY T.���� DESC) "���"
     , T.�ߵ�Ż������
FROM
(
    SELECT SJ.SUBJECT_NAME "�����", OS.START_DATE || ' - ' || OS.END_DATE "����Ⱓ"
         , B.BOOK_NAME "�����", S.STU_NAME "�л���" 
         , NVL(SC.ATTEND_SCORE * OS.ATTEND_POINT, 0) / 100 "���"
         , NVL(SC.PRACTICE_SCORE * OS.PRACTICE_POINT, 0) / 100 "�Ǳ�"
         , NVL(SC.WRITE_SCORE * OS.WRITE_POINT, 0) / 100 "�ʱ�"
         , NVL(SC.ATTEND_SCORE * OS.ATTEND_POINT, 0) / 100 + NVL(SC.PRACTICE_SCORE * OS.PRACTICE_POINT, 0) / 100 
           + NVL(SC.WRITE_SCORE * OS.WRITE_POINT, 0) / 100 "����"
         , OS.OPEN_SUBJ_ID "���������ڵ�"
         , CASE WHEN A.APP_ID = DR.APP_ID THEN '��' ELSE '��' END "�ߵ�Ż������"
    FROM OPEN_COUR OC JOIN PROF P
    ON OC.PROF_ID = P.PROF_ID
        JOIN OPEN_SUBJ OS
        ON OC.OPEN_COUR_ID = OS.OPEN_COUR_ID
        JOIN SUBJECT SJ
        ON OS.SUBJECT_ID = SJ.SUBJECT_ID
        JOIN BOOK B
        ON OS.BOOK_ID = B.BOOK_ID
        JOIN APP A
        ON OC.OPEN_COUR_ID = A.OPEN_COUR_ID
        JOIN STU S
        ON A.STU_ID = S.STU_ID
        JOIN SCORE SC
        ON A.APP_ID = SC.APP_ID
        LEFT JOIN DROPOUT DR
        ON A.APP_ID = DR.APP_ID
) T;

SELECT *
FROM VIEW_PROFESSOR_GRADE;

--------------------------------------------------------------------------------

/*
���� ����� �� �䱸�м�(�л�) - 2.���� ��� ��� ���� ����
�л� �̸�, ������, �����, ���� �Ⱓ(���� ������, �� ������), ���� ��, ���, �Ǳ�, �ʱ�, ����, ��� 
*/

CREATE OR REPLACE VIEW VIEW_STUDENT_GRADE
AS SELECT T1.�л��̸�
    , T1.������
    , T1.�����
    , T1.���������
    , T1.����������
    , T1.�����
    , T1.��Ἲ��
    , T1.�ʱ⼺��
    , T1.�Ǳ⼺��
    , T1.����
    , T1.���
FROM(    
    SELECT S.STU_NAME �л��̸�
    , C.COURSE_NAME ������
    , SUB.SUBJECT_NAME �����
    , OS.START_DATE ���������
    , OS.END_DATE ����������
    , B.BOOK_NAME �����
    , SC.ATTEND_SCORE ��Ἲ��
    , SC.WRITE_SCORE �ʱ⼺��
    , SC.PRACTICE_SCORE �Ǳ⼺��
    , SC.ATTEND_SCORE + SC.WRITE_SCORE + SC.PRACTICE_SCORE ����
    , S.STU_ID �л��ڵ�
    ,SUB.SUBJECT_ID �����ڵ�
    , RANK() OVER(PARTITION BY OS.SUBJECT_ID ORDER BY SC.ATTEND_SCORE + SC.WRITE_SCORE + SC.PRACTICE_SCORE DESC) ���
    FROM OPEN_COUR OC, COURSE C, STU S, SUBJECT SUB, OPEN_SUBJ OS, APP A, BOOK B, SCORE SC
    WHERE S.STU_ID = A.STU_ID
    AND OC.COURSE_ID = C.COURSE_ID
    AND OS.OPEN_COUR_ID = OC.OPEN_COUR_ID
    AND OS.SUBJECT_ID = SUB.SUBJECT_ID
    AND OS.BOOK_ID = B.BOOK_ID
    AND SC.APP_ID = A.APP_ID) T1      
WHERE T1.�л��ڵ� = '1';

SELECT *
FROM VIEW_PROFESSOR_GRADE;
