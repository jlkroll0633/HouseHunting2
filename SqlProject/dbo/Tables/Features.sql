CREATE TABLE [dbo].[Features] (
    [FeatureID]   INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (50)  NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [Weight]      INT            NULL,
    CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED ([FeatureID] ASC)
);

