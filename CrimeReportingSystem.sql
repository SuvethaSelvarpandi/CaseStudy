-- 1. Table: victims
create table victims (
    victimid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    dateofbirth date,
    gender varchar(10),
    contactinfo varchar(100)
);


-- 2. Table: suspects
create table suspects (
    suspectid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    dateofbirth date,
    gender varchar(10),
    contactinfo varchar(100)
);


-- 3. Table: agencies
create table agencies (
    agencyid int primary key,
    agencyname varchar(100),
    jurisdiction varchar(100),
    contactinfo varchar(100)
);


-- 4. Table: officers
create table officers (
    officerid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    badgenumber varchar(20),
    rank_ varchar(30),
    contactinfo varchar(100),
    agencyid int,
    foreign key (agencyid) references agencies(agencyid)
);


-- 5. Table: incidents
create table incidents (
    incidentid int primary key,
    incidenttype varchar(50),
    incidentdate date,
    location varchar(100),
    description varchar(10000),
    status varchar(30),
    victimid int,
    suspectid int,
    officerid int,
    foreign key (victimid) references victims(victimid),
    foreign key (suspectid) references suspects(suspectid),
    foreign key (officerid) references officers(officerid)
);


-- 6. Table: evidence
create table evidence (
    evidenceid int primary key,
    description varchar(10000),
    locationfound varchar(100),
    incidentid int,
    foreign key (incidentid) references incidents(incidentid)
);


-- 7. Table: reports
create table reports (
    reportid int primary key,
    incidentid int,
    reportingofficer int,
    reportdate date,
    reportdetails varchar(1000),
    status varchar(20),
    foreign key (incidentid) references incidents(incidentid),
    foreign key (reportingofficer) references officers(officerid)
);
insert into victims values
(1, 'alice', 'smith', '1990-05-15', 'female', 'alice.smith@example.com'),
(2, 'bob', 'johnson', '1985-10-22', 'male', 'bob.johnson@example.com');

insert into suspects values
(1, 'charlie', 'brown', '1980-03-12', 'male', 'charlie.brown@example.com'),
(2, 'diana', 'evans', '1992-07-08', 'female', 'diana.evans@example.com');

insert into agencies values
(1, 'city police department', 'new york city', 'contact@citypolice.com'),
(2, 'state investigation bureau', 'new york state', 'contact@sib.gov');

insert into officers values
(1, 'emily', 'watson', 'BN12345', 'sergeant', 'emily.watson@cpd.com', 1),
(2, 'frank', 'moore', 'BN67890', 'detective', 'frank.moore@sib.gov', 2);

insert into incidents values
(1, 'theft', '2024-04-10', '5th avenue', 'stolen purse reported by victim.', 'open', 1, 1, 1),
(2, 'assault', '2024-04-12', 'central park', 'physical altercation with injuries.', 'under investigation', 2, 2, 2);

insert into evidence values
(1, 'black leather purse with id inside.', 'near 5th avenue', 1),
(2, 'broken mobile phone.', 'central park bench', 2);


insert into reports values
(1, 1, 1, '2024-04-11', 'initial theft report filed by officer watson.', 'filed'),
(2, 2, 2, '2024-04-13', 'assault report entered by officer moore.', 'filed');
