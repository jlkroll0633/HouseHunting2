CREATE USER [spAccessOnlyUser]
	FOR LOGIN [spAccessOnly]
	WITH DEFAULT_SCHEMA = dbo

GO

GRANT EXECUTE TO [spAccessOnlyUser]
