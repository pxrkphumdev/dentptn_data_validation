# 8.1 การตรวจช่องปากเด็ก 0-2 ปีโดยทันตบุคลากร (คน)(dental)

SET @ds1 = '2023-10-01';
SET @ds2 = '2024-09-30';

SELECT
	'8.1 0-2 DENTAL',
	COUNT(*) AS SUM,
	COUNT(IF(MONTH(o.vstdate) IN (10), 1, NULL)) AS t10,
	COUNT(IF(MONTH(o.vstdate) IN (11), 1, NULL)) AS t11,
	COUNT(IF(MONTH(o.vstdate) IN (12), 1, NULL)) AS t12,
	COUNT(IF(MONTH(o.vstdate) IN (1), 1, NULL)) AS t1,
	COUNT(IF(MONTH(o.vstdate) IN (2), 1, NULL)) AS t2,
	COUNT(IF(MONTH(o.vstdate) IN (3), 1, NULL)) AS t3,
	COUNT(IF(MONTH(o.vstdate) IN (4), 1, NULL)) AS t4,
	COUNT(IF(MONTH(o.vstdate) IN (5), 1, NULL)) AS t5,
	COUNT(IF(MONTH(o.vstdate) IN (6), 1, NULL)) AS t6,
	COUNT(IF(MONTH(o.vstdate) IN (7), 1, NULL)) AS t7,
	COUNT(IF(MONTH(o.vstdate) IN (8), 1, NULL)) AS t8,
	COUNT(IF(MONTH(o.vstdate) IN (9), 1, NULL)) AS t9
FROM dental_care AS dc
LEFT JOIN ovst AS o ON o.vn = dc.vn
LEFT JOIN doctor AS doc ON dc.doctor = doc.code
LEFT JOIN patient AS pt ON pt.hn = o.hn
WHERE o.vstdate BETWEEN @ds1 AND @ds2
AND dc.dcaries + dc.dfilling + dc.dextract <= 20
AND dc.dteeth BETWEEN 1 AND 20
AND dc.dcaries + dc.dfilling <= dc.dteeth
AND TIMESTAMPDIFF(YEAR, pt.birthday, o.vstdate) BETWEEN 0 AND 2
AND doc.provider_type_code IN ('02', '06')

UNION


# 8.5 เคลือบ/ทา ฟลูออไรด์ในเด็ก 0-2 ปี(ครั้ง)


SELECT
	'8.5 0-2 FLUORIDE',
	COUNT(*) AS SUM,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (10), o.vn, NULL)) AS t10,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (11), o.vn, NULL)) AS t11,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (12), o.vn, NULL)) AS t12,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (1), o.vn, NULL)) AS t1,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (2), o.vn, NULL)) AS t2,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (3), o.vn, NULL)) AS t3,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (4), o.vn, NULL)) AS t4,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (5), o.vn, NULL)) AS t5,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (6), o.vn, NULL)) AS t6,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (7), o.vn, NULL)) AS t7,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (8), o.vn, NULL)) AS t8,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (9), o.vn, NULL)) AS t9
FROM dtmain AS d
LEFT JOIN dttm AS dt ON dt.code = d.tmcode
LEFT JOIN ovst AS o ON o.vn = d.vn
LEFT JOIN doctor AS doc ON d.doctor = doc.code
LEFT JOIN patient AS pt ON pt.hn = o.hn
WHERE o.vstdate BETWEEN @ds1 AND @ds2
AND dt.icd10tm_operation_code IN ('2377020', '2377021')
#AND dc.dcaries + dc.dfilling + dc.dextract <= 20
#AND dc.dteeth BETWEEN 1 AND 20
#AND dc.dcaries + dc.dfilling <= dc.dteeth
AND TIMESTAMPDIFF(YEAR, pt.birthday, o.vstdate) BETWEEN 0 AND 2
#AND doc.provider_type_code IN ('02', '06')


UNION


# 8.1 การตรวจช่องปากเด็ก 0-2 ปีโดยทันตบุคลากร (คน)(dental)
SELECT

	'9.1 3-5 DENTAL',
	COUNT(*) AS SUM,
	COUNT(IF(MONTH(o.vstdate) IN (10), 1, NULL)) AS t10,
	COUNT(IF(MONTH(o.vstdate) IN (11), 1, NULL)) AS t11,
	COUNT(IF(MONTH(o.vstdate) IN (12), 1, NULL)) AS t12,
	COUNT(IF(MONTH(o.vstdate) IN (1), 1, NULL)) AS t1,
	COUNT(IF(MONTH(o.vstdate) IN (2), 1, NULL)) AS t2,
	COUNT(IF(MONTH(o.vstdate) IN (3), 1, NULL)) AS t3,
	COUNT(IF(MONTH(o.vstdate) IN (4), 1, NULL)) AS t4,
	COUNT(IF(MONTH(o.vstdate) IN (5), 1, NULL)) AS t5,
	COUNT(IF(MONTH(o.vstdate) IN (6), 1, NULL)) AS t6,
	COUNT(IF(MONTH(o.vstdate) IN (7), 1, NULL)) AS t7,
	COUNT(IF(MONTH(o.vstdate) IN (8), 1, NULL)) AS t8,
	COUNT(IF(MONTH(o.vstdate) IN (9), 1, NULL)) AS t9
FROM dental_care AS dc
LEFT JOIN ovst AS o ON o.vn = dc.vn
LEFT JOIN doctor AS doc ON dc.doctor = doc.code
LEFT JOIN patient AS pt ON pt.hn = o.hn
WHERE o.vstdate BETWEEN @ds1 AND @ds2
AND dc.dcaries + dc.dfilling + dc.dextract <= 20
AND dc.dteeth BETWEEN 1 AND 20
AND dc.dcaries + dc.dfilling <= dc.dteeth
AND TIMESTAMPDIFF(YEAR, pt.birthday, o.vstdate) BETWEEN 3 AND 5
AND doc.provider_type_code IN ('02', '06')


UNION


# 9.3 เคลือบ/ทา ฟลูออไรด์ในเด็ก 3-5 ปี(ครั้ง)


SELECT
	'9.3 3-5 FLUORIDE',
	COUNT(*) AS SUM,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (10), o.vn, NULL)) AS t10,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (11), o.vn, NULL)) AS t11,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (12), o.vn, NULL)) AS t12,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (1), o.vn, NULL)) AS t1,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (2), o.vn, NULL)) AS t2,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (3), o.vn, NULL)) AS t3,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (4), o.vn, NULL)) AS t4,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (5), o.vn, NULL)) AS t5,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (6), o.vn, NULL)) AS t6,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (7), o.vn, NULL)) AS t7,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (8), o.vn, NULL)) AS t8,
	COUNT(DISTINCT IF(MONTH(o.vstdate) IN (9), o.vn, NULL)) AS t9
FROM dtmain AS d
LEFT JOIN dttm AS dt ON dt.code = d.tmcode
LEFT JOIN ovst AS o ON o.vn = d.vn
LEFT JOIN doctor AS doc ON d.doctor = doc.code
LEFT JOIN patient AS pt ON pt.hn = o.hn
WHERE o.vstdate BETWEEN @ds1 AND @ds2
AND dt.icd10tm_operation_code IN ('2377020', '2377021')
#AND dc.dcaries + dc.dfilling + dc.dextract <= 20
#AND dc.dteeth BETWEEN 1 AND 20
#AND dc.dcaries + dc.dfilling <= dc.dteeth
AND TIMESTAMPDIFF(YEAR, pt.birthday, o.vstdate) BETWEEN 3 AND 5
#AND doc.provider_type_code IN ('02', '06')
