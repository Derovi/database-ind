DROP TABLE Students;
DROP TABLE Subjects;
DROP TABLE ExamResults;
DROP TABLE CreditResults;

CREATE TABLE Students (
  record_book_number NUMBER NOT NULL PRIMARY KEY,
  name VARCHAR2(255) NOT NULL,
  semester NUMBER NOT NULL CHECK (semester BETWEEN 1 AND 8)
);

CREATE TABLE Subjects (
  id NUMBER PRIMARY KEY,
  name VARCHAR2(255) NOT NULL,
  start_semester NUMBER NOT NULL CHECK (start_semester BETWEEN 1 AND 8),
  end_semester NUMBER NOT NULL CHECK (end_semester BETWEEN 1 AND 8),
  hours NUMBER NOT NULL CHECK (hours BETWEEN 1 AND 999),
  reporting_type VARCHAR2(255) NOT NULL CHECK (reporting_type IN ('exam', 'credit', 'both'))
);

CREATE TABLE ExamResults (
  student_id NUMBER NOT NULL,
  subject_id NUMBER NOT NULL,
  semester NUMBER NOT NULL CHECK (semester BETWEEN 1 AND 8),
  exam_date DATE NOT NULL,
  grade NUMBER NOT NULL CHECK (grade BETWEEN 1 AND 10),
  PRIMARY KEY (student_id, subject_id, semester),
  FOREIGN KEY (student_id) REFERENCES Students (record_book_number),
  FOREIGN KEY (subject_id) REFERENCES Subjects (id)
);

CREATE TABLE CreditResults (
  student_id NUMBER NOT NULL,
  subject_id NUMBER NOT NULL,
  semester NUMBER NOT NULL CHECK (semester BETWEEN 1 AND 8),
  credit_date DATE NOT NULL,
  is_credited CHAR(1) NOT NULL CHECK (is_credited IN ('Y', 'N')),
  PRIMARY KEY (student_id, subject_id, semester),
  FOREIGN KEY (student_id) REFERENCES Students (record_book_number),
  FOREIGN KEY (subject_id) REFERENCES Subjects (id)
);

INSERT INTO Students (record_book_number, name, semester) VALUES (12345, 'John Smith', 8);
INSERT INTO Students (record_book_number, name, semester) VALUES (23456, 'Jane Doe', 7);
INSERT INTO Students (record_book_number, name, semester) VALUES (34567, 'Mike Williams', 6);
INSERT INTO Students (record_book_number, name, semester) VALUES (45678, 'Sarah Johnson', 5);
INSERT INTO Students (record_book_number, name, semester) VALUES (56789, 'Tom Brown', 4);
INSERT INTO Students (record_book_number, name, semester) VALUES (67890, 'Alice Davis', 3);
INSERT INTO Students (record_book_number, name, semester) VALUES (78901, 'Bob Anderson', 2);
INSERT INTO Students (record_book_number, name, semester) VALUES (89012, 'Carol Roberts', 1);
INSERT INTO Students (record_book_number, name, semester) VALUES (90123, 'David Thompson', 8);
INSERT INTO Students (record_book_number, name, semester) VALUES (10234, 'Emma Williams', 7);

INSERT INTO Subjects (id, name, start_semester, end_semester, hours, reporting_type) VALUES (1, 'Mathematics', 1, 3, 200, 'both');
INSERT INTO Subjects (id, name, start_semester, end_semester, hours, reporting_type) VALUES (2, 'Physics', 2, 4, 150, 'exam');
INSERT INTO Subjects (id, name, start_semester, end_semester, hours, reporting_type) VALUES (3, 'Chemistry', 3, 5, 100, 'credit');
INSERT INTO Subjects (id, name, start_semester, end_semester, hours, reporting_type) VALUES (4, 'Biology', 4, 6, 150, 'credit');
INSERT INTO Subjects (id, name, start_semester, end_semester, hours, reporting_type) VALUES (5, 'Computer Science', 5, 8, 200, 'both');
INSERT INTO Subjects (id, name, start_semester, end_semester, hours, reporting_type) VALUES (6, 'Literature', 6, 7, 100, 'credit');
INSERT INTO Subjects (id, name, start_semester, end_semester, hours, reporting_type) VALUES (7, 'History', 7, 8, 150, 'exam');
INSERT INTO Subjects (id, name, start_semester, end_semester, hours, reporting_type) VALUES (8, 'Geography', 1, 1, 200, 'credit');
INSERT INTO Subjects (id, name, start_semester, end_semester, hours, reporting_type) VALUES (9, 'Economics', 2, 3, 150, 'exam');
INSERT INTO Subjects (id, name, start_semester, end_semester, hours, reporting_type) VALUES (10, 'Philosophy', 3, 4, 100, 'credit');

INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 1, 1, to_date('16.01.2019', 'dd.mm.yyyy'), 8);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 1, 2, to_date('18.06.2020', 'dd.mm.yyyy'), 7);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 1, 3, to_date('20.01.2020', 'dd.mm.yyyy'), 8);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 2, 2, to_date('22.06.2020', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 2, 3, to_date('25.01.2020', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 2, 4, to_date('09.06.2021', 'dd.mm.yyyy'), 6);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 5, 5, to_date('04.01.2021', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 5, 6, to_date('02.06.2022', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 5, 7, to_date('14.01.2022', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 7, 7, to_date('12.01.2022', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 9, 2, to_date('17.06.2020', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (12345, 9, 3, to_date('20.01.2020', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (23456, 1, 1, to_date('04.01.2020', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (23456, 1, 2, to_date('11.06.2020', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (23456, 1, 3, to_date('10.01.2021', 'dd.mm.yyyy'), 6);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (23456, 2, 2, to_date('19.06.2020', 'dd.mm.yyyy'), 6);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (23456, 2, 3, to_date('05.01.2021', 'dd.mm.yyyy'), 8);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (23456, 2, 4, to_date('22.06.2021', 'dd.mm.yyyy'), 6);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (23456, 5, 5, to_date('21.01.2022', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (23456, 5, 6, to_date('20.06.2022', 'dd.mm.yyyy'), 1);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (23456, 9, 2, to_date('13.06.2020', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (23456, 9, 3, to_date('13.01.2021', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (34567, 1, 1, to_date('05.01.2020', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (34567, 1, 2, to_date('04.06.2021', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (34567, 1, 3, to_date('13.01.2021', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (34567, 2, 2, to_date('22.06.2021', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (34567, 2, 3, to_date('06.01.2021', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (34567, 2, 4, to_date('21.06.2022', 'dd.mm.yyyy'), 8);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (34567, 5, 5, to_date('02.01.2022', 'dd.mm.yyyy'), 7);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (34567, 9, 2, to_date('18.06.2021', 'dd.mm.yyyy'), 6);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (34567, 9, 3, to_date('18.01.2021', 'dd.mm.yyyy'), 7);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (45678, 1, 1, to_date('06.01.2021', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (45678, 1, 2, to_date('10.06.2021', 'dd.mm.yyyy'), 6);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (45678, 1, 3, to_date('04.01.2022', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (45678, 2, 2, to_date('03.06.2021', 'dd.mm.yyyy'), 1);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (45678, 2, 3, to_date('01.01.2022', 'dd.mm.yyyy'), 2);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (45678, 2, 4, to_date('03.06.2022', 'dd.mm.yyyy'), 8);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (45678, 9, 2, to_date('20.06.2021', 'dd.mm.yyyy'), 6);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (45678, 9, 3, to_date('08.01.2022', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (56789, 1, 1, to_date('01.01.2021', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (56789, 1, 2, to_date('14.06.2022', 'dd.mm.yyyy'), 6);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (56789, 1, 3, to_date('24.01.2022', 'dd.mm.yyyy'), 2);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (56789, 2, 2, to_date('20.06.2022', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (56789, 2, 3, to_date('12.01.2022', 'dd.mm.yyyy'), 7);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (56789, 9, 2, to_date('25.06.2022', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (56789, 9, 3, to_date('11.01.2022', 'dd.mm.yyyy'), 2);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (67890, 1, 1, to_date('04.01.2022', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (67890, 1, 2, to_date('24.06.2022', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (67890, 2, 2, to_date('08.06.2022', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (67890, 9, 2, to_date('07.06.2022', 'dd.mm.yyyy'), 2);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (78901, 1, 1, to_date('05.01.2022', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 1, 1, to_date('12.01.2019', 'dd.mm.yyyy'), 7);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 1, 2, to_date('25.06.2020', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 1, 3, to_date('03.01.2020', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 2, 2, to_date('21.06.2020', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 2, 3, to_date('04.01.2020', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 2, 4, to_date('08.06.2021', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 5, 5, to_date('10.01.2021', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 5, 6, to_date('03.06.2022', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 5, 7, to_date('14.01.2022', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 7, 7, to_date('20.01.2022', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 9, 2, to_date('16.06.2020', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (90123, 9, 3, to_date('16.01.2020', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (10234, 1, 1, to_date('17.01.2020', 'dd.mm.yyyy'), 9);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (10234, 1, 2, to_date('01.06.2020', 'dd.mm.yyyy'), 1);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (10234, 1, 3, to_date('05.01.2021', 'dd.mm.yyyy'), 2);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (10234, 2, 2, to_date('13.06.2020', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (10234, 2, 3, to_date('10.01.2021', 'dd.mm.yyyy'), 7);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (10234, 2, 4, to_date('01.06.2021', 'dd.mm.yyyy'), 6);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (10234, 5, 5, to_date('07.01.2022', 'dd.mm.yyyy'), 5);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (10234, 5, 6, to_date('02.06.2022', 'dd.mm.yyyy'), 7);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (10234, 9, 2, to_date('15.06.2020', 'dd.mm.yyyy'), 4);
INSERT INTO EXAMRESULTS (student_id, subject_id, semester, exam_date, grade) VALUES (10234, 9, 3, to_date('02.01.2021', 'dd.mm.yyyy'), 6);

INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 1, 1, to_date('25.01.2019', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 1, 2, to_date('10.06.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 1, 3, to_date('20.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 3, 3, to_date('01.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 3, 4, to_date('05.06.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 3, 5, to_date('13.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 4, 4, to_date('14.06.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 4, 5, to_date('11.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 4, 6, to_date('02.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 5, 5, to_date('05.01.2021', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 5, 6, to_date('07.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 5, 7, to_date('07.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 6, 6, to_date('25.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 6, 7, to_date('07.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 8, 1, to_date('01.01.2019', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 10, 3, to_date('14.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (12345, 10, 4, to_date('03.06.2021', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 1, 1, to_date('22.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 1, 2, to_date('07.06.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 1, 3, to_date('25.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 3, 3, to_date('21.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 3, 4, to_date('08.06.2021', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 3, 5, to_date('21.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 4, 4, to_date('10.06.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 4, 5, to_date('05.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 4, 6, to_date('03.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 5, 5, to_date('17.01.2022', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 5, 6, to_date('12.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 6, 6, to_date('22.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 8, 1, to_date('16.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 10, 3, to_date('18.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (23456, 10, 4, to_date('09.06.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 1, 1, to_date('01.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 1, 2, to_date('24.06.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 1, 3, to_date('16.01.2021', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 3, 3, to_date('20.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 3, 4, to_date('02.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 3, 5, to_date('16.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 4, 4, to_date('05.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 4, 5, to_date('20.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 5, 5, to_date('21.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 8, 1, to_date('21.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 10, 3, to_date('16.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (34567, 10, 4, to_date('06.06.2022', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (45678, 1, 1, to_date('23.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (45678, 1, 2, to_date('08.06.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (45678, 1, 3, to_date('19.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (45678, 3, 3, to_date('19.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (45678, 3, 4, to_date('13.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (45678, 4, 4, to_date('19.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (45678, 8, 1, to_date('18.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (45678, 10, 3, to_date('18.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (45678, 10, 4, to_date('24.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (56789, 1, 1, to_date('23.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (56789, 1, 2, to_date('10.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (56789, 1, 3, to_date('09.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (56789, 3, 3, to_date('16.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (56789, 8, 1, to_date('06.01.2021', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (56789, 10, 3, to_date('09.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (67890, 1, 1, to_date('14.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (67890, 1, 2, to_date('10.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (67890, 8, 1, to_date('19.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (78901, 1, 1, to_date('08.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (78901, 8, 1, to_date('12.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 1, 1, to_date('18.01.2019', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 1, 2, to_date('10.06.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 1, 3, to_date('05.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 3, 3, to_date('07.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 3, 4, to_date('08.06.2021', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 3, 5, to_date('12.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 4, 4, to_date('09.06.2021', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 4, 5, to_date('09.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 4, 6, to_date('12.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 5, 5, to_date('13.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 5, 6, to_date('13.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 5, 7, to_date('19.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 6, 6, to_date('13.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 6, 7, to_date('19.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 8, 1, to_date('13.01.2019', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 10, 3, to_date('16.01.2020', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (90123, 10, 4, to_date('04.06.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 1, 1, to_date('10.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 1, 2, to_date('13.06.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 1, 3, to_date('25.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 3, 3, to_date('22.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 3, 4, to_date('13.06.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 3, 5, to_date('12.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 4, 4, to_date('14.06.2021', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 4, 5, to_date('16.01.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 4, 6, to_date('25.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 5, 5, to_date('04.01.2022', 'dd.mm.yyyy'), 'N');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 5, 6, to_date('02.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 6, 6, to_date('23.06.2022', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 8, 1, to_date('08.01.2020', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 10, 3, to_date('01.01.2021', 'dd.mm.yyyy'), 'Y');
INSERT INTO CREDITRESULTS (student_id, subject_id, semester, credit_date, is_credited) VALUES (10234, 10, 4, to_date('04.06.2021', 'dd.mm.yyyy'), 'Y');