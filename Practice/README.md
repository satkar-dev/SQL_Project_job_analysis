# Introduction
Focusing on Data Analyst roles, this project uncovers the pulse of today’s data industry — from top‑paying opportunities 💸 to the most in‑demand skills 📊.

You’ll explore where high demand meets high salary 🎯, revealing the skills that truly drive value in the world of data analytics.

🔍 SQL queries? Check them out here: [project_sql_folder](/project_sql/)
# Background
The data job market is rapidly evolving as companies increasingly rely on data to drive decisions 📈. With Data Analyst roles growing across industries, understanding which jobs pay the most and what skills are truly in demand has become essential.
To explore these trends, I analyzed job postings using SQL to uncover insights about salaries, demand, and skill usefulness 🎯.

### 📝 The questions I wanted to answer through my SQL queries were:

1️⃣ What are the top-paying jobs for my role?

2️⃣ What skills are required for these top-paying roles?

3️⃣ What are the most in-demand skills for my role?

4️⃣ What are the top skills based on salary for my role?

5️⃣ What are the most optimal skills to learn?

# Tools I used
- **SQL:** Used to query, clean, and analyze job posting data to extract meaningful insights.

- **PostgreSQL :** Served as the database system where all datasets were stored, managed, and queried efficiently.

- **Visual Studio Code :** My primary code editor for writing SQL queries and managing project files with ease.

- **Git :** Used for version control to track changes and maintain clean backups of scripts and analysis.

- **GitHub :** Hosted my project repository, making it easy to share, collaborate, and showcase my work online.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in 2025:
- **Wide Salary Range:** Top 10 paying data analyst roles span from $184,000 to $650,000, indicating significant salary potential in this field.
- **Diverse Employers:** Companies like SmartAssest, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
- **Job Title Variety:** There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

![Top Paying Roles]
# What I Learned

# Conclusion