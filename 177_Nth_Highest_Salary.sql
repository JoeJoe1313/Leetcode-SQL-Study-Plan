CREATE FUNCTION getNthHighestSalary (N INT)
RETURNS INT

BEGIN
    RETURN (
            WITH distinct_salaries AS (
                    SELECT DISTINCT salary
                    FROM Employee
                    ),
                count_distinct_salaries AS (
                    SELECT COUNT(*)
                    FROM distinct_salaries
                    ),
                first_n_salaries AS (
                    SELECT salary
                    FROM distinct_salaries
                    ORDER BY salary DESC LIMIT N
                    )
            SELECT CASE 
                    WHEN (
                            SELECT *
                            FROM count_distinct_salaries
                            ) < N
                        THEN NULL
                    ELSE (
                            SELECT salary
                            FROM first_n_salaries
                            ORDER BY salary ASC LIMIT 1
                            )
                    END nth_salary
            );
END
