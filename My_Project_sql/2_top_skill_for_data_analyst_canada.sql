with A as   (with canada as (SELECT *
            from job_postings_fact
            where job_location Ilike '%canada%')


            SELECT  job_id,
            job_title,
            job_location,
            salary_year_avg
            from canada
            left join company_dim
            on canada.company_id=company_dim.company_id
            WHERE job_title_short = 'Data Analyst' and
            salary_year_avg is not null
            ORDER BY salary_year_avg desc
            limit 10)

SELECT  A.*,
        skills
from A
join skills_job_dim as sjd
on A.job_id=sjd.job_id
join skills_dim as sd
on sjd.skill_id=sd.skill_id