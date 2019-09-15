
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/11/2019 10:01:49
-- Generated from EDMX file: C:\Users\Shirley\source\repos\MonashBnB\MonashBnB\Models\MonashBnBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MonashBnBDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_HotelRoom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rooms] DROP CONSTRAINT [FK_HotelRoom];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Hotels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Hotels];
GO
IF OBJECT_ID(N'[dbo].[Rooms]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rooms];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Hotels'
CREATE TABLE [dbo].[Hotels] (
    [hotelId] int IDENTITY(1,1) NOT NULL,
    [hotelName] nvarchar(max)  NOT NULL,
    [hotelAddress] nvarchar(max)  NOT NULL,
    [hotelDesc] nvarchar(max)  NOT NULL,
    [hotelAmenties] nvarchar(max)  NOT NULL,
    [hotelPhoto] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Rooms'
CREATE TABLE [dbo].[Rooms] (
    [roomId] int IDENTITY(1,1) NOT NULL,
    [roomType] nvarchar(max)  NOT NULL,
    [roomNoOfBed] nvarchar(max)  NOT NULL,
    [roomPricePerNight] nvarchar(max)  NOT NULL,
    [roomMaxGuests] nvarchar(max)  NOT NULL,
    [HotelId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [hotelId] in table 'Hotels'
ALTER TABLE [dbo].[Hotels]
ADD CONSTRAINT [PK_Hotels]
    PRIMARY KEY CLUSTERED ([hotelId] ASC);
GO

-- Creating primary key on [roomId] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [PK_Rooms]
    PRIMARY KEY CLUSTERED ([roomId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [HotelId] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [FK_HotelRoom]
    FOREIGN KEY ([HotelId])
    REFERENCES [dbo].[Hotels]
        ([hotelId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HotelRoom'
CREATE INDEX [IX_FK_HotelRoom]
ON [dbo].[Rooms]
    ([HotelId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------