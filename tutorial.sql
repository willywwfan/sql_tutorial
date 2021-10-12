INSERT INTO `client` VALUES(400, '阿狗', '254354335');
INSERT INTO `client` VALUES(401, '阿貓', '25633899');
INSERT INTO `client` VALUES(402, '旺來', '45354345');
INSERT INTO `client` VALUES(403, '露西', '54354365');
INSERT INTO `client` VALUES(404, '艾瑞克', '18783783');


INSERT INTO `works_with` VALUES(206, 400, 70000);
INSERT INTO `works_with` VALUES(207, 401, 24000);
INSERT INTO `works_with` VALUES(208, 402, 9800);
INSERT INTO `works_with` VALUES(208, 403, 24000);
INSERT INTO `works_with` VALUES(210, 404, 87940);


SELECT *
FROM `employee`
ORDER BY `salary` ASC
LIMIT 3;

SELECT DISTINCT `sex` FROM `employee`;

SELECT * FROM `employee`;
SELECT * FROM `branch`;
SELECT * FROM `client`;

-- 取得員工人數
SELECT COUNT(`sup_id`) FROM `employee`;

SELECT COUNT(*)
FROM `employee`
WHERE `birth_date` > '1970-01-01' AND `sex` = 'F';

SELECT AVG(`salary`) FROM `employee`;

SELECT SUM(`salary`) FROM `employee`;

SELECT MAX(`salary`) FROM `employee`;

SELECT MIN(`salary`) FROM `employee`;

-- wildcards
SELECT * FROM `client` WHERE `phone` LIKE '%5';

SELECT * FROM `client` WHERE `client_name` LIKE '艾%';

SELECT * FROM `employee` WHERE `birth_date` LIKE '_____12%';

-- union
SELECT `name`
FROM `employee`
UNION
SELECT `client_name`
FROM `client`;

SELECT `emp_id`, `name` AS `total_name`
FROM `employee`
UNION
SELECT `client_id`, `client_name`
FROM `client`;

SELECT `salary` AS `money`
FROM `employee`
UNION
SELECT `total_sales`
FROM `works_with`;
-- join
INSERT INTO `branch` VALUES(4, '偷懶', NULL);
SELECT `employee`.`emp_id`, `employee`.`name`, `branch`.`branch_name`
FROM `employee` RIGHT JOIN `branch`
ON `employee`.`emp_id` = `branch`.`manager_id`;

-- subquery
SELECT `name`
FROM `employee`
WHERE `emp_id` = (
	SELECT `manager_id`
	FROM `branch`
	WHERE `branch_name` = '研發'
); 

SELECT `name`
FROM `employee`
WHERE `emp_id` IN (
	SELECT `emp_id`
	FROM `works_with`
	WHERE `total_sales` > 50000
);

-- on delete
DELETE FROM `employee`
WHERE `emp_id` = 207;
