CREATE OR REPLACE TRIGGER check_exam_limit
BEFORE INSERT OR UPDATE ON ExamResults
FOR EACH ROW
DECLARE
  exam_count INT;
BEGIN
  SELECT COUNT(1) INTO exam_count FROM ExamResults WHERE student_id = :new.student_id AND semester = :new.semester;
  IF exam_count >= 5 THEN
    RAISE_APPLICATION_ERROR(-20000, 'Cannot have more than 5 exams in a semester');
  END IF;
END;