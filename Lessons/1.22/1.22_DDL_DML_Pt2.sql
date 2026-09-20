--Array Intro
SELECT ARRAY[1,2,3];
SELECT ARRAY['python','sql','r'];

WITH skills AS (
SELECT 'python' as skill
UNION ALL
SELECT 'sql'
UNION ALL
SELECT 'r'
),
skills_array AS (
SELECT ARRAY_AGG(skill ORDER BY skill) AS skills
FROM skills
)
SELECT 
 skills[1]
 FROM 
 skills_array;

 --JSON
 SELECT jsonb_build_object(
    'skill', 'python',
    'type', 'programming'
)

SELECT jsonb_build_object(
    'skill', 'python',
    'type', 'programming'
) -> 'skill';


SELECT unnest(ARRAY['python', 'sql', 'r']);


SELECT ARRAY[
    jsonb_build_object('skill', 'python', 'type', 'programming'),
    jsonb_build_object('skill', 'sql', 'type', 'database')
] AS skills;

SELECT unnest(ARRAY[
    jsonb_build_object('skill', 'python', 'type', 'programming'),
    jsonb_build_object('skill', 'sql', 'type', 'database')
]);