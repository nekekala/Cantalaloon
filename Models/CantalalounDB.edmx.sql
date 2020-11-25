
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/19/2020 12:56:19
-- Generated from EDMX file: C:\Users\Akiss\source\repos\Cantalaloun\Models\CantalalounDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Members]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members];
GO
IF OBJECT_ID(N'[dbo].[Songs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Songs];
GO
IF OBJECT_ID(N'[dbo].[Groups]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Groups];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [memberID] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [lastname] nvarchar(max)  NOT NULL,
    [telephone] int  NULL,
    [mail] nvarchar(max)  NOT NULL,
    [ektasi] nvarchar(max)  NULL,
    [songID] int  NULL,
    [groupID] int  NULL
);
GO

-- Creating table 'Songs'
CREATE TABLE [dbo].[Songs] (
    [songID] int IDENTITY(1,1) NOT NULL,
    [title] nvarchar(max)  NOT NULL,
    [composer] nvarchar(max)  NULL,
    [memberID] int  NULL
);
GO

-- Creating table 'Groups'
CREATE TABLE [dbo].[Groups] (
    [groupID] int IDENTITY(1,1) NOT NULL,
    [groupName] varchar(30)  NOT NULL,
    [memberID] int  NULL,
    [songID] int  NULL
);
GO

-- Creating table 'Rehearsals'
CREATE TABLE [dbo].[Rehearsals] (
    [rehearsalId] int IDENTITY(1,1) NOT NULL,
    [date] nvarchar(max)  NOT NULL,
    [songID] nvarchar(max)  NOT NULL,
    [memberID] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [memberID] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([memberID] ASC);
GO

-- Creating primary key on [songID] in table 'Songs'
ALTER TABLE [dbo].[Songs]
ADD CONSTRAINT [PK_Songs]
    PRIMARY KEY CLUSTERED ([songID] ASC);
GO

-- Creating primary key on [groupID] in table 'Groups'
ALTER TABLE [dbo].[Groups]
ADD CONSTRAINT [PK_Groups]
    PRIMARY KEY CLUSTERED ([groupID] ASC);
GO

-- Creating primary key on [rehearsalId] in table 'Rehearsals'
ALTER TABLE [dbo].[Rehearsals]
ADD CONSTRAINT [PK_Rehearsals]
    PRIMARY KEY CLUSTERED ([rehearsalId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------
ALTER TABLE [dbo].[Members]
ADD FOREIGN KEY (groupID) REFERENCES Groups(groupID),
    FOREIGN KEY (songID) REFERENCES Songs(songID)
GO

ALTER TABLE [dbo].[Rehearsals]
ADD FOREIGN KEY (memberID) REFERENCES Members(memberID),
    FOREIGN KEY (songID) REFERENCES Songs(songID)
GO

ALTER TABLE [dbo].[Songs]
ADD FOREIGN KEY (memberID) REFERENCES Members(memberID)
GO
ALTER TABLE [dbo].[Groups]
ADD FOREIGN KEY (memberID) REFERENCES Members(memberID),
    FOREIGN KEY (songID) REFERENCES Songs(songID)
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------