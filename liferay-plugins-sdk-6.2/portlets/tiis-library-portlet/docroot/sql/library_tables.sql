drop table if exists `TIISBook`;
create table  if not exists `TIISBook` (
	`bookId` BIGINT(20) not null unique PRIMARY KEY,
    `createDate` DATE not null,
    `modifiedDate` DATE null,
    `title` VARCHAR(250) not null,
	`description`  VARCHAR(750) not null,
	`googleDriveLink`  VARCHAR(350),
	`logoUrl`  BLOB
    );
    
drop table if exists `TIISTest`;
create table  if not exists `TIISTest` (
	`testId` BIGINT(20) not null unique PRIMARY KEY,
    `createDate` DATE not null,
    `modifiedDate` DATE null,
    `isBookTest` boolean not null,
	`bookId`  bigint(20) null,
	`content`  VARCHAR(1400) null
    );
    
drop table if exists `TIISTestAttempt`;
create table  if not exists `TIISTestAttempt` (
	`testId` BIGINT(20) not null,
    `userId` BIGINT(20) not null,
    `startTime` DATE not null,
    `finishTime` DATE not null,
	`result` double not null
    );