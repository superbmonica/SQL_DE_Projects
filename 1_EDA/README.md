# Heading 1
## Heading 2
### Heading 3
Normal Text  
**Bold Text**  
*Iltalics Text*  
`This is code`  
- Bullet1  
- Bullet2
- Bullet3  
1. Number1  
2. Number2  
[Link Text](https://google.com)
![Alt Text](https://github.com/lukebarousse/SQL_Data_Engineering_Course/raw/main/Resources/images/1_1_Project1_EDA.png)  
``` sql
SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer' 
    AND jpf.job_work_from_home = True 
GROUP BY
    sd.skills
ORDER BY
    demand_count DESC
LIMIT 10;
```