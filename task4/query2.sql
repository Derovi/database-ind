CREATE OR REPLACE TRIGGER check_exam_grade
BEFORE INSERT OR UPDATE ON ExamResults
FOR EACH ROW
DECLARE
  reporting_type VARCHAR2(255);
  is_credited CHAR(1);
BEGIN
  SELECT reporting_type INTO reporting_type FROM Subjects WHERE id = :new.subject_id;
  SELECT is_credited INTO is_credited FROM CreditResults WHERE student_id = :new.student_id AND subject_id = :new.subject_id AND semester = :new.semester;
  is_credited := COALESCE(is_credited, 'N');

  IF (reporting_type = 'both' AND is_credited = 'N') THEN
    :new.grade := NULL;
  END IF;
END;