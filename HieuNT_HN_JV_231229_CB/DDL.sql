set sql_safe_updates = 0;
# - Tạo CSDL tên QUANLYDIEMTHI . [5 điểm]
create database if not exists quanlydiemthi;
use quanlydiemthi;
# 1. Bảng STUDENT [5 điểm]
create table if not exists student(
    studentId varchar(4) primary key not null,
    studentName varchar(100) not null ,
    birthday date not null ,
    gender bit(1) not null ,
    address text not null ,
    phoneNumber varchar(45) unique
);
# 2. Bảng SUBJECT [5 điểm]
create table if not exists subject(
    subjectId varchar(4) primary key not null ,
    subjectName varchar(45) not null ,
    priority int(11) not null
);
# 3. Bảng MARK [5 điểm]
create table if not exists mark(
    subjectId varchar(4) not null ,
    studentId varchar(4) not null ,
    point double not null,
    constraint primary key (subjectId, studentId)
);
alter table mark
add foreign key (subjectId) references subject(subjectId),
add foreign key (studentId) references student(studentId);

set sql_safe_updates = 1;