SELECT COUNT(*) FROM sys.all_columns WHERE object_id = object_id('sys.indexes');
GO

DROP TABLE IF EXISTS t_sys_index_test1
GO

CREATE TABLE t_sys_index_test1 (
	c1 INT, 
	c2 VARCHAR(128)
);
GO

INSERT INTO t_sys_index_test1 (c1, c2) VALUES
(100, 'abc'),
(200, 'bcd'),
(300, 'cde'),
(1400, 'def')
GO

CREATE INDEX i_sys_index_test1 ON t_sys_index_test1  (c1);
CREATE INDEX i_sys_index_test1a ON t_sys_index_test1 (c2);
GO

SELECT COUNT(*) FROM sys.indexes WHERE object_id = OBJECT_ID('t_sys_index_test1')
GO

SELECT COUNT(*) FROM sys.indexes WHERE name LIKE 'i_sys_index_test1%';
GO

SELECT type, type_desc  FROM sys.indexes WHERE name LIKE 'i_sys_index_test1%';
GO

DROP INDEX i_sys_index_test1 ON t_sys_index_test1;
DROP INDEX i_sys_index_test1a ON t_sys_index_test1;
GO

SELECT COUNT(*) FROM sys.indexes WHERE name LIKE 'i_sys_index_test%';
GO

DROP TABLE IF EXISTS t_sys_index_test1
GO
