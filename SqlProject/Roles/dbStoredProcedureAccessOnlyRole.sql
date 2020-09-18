﻿CREATE ROLE [dbStoredProcedureAccessOnly]
GO
ALTER ROLE [dbStoredProcedureAccessOnly] ADD MEMBER [spAccessOnly]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
GRANT EXECUTE TO [spAccessOnly] AS [dbo]