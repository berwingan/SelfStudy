WITH MaxCommentLength AS (
    SELECT 
        w.id,
        LENGTH(w.comment) AS comment_length,
        MAX(LENGTH(w.comment)) OVER (PARTITION BY wt.name) AS max_comment_length
    FROM 
        work w 
    LEFT JOIN 
        work_type wt ON w.type = wt.id
)
SELECT 
    wt.name AS WORK_TYPE, 
    w.name AS WORK_NAME,
    mcl.comment_length AS COMMENT_LENGTH,
    w.comment AS COMMENT
FROM 
    work w
LEFT JOIN 
    MaxCommentLength mcl ON w.id = mcl.id
LEFT JOIN 
    work_type wt ON w.type = wt.id
WHERE 
    mcl.comment_length = mcl.max_comment_length
    AND mcl.comment_length <> 0
ORDER BY 
    wt.name, 
    w.name;



