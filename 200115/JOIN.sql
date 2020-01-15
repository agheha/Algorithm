--ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. 
--ANIMAL_INS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 각각 
--동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.

--NAME				TYPE	NULLABLE
--ANIMAL_ID			VARCHAR(N)	FALSE
--ANIMAL_TYPE		VARCHAR(N)	FALSE
--DATETIME			DATETIME	FALSE
--INTAKE_CONDITION	VARCHAR(N)	FALSE
--NAME				VARCHAR(N)	TRUE
--SEX_UPON_INTAKE	VARCHAR(N)	FALSE

--ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블입니다. 
--ANIMAL_OUTS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME는 각각 
--동물의 아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부를 나타냅니다. ANIMAL_OUTS 테이블의 ANIMAL_ID는 ANIMAL_INS의 ANIMAL_ID의 외래 키입니다.

--NAME				TYPE	NULLABLE
--ANIMAL_ID			VARCHAR(N)	FALSE
--ANIMAL_TYPE		VARCHAR(N)	FALSE
--DATETIME			DATETIME	FALSE
--NAME				VARCHAR(N)	TRUE
--SEX_UPON_OUTCOME	VARCHAR(N)	FALSE




--1. 천재지변으로 인해 일부 데이터가 유실되었습니다. 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.
--
--예시
--예를 들어, ANIMAL_INS 테이블과 ANIMAL_OUTS 테이블이 다음과 같다면
--
--ANIMAL_INS
--
--ANIMAL_ID	ANIMAL_TYPE	DATETIME	INTAKE_CONDITION	NAME	SEX_UPON_INTAKE
--A352713	Cat	2017-04-13 16:29:00	Normal	Gia	Spayed Female
--A350375	Cat	2017-03-06 15:01:00	Normal	Meo	Neutered Male
--ANIMAL_OUTS
--
--ANIMAL_ID	ANIMAL_TYPE	DATETIME	NAME	SEX_UPON_OUTCOME
--A349733	Dog	2017-09-27 19:09:00	Allie	Spayed Female
--A352713	Cat	2017-04-25 12:25:00	Gia	Spayed Female
--A349990	Cat	2018-02-02 14:18:00	Spice	Spayed Female
--ANIMAL_OUTS 테이블에서
--
--Allie의 ID는 ANIMAL_INS에 없으므로, Allie의 데이터는 유실되었습니다.
--Gia의 ID는 ANIMAL_INS에 있으므로, Gia의 데이터는 유실되지 않았습니다.
--Spice의 ID는 ANIMAL_INS에 없으므로, Spice의 데이터는 유실되었습니다.
--따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.
--
--ANIMAL_ID	NAME
--A349733	Allie
--A349990	Spice

-- used mysql
SELECT B.ANIMAL_ID,
       B.NAME
  FROM ANIMAL_OUTS B
  LEFT OUTER JOIN ANIMAL_INS A
    ON A.ANIMAL_ID = B.ANIMAL_ID
  WHERE A.ANIMAL_ID IS NULL
  
-- used oracle
-- 코드를 입력하세요
SELECT ANIMAL_ID, NAME
  FROM ANIMAL_OUTS
 MINUS
SELECT ANIMAL_ID, NAME
  FROM ANIMAL_INS
  
  
  
  
--2. 관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다. 
--보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
--이때 결과는 보호 시작일이 빠른 순으로 조회해야합니다.

-- 코드를 입력하세요
SELECT A.ANIMAL_ID,
       A.NAME
  FROM ANIMAL_INS A
INNER JOIN ANIMAL_OUTS B
  ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE B.DATETIME < A.DATETIME
ORDER BY A.DATETIME




--3. 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 보호 시작일 순으로 조회해야 합니다.
--※ 입양을 가지 못한 동물이 3마리 이상인 경우만 입력으로 주어집니다.

--used mysql
-- 코드를 입력하세요
SELECT A.NAME,
       A.DATETIME
  FROM ANIMAL_INS A
  LEFT OUTER JOIN ANIMAL_OUTS B
    ON A.ANIMAL_ID = B.ANIMAL_ID
  WHERE B.ANIMAL_ID IS NULL
 ORDER BY A.DATETIME
 LIMIT 3
 
--used oracle
 -- 코드를 입력하세요
SELECT *
  FROM (SELECT A.NAME,
               A.DATETIME
          FROM ANIMAL_INS A
          LEFT OUTER JOIN ANIMAL_OUTS B
            ON A.ANIMAL_ID = B.ANIMAL_ID
         WHERE B.ANIMAL_ID IS NULL
         ORDER BY A.DATETIME)
 WHERE ROWNUM <= 3
 
 
 

 
--4. 보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다. 
--보호소에 들어올 당시에는 중성화1되지 않았지만, 
--보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성해주세요.
SELECT A.ANIMAL_ID,
       A.ANIMAL_TYPE,
       A.NAME
  FROM ANIMAL_INS A
 INNER JOIN ANIMAL_OUTS B
    ON A.ANIMAL_ID = B.ANIMAL_ID
 WHERE A.SEX_UPON_INTAKE != B.SEX_UPON_OUTCOME
 ORDER BY A.ANIMAL_ID
