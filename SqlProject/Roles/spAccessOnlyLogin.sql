﻿CREATE LOGIN [spAccessOnly] WITH PASSWORD = 'USPSAstar1',
  CHECK_POLICY = OFF,
  CHECK_EXPIRATION=OFF,
  DEFAULT_LANGUAGE=[us_english],
  DEFAULT_DATABASE=[master];

GO
ALTER LOGIN [spAccessOnly] DISABLE
