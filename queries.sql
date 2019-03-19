create table Professors
(
	Research varchar(255),
	PSSN varchar(255) constraint Professors_pk primary key,
	Name varchar(255),
	Age int
)

create table Department
(
	[Dept No] varchar(255) constraint dept_no_pk primary key,
	Name varchar(255),
	Office varchar(255),
	PSSN varchar(255),
	constraint PSSN_FK foreign key(PSSN) references Professors(PSSN)
)

create table Project
(
  Number varchar(255) constraint number_pk primary key,
  [Sponsor Name] varchar(255),
  [Starting Date] date,
  [Ending Date] date,
  Budget varchar(255),
  PSSN varchar(255),
  constraint PSSN_FK_project foreign key(PSSN) references Professors(PSSN),
)

create table [Graduate Students]
(
  GSSN varchar(255) constraint GSSN_pk primary key,
  Name varchar(255),
  Age int,
  Degree varchar(255),
  [Dept No] varchar(255),
  constraint Dept_No_FK foreign key([Dept No]) references Department([Dept No]),
)

create table ProfessorWorksOnProject
(
  PSSN varchar(255),
  Number varchar(255),
  constraint PSSN_Number_pk primary key (PSSN, Number),
  constraint PSSN_FK_Prof_WO foreign key (PSSN) references Professors(PSSN),
  constraint Number_FK_Prof_WO foreign key (Number) references Project(Number),
)

create table GSWorksOnProject
(
  GSSN varchar(255),
  Number varchar(255),
  constraint GSSN_FK_GS_WO foreign key (GSSN) references [Graduate Students](GSSN),
  constraint Number_FK_GS_WO foreign key (Number) references Project(Number),
  constraint GSSN_Number_pk primary key (GSSN, Number)
)

create table ProfessorWorksOnDept
(
  Time time,
  PSSN varchar(255),
  constraint ProkWorksOn_pk primary key (Time, PSSN),
  constraint PSSN_fk_prof_dept foreign key (PSSN) references Professors(PSSN),

)

create table ProfessorSupervises
(
  PSSN varchar(255),
  Number varchar(255),
  GSSN varchar(255),
  constraint ProfSupervises_pk primary key (PSSN, Number, GSSN),
  constraint PSSN_fk_prof foreign key (PSSN) references Professors(PSSN),
  constraint Number_fk_prof foreign key (Number) references Project(Number),
  constraint GSSN_fk_prof foreign key (GSSN) references [Graduate Students](GSSN),
)

create table GSSupervisor
(
  Adviser_SSN varchar(255),
  GS_SSN varchar(255),
  constraint Adviser_fk foreign key (Adviser_SSN) references [Graduate Students](GSSN),
  constraint GS_SSN_fk foreign key (GS_SSN) references [Graduate Students](GSSN),
)

