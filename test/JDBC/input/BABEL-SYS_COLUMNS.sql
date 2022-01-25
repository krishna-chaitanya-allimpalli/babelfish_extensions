-- Tests for sys.columns catalog view
-- Test precision and scale for all numeric datatypes
create table t1(a int, b float, c bigint, d numeric, e smallint, f tinyint, g decimal, h money, i smallmoney);
go
select name, column_id, precision, scale from sys.columns where object_id=OBJECT_ID('t1') order by name;
go

-- Test identity and computed columns
create table t2(a int, b int IDENTITY(1,1), c as a * b);
go
select name, column_id, is_identity, is_computed from sys.columns where object_id=OBJECT_ID('t2') order by name;
go

-- Test ansi padded columns
create table t3(a char(10), b nchar(10), c binary(10));
go
select name, column_id, is_ansi_padded from sys.columns where object_id=OBJECT_ID('t3') order by name;
go

-- Cleanup
drop table t1;
drop table t2;
drop table t3;
go
