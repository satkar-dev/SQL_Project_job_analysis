INSERT INTO job_applied
            (job_id,
            application_sent_date,
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status)
VALUES      (1,
             '2024-02-01',
             true,
             'resume-01.pdf',
             true,
             'cover-letter_01.pdf',
             'submitted'
             ),
             (2,
             '2024-02-02',
             false,
             'resume-02.pdf',
             false,
             NULL,
             'interview scheduled'
             ),
             (3,
             '2024-02-03',
             true,
             'resume-03.pdf',
             true,
             'cover-letter_03.pdf',
             'ghosted'
             ),
             (4,
             '2024-02-04',
             true,
             'resume-04.pdf',
             false,
             NULL,
             'submitted'
             ),
             (5,
             '2024-02-05',
             false,
             'resume-05.pdf',
             true,
             'cover-letter_05.pdf',
             'rejected');
             
SELECT *
FROM job_applied;