use quanlydiemthi;
# Bài 4: Tạo View, Index, Procedure [20 điểm]:
# 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh,
# tên học sinh, giới tính , quê quán . [3 điểm]
create view Student_View
as
select studentId               MaHs,
       studentName             TenHS,
       if(gender, 'Nam', 'Nữ') GioiTinh,
       address                 QueQuan
from student;
select *
from Student_View;
# 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
# điểm trung bình các môn học . [3 điểm]
create view AVERAGE_MARK_VIEW
as
select m.studentId MaHS, s.studentName TenHS, avg(m.point) DiemTB
from mark m
         join student s on m.studentId = s.studentId
group by m.studentId;
select *
from AVERAGE_MARK_VIEW;
# 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
create index phoneIndex on student (phoneNumber);
# 4. Tạo các PROCEDURE sau:
# - Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
# thông tin học sinh đó. [3 điểm]
DELIMITER //
create procedure PROC_INSERTSTUDENT(id_in varchar(4), name_in varchar(100),
                                    birthday_in date, gender_in bit, address_in text, phone_in varchar(45))
begin
    insert into student (studentId, studentName, birthday, gender, address, phoneNumber)
    VALUES (id_in, name_in, birthday_in, gender_in, address_in, phone_in);
end//
DELIMITER ;
call PROC_INSERTSTUDENT('S011', 'Học sinh mới',
                        '1990-1-1', 1,
                        'HCM', '975421532');
# - Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học. [3 điểm]
DELIMITER //
create procedure PROC_UPDATESUBJECT(id_in varchar(4), name_new varchar(45))
begin
    update subject
    set subjectName = name_new
    where subjectId = id_in;
end //
DELIMITER ;
insert into subject (subjectId, subjectName, priority)
VALUES ('MH10', 'Test môn học', 2);
call PROC_UPDATESUBJECT('MH10', 'Môn học đã đổi tên');

# - Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
# sinh. [3 điểm]
DELIMITER //
create procedure PROC_DELETEMARK(id_student varchar(4))
begin
    delete from mark where studentId = id_student;
end //
DELIMITER ;
insert into mark (subjectId, studentId, point)
VALUES ('MH01', 'S011', 6),
       ('MH02', 'S011', 3),
       ('MH03', 'S011', 7),
       ('MH04', 'S011', 4),
       ('MH05', 'S011', 8);
call PROC_DELETEMARK('S011');