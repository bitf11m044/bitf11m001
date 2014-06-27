
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/12/2014 21:11:28
-- Generated from EDMX file: C:\Users\hammad rasheed\documents\visual studio 2012\Projects\Proj\Proj\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MyDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BookCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Books] DROP CONSTRAINT [FK_BookCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_BookAuthor_Authors]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookAuthor] DROP CONSTRAINT [FK_BookAuthor_Authors];
GO
IF OBJECT_ID(N'[dbo].[FK_BookAuthor_Books]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookAuthor] DROP CONSTRAINT [FK_BookAuthor_Books];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Authors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Authors];
GO
IF OBJECT_ID(N'[dbo].[Books]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Books];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[BookAuthor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookAuthor];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Authors'
CREATE TABLE [dbo].[Authors] (
    [Aid] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Books'
CREATE TABLE [dbo].[Books] (
    [Bid] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Edition] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Publisher] nvarchar(max)  NOT NULL,
    [ISBN] nvarchar(max)  NOT NULL,
    [Image] nvarchar(max)  NOT NULL,
    [Category_Cid] int  NOT NULL,
    [Price] int  NOT NULL,
    [Aid] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Cid] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BookAuthor'
CREATE TABLE [dbo].[BookAuthor] (
    [Authors_Aid] int  NOT NULL,
    [Books_Bid] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Aid] in table 'Authors'
ALTER TABLE [dbo].[Authors]
ADD CONSTRAINT [PK_Authors]
    PRIMARY KEY CLUSTERED ([Aid] ASC);
GO

-- Creating primary key on [Bid] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [PK_Books]
    PRIMARY KEY CLUSTERED ([Bid] ASC);
GO

-- Creating primary key on [Cid] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Cid] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Authors_Aid], [Books_Bid] in table 'BookAuthor'
ALTER TABLE [dbo].[BookAuthor]
ADD CONSTRAINT [PK_BookAuthor]
    PRIMARY KEY NONCLUSTERED ([Authors_Aid], [Books_Bid] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Category_Cid] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [FK_BookCategory]
    FOREIGN KEY ([Category_Cid])
    REFERENCES [dbo].[Categories]
        ([Cid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BookCategory'
CREATE INDEX [IX_FK_BookCategory]
ON [dbo].[Books]
    ([Category_Cid]);
GO

-- Creating foreign key on [Authors_Aid] in table 'BookAuthor'
ALTER TABLE [dbo].[BookAuthor]
ADD CONSTRAINT [FK_BookAuthor_Authors]
    FOREIGN KEY ([Authors_Aid])
    REFERENCES [dbo].[Authors]
        ([Aid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Books_Bid] in table 'BookAuthor'
ALTER TABLE [dbo].[BookAuthor]
ADD CONSTRAINT [FK_BookAuthor_Books]
    FOREIGN KEY ([Books_Bid])
    REFERENCES [dbo].[Books]
        ([Bid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BookAuthor_Books'
CREATE INDEX [IX_FK_BookAuthor_Books]
ON [dbo].[BookAuthor]
    ([Books_Bid]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------