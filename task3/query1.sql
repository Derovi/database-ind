SELECT (CASE WHEN 
    (SELECT COUNT(1) FROM CreditResults c WHERE c.student_id = s.record_book_number AND c.semester = 3 AND c.is_credited = 'N') = 0
THEN (SELECT AVG(e.grade) + 1 FROM ExamResults e WHERE e.student_id = s.record_book_number AND e.semester = 3) ELSE 2 END) AS avg_grade FROM Students s WHERE s.name = 'John Smith';