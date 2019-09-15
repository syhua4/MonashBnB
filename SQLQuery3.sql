
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/12/2019 16:23:52
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
    [hotelAmenties] nvarchar(max)  NULL,
    [hotelImage] nvarchar(max)  NULL,
    [hotelLongitude] decimal(18,0)  NULL,
    [hotelLatitude] decimal(18,0)  NULL,
    [FavList_favListId] int  NOT NULL
);
GO

-- Creating table 'Rooms'
CREATE TABLE [dbo].[Rooms] (
    [roomId] int IDENTITY(1,1) NOT NULL,
    [roomTypeId] int  NOT NULL,
    [roomPricePerNight] float  NOT NULL,
    [roomAvailability] smallint  NOT NULL,
    [HotelId] int  NOT NULL,
    [RoomType_roomTypeId] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [userId] int IDENTITY(1,1) NOT NULL,
    [userEmail] nvarchar(max)  NOT NULL,
    [userType] tinyint  NOT NULL,
    [userPassword] nvarchar(max)  NOT NULL,
    [userFirstName] nvarchar(max)  NOT NULL,
    [userLastName] nvarchar(max)  NOT NULL,
    [favListId] nvarchar(max)  NULL
);
GO

-- Creating table 'Ratings'
CREATE TABLE [dbo].[Ratings] (
    [ratingId] int IDENTITY(1,1) NOT NULL,
    [ratingComment] nvarchar(max)  NOT NULL,
    [ratingStar] smallint  NOT NULL,
    [userId] int  NOT NULL,
    [hotelId] int  NOT NULL
);
GO

-- Creating table 'Reservations1'
CREATE TABLE [dbo].[Reservations1] (
    [resevNo] int IDENTITY(1,1) NOT NULL,
    [resevCheckIn] datetime  NOT NULL,
    [resevCheckOut] datetime  NOT NULL,
    [resevPrice] float  NOT NULL,
    [userId] int  NOT NULL,
    [hotelId] int  NOT NULL,
    [Hotel_hotelId] int  NOT NULL
);
GO

-- Creating table 'HotelImages'
CREATE TABLE [dbo].[HotelImages] (
    [imageId] int IDENTITY(1,1) NOT NULL,
    [image] nvarchar(max)  NOT NULL,
    [hotelId] int  NOT NULL
);
GO

-- Creating table 'RoomTypes'
CREATE TABLE [dbo].[RoomTypes] (
    [roomTypeId] int IDENTITY(1,1) NOT NULL,
    [roomTypeBedCount] smallint  NOT NULL,
    [roomTypeBedroomCount] smallint  NOT NULL,
    [roomTypeBathCount] smallint  NOT NULL,
    [roomTypeAccomodateCount] smallint  NOT NULL,
    [roomTypeName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'FavLists'
CREATE TABLE [dbo].[FavLists] (
    [favListId] int IDENTITY(1,1) NOT NULL,
    [userId] nvarchar(max)  NOT NULL,
    [hotelId] nvarchar(max)  NOT NULL,
    [User_userId] int  NOT NULL
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

-- Creating primary key on [userId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([userId] ASC);
GO

-- Creating primary key on [ratingId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [PK_Ratings]
    PRIMARY KEY CLUSTERED ([ratingId] ASC);
GO

-- Creating primary key on [resevNo] in table 'Reservations1'
ALTER TABLE [dbo].[Reservations1]
ADD CONSTRAINT [PK_Reservations1]
    PRIMARY KEY CLUSTERED ([resevNo] ASC);
GO

-- Creating primary key on [imageId] in table 'HotelImages'
ALTER TABLE [dbo].[HotelImages]
ADD CONSTRAINT [PK_HotelImages]
    PRIMARY KEY CLUSTERED ([imageId] ASC);
GO

-- Creating primary key on [roomTypeId] in table 'RoomTypes'
ALTER TABLE [dbo].[RoomTypes]
ADD CONSTRAINT [PK_RoomTypes]
    PRIMARY KEY CLUSTERED ([roomTypeId] ASC);
GO

-- Creating primary key on [favListId] in table 'FavLists'
ALTER TABLE [dbo].[FavLists]
ADD CONSTRAINT [PK_FavLists]
    PRIMARY KEY CLUSTERED ([favListId] ASC);
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

-- Creating foreign key on [userId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_UserRating]
    FOREIGN KEY ([userId])
    REFERENCES [dbo].[Users]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRating'
CREATE INDEX [IX_FK_UserRating]
ON [dbo].[Ratings]
    ([userId]);
GO

-- Creating foreign key on [userId] in table 'Reservations1'
ALTER TABLE [dbo].[Reservations1]
ADD CONSTRAINT [FK_UserReservations]
    FOREIGN KEY ([userId])
    REFERENCES [dbo].[Users]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserReservations'
CREATE INDEX [IX_FK_UserReservations]
ON [dbo].[Reservations1]
    ([userId]);
GO

-- Creating foreign key on [Hotel_hotelId] in table 'Reservations1'
ALTER TABLE [dbo].[Reservations1]
ADD CONSTRAINT [FK_HotelReservations]
    FOREIGN KEY ([Hotel_hotelId])
    REFERENCES [dbo].[Hotels]
        ([hotelId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HotelReservations'
CREATE INDEX [IX_FK_HotelReservations]
ON [dbo].[Reservations1]
    ([Hotel_hotelId]);
GO

-- Creating foreign key on [hotelId] in table 'HotelImages'
ALTER TABLE [dbo].[HotelImages]
ADD CONSTRAINT [FK_HotelHotelImage]
    FOREIGN KEY ([hotelId])
    REFERENCES [dbo].[Hotels]
        ([hotelId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HotelHotelImage'
CREATE INDEX [IX_FK_HotelHotelImage]
ON [dbo].[HotelImages]
    ([hotelId]);
GO

-- Creating foreign key on [RoomType_roomTypeId] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [FK_RoomRoomType]
    FOREIGN KEY ([RoomType_roomTypeId])
    REFERENCES [dbo].[RoomTypes]
        ([roomTypeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoomRoomType'
CREATE INDEX [IX_FK_RoomRoomType]
ON [dbo].[Rooms]
    ([RoomType_roomTypeId]);
GO

-- Creating foreign key on [hotelId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_HotelRating]
    FOREIGN KEY ([hotelId])
    REFERENCES [dbo].[Hotels]
        ([hotelId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HotelRating'
CREATE INDEX [IX_FK_HotelRating]
ON [dbo].[Ratings]
    ([hotelId]);
GO

-- Creating foreign key on [User_userId] in table 'FavLists'
ALTER TABLE [dbo].[FavLists]
ADD CONSTRAINT [FK_UserFavList]
    FOREIGN KEY ([User_userId])
    REFERENCES [dbo].[Users]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserFavList'
CREATE INDEX [IX_FK_UserFavList]
ON [dbo].[FavLists]
    ([User_userId]);
GO

-- Creating foreign key on [FavList_favListId] in table 'Hotels'
ALTER TABLE [dbo].[Hotels]
ADD CONSTRAINT [FK_FavListHotel]
    FOREIGN KEY ([FavList_favListId])
    REFERENCES [dbo].[FavLists]
        ([favListId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FavListHotel'
CREATE INDEX [IX_FK_FavListHotel]
ON [dbo].[Hotels]
    ([FavList_favListId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------