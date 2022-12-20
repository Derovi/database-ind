CREATE OR REPLACE TRIGGER check_exam_date
BEFORE INSERT OR UPDATE ON ExamResults
FOR EACH ROW
BEGIN
  IF (:new.semester MOD 2 = 1 AND (:new.exam_date NOT BETWEEN TO_DATE('01-DEC-YYYY', 'DD-MON-YYYY') AND TO_DATE('31-JAN-YYYY+1', 'DD-MON-YYYY'))) OR
     (:new.semester MOD 2 = 0 AND (:new.exam_date NOT BETWEEN TO_DATE('01-MAY-YYYY', 'DD-MON-YYYY') AND TO_DATE('30-JUN-YYYY', 'DD-MON-YYYY'))) THEN
    RAISE_APPLICATION_ERROR(-20001, 'Exam date must correspond to the semester in which the subject was taken');
  END IF;
END;