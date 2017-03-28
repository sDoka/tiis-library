create table TIISBook (
	uuid_ VARCHAR(75) null,
	bookId LONG not null primary key,
	companyId LONG,
	groupId LONG,
	userId LONG,
	userName VARCHAR(75) null,
	createDate DATE null,
	modifiedDate DATE null,
	gDriveId VARCHAR(75) null,
	title VARCHAR(75) null,
	description VARCHAR(750) null,
	googleDriveLink VARCHAR(750) null,
	bookLogo BLOB,
	bookLogoDlId LONG
);

create table TIISPromoCode (
	promoCodeId LONG not null primary key,
	promoType INTEGER,
	promoCodeContent VARCHAR(75) null,
	createTime DATE null,
	isUsed BOOLEAN,
	userId LONG,
	usedTime DATE null
);

create table TIISTest (
	testId LONG not null primary key,
	createDate DATE null,
	modifiedDate DATE null,
	isBookTest BOOLEAN,
	bookId LONG,
	content VARCHAR(950) null
);

create table TIISTestAttempt (
	testId LONG not null primary key,
	userId LONG,
	startTime DATE null,
	finishTime DATE null,
	result DOUBLE
);