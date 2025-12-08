SELECT * -- SubQuery starts here
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;
-- SubQuery ends here