-- <프로그래머스 '고양이와 개는 몇 마리 있을까'>

-- 문제 설명
-- ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. 
-- ANIMAL_INS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.

-- NAME	TYPE	NULLABLE
-- ANIMAL_ID	VARCHAR(N)	FALSE
-- ANIMAL_TYPE	VARCHAR(N)	FALSE
-- DATETIME	DATETIME	FALSE
-- INTAKE_CONDITION	VARCHAR(N)	FALSE
-- NAME	VARCHAR(N)	TRUE
-- SEX_UPON_INTAKE	VARCHAR(N)	FALSE



--1. 동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회하는 SQL문을 작성해주세요. 이때 고양이가 개보다 먼저 조회해주세요.

-- ANIMAL_TYPE	count
-- Cat	2
-- Dog	1

SELECT ANIMAL_TYPE,
       COUNT(*)
  FROM ANIMAL_INS
 GROUP BY ANIMAL_TYPE
 HAVING ANIMAL_TYPE LIKE 'cat'
     OR ANIMAL_TYPE LIKE 'Dog'
 ORDER BY ANIMAL_TYPE


 --2. 동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요. 
 -- 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.

-- NAME	COUNT
-- Lucy 	3
-- Raven	2

-- 코드를 입력하세요
SELECT NAME,
       COUNT(*) COUNT
  FROM ANIMAL_INS
 GROUP BY NAME
 HAVING COUNT(NAME) > 1
 ORDER BY NAME


-- 문제 설명
-- ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블입니다. 
-- ANIMAL_OUTS 테이블 구조는 다음과 같으며, 
-- ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME는 각각 동물의 아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부를 나타냅니다.

-- NAME	TYPE	NULLABLE
-- ANIMAL_ID	VARCHAR(N)	FALSE
-- ANIMAL_TYPE	VARCHAR(N)	FALSE
-- DATETIME	DATETIME	FALSE
-- NAME	VARCHAR(N)	TRUE
-- SEX_UPON_OUTCOME	VARCHAR(N)	FALSE
-- 3. 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
-- 9시부터 19시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 시간대 순으로 정렬해야 합니다.

-- 예시
-- SQL문을 실행하면 다음과 같이 나와야 합니다.

-- HOUR	COUNT
-- 9	1
-- 10	2
-- 11	13
-- 12	10
-- 13	14
-- 14	9
-- 15	7
-- 16	10
-- 17	12
-- 18	16
-- 19	2

-- 코드를 입력하세요
SELECT DATE_FORMAT(DATETIME, '%H') AS HOUR,
       COUNT(*) COUNT
  FROM ANIMAL_OUTS
 GROUP BY HOUR
 HAVING HOUR BETWEEN 9 AND 19
 ORDER BY HOUR



-- 4. 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
-- 0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 시간대 순으로 정렬해야 합니다.

-- 예시
-- SQL문을 실행하면 다음과 같이 나와야 합니다.

-- HOUR	COUNT
-- 0	0
-- 1	0
-- 2	0
-- 3	0
-- 4	0
-- 5	0
-- 6	0
-- 7	3
-- 8	1
-- 9	1
-- 10	2
-- 11	13
-- 12	10
-- 13	14
-- 14	9
-- 15	7
-- 16	10
-- 17	12
-- 18	16
-- 19	2
-- 20	0
-- 21	0
-- 22	0
-- 23	0

SELECT DATE_FORMAT(DATETIME, '%H') AS HOUR,
       ifnull(COUNT(*), 0) COUNT
  FROM ANIMAL_OUTS
 GROUP BY HOUR
 ORDER BY HOUR