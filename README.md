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

![Top Paying Role](assets\top_paying_roles.png)
*Bar graph visualizing the salary for the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results*

### 2. Skills for Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
WITH top_paying_jobs AS (
SELECT 
        job_id,
        job_title,
        salary_year_avg,
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
    LIMIT 10

)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
```
- Top Skills Required for High-Paying Data Analyst Jobs in 2025:
SQL is the most required skill, showing it remains the foundation for data extraction and database querying.
- Python ranks second, confirming its importance in data analysis, automation, and scripting.
- Tableau appears third, highlighting the strong demand for data visualization and dashboarding skills.
- R and Excel are moderately required, supporting statistical analysis and spreadsheet-based workflows.
- Pandas and Snowflake indicate growing demand for Python data manipulation and cloud data warehousing.
- Go, Bitbucket, and Azure appear less often but show value in automation, version control, and cloud technologies.
- Overall, the chart shows a blend of programming, visualization, cloud, and data management skills needed for top-paying data analyst jobs in 2025.

![Skills Count](assets\Skill_count.png)

### 3. In-Demand Skills for Data Analysts
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5
```
- SQL : Highest-demand skill, essential for querying and managing large datasets.
- Excel : Still heavily required for quick analysis, reporting, and data cleaning.
- Python : Key programming tool for automation, data manipulation, and analytics.
- Tableau : Strong need for visual storytelling and interactive dashboards.
- Power BI : Widely used in business environments for BI reporting and insights.

| Skill   | Demand Count |
|---------|--------------|
| SQL     | 7,291        |
| Excel   | 4,611        |
| Python  | 4,330        |
| Tableau | 3,745        |
| Power BI| 2,609        |

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the hightest paying.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
```
Here's a breakdown of the results for top paying skills for Data Analysts:

- Python: Highest-paying skill, strongly tied to automation, ML, and data engineering.
- SQL: Core data skill trusted in high-paying enterprise roles.
- Tableau: Visualization skill valued for converting insights into business decisions.
- Power BI: Popular in enterprise environments for internal dashboards.
- Excel: Still earns solid salaries due to its ubiquity in business analytics.

| Skill          | Average Salary |
|----------------|----------------|
| PySpark        | $208,172       |
| Bitbucket      | $189,155       |
| Couchbase      | $160,515       |
| Watson         | $160,515       |
| DataRobot      | $155,486       |
| GitLab         | $154,500       |
| Swift          | $153,750       |
| Jupyter        | $152,777       |
| Pandas         | $151,821       |
| Elasticsearch  | $145,000       |

Table of the average salary for the top 10 paying skills for data analyst

### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
| Skill ID | Skill         | Demand Count | Average Salary ($) |
|----------|---------------|--------------|--------------------|
| 1        | Python        | 236          | 101,397            |
| 5        | R             | 148          | 100,499            |
| 182      | Tableau       | 230          | 99,288             |
| 80       | Snowflake     | 37           | 112,948            |
| 79       | Oracle        | 37           | 104,534            |
| 185      | Looker        | 49           | 103,795            |
| 186/7    | SAS           | 63           | 98,902             |
| 61       | SQL Server    | 35           | 97,786             |
| 74       | Azure         | 34           | 111,225            |
| 76       | AWS           | 32           | 108,317            |

Table of the most optimal skills for data analyst sorted by salary

Here's a breakdown of the most optimal skills for Data Analyst in 2025:

- High-Demand Programming: Python (236 demand) and R (148 demand) dominate for analytics automation and statistical modeling, with Go offering high salary specialization.
- Cloud & Big Data: Snowflake ($112K), Azure ($111K), and Databricks ($141K) lead as top-paying cloud platforms, emphasizing cloud migration and large-scale data processing.
- BI & Visualization: Tableau (230 demand) remains the visualization standard, while Looker ($103K) grows in modern BI, and PySpark ($208K) commands the highest salary for data processing.
- Database Technologies: Oracle ($104K) and SQL Server maintain enterprise demand, with PostgreSQL ($123K) and NoSQL offering strong open-source and flexible data solutions.

# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **Complex Query Crafting:** Mastering advanced SQL techniques including multi-layered joins, window functions, CTEs, and query optimization for efficient data extraction and transformation across diverse database systems.
- **Data Aggregation:** Developing expertise in summarizing, grouping, and consolidating large datasets using aggregation functions, pivot operations, and statistical summaries to transform raw data into actionable business insights.
- **Analytical Wizardry:** Applying statistical methods, trend analysis, and predictive modeling techniques to uncover patterns, correlations, and actionable intelligence from complex datasets, turning information into strategic decisions.
