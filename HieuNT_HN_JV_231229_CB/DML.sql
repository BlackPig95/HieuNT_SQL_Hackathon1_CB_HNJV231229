set sql_safe_updates = 0;
use quanlydiemthi;
# Bài 2: Thêm , sửa , xoá dữ liệu [35 điểm]:
# 1. Thêm dữ liệu vào các bảng như sau [15 điểm (mỗi bảng 5 điểm)]:
# - Bảng STUDENT :
# Lưu ý : giả sử 1 ứng với giới tính nam và 0 ứng với giới tính nữ.
insert into student (studentId, studentName, birthday, gender, address, phoneNumber)
VALUES ('S001', 'Nguyễn Thế Anh', '1999-1-11', 1, 'Hà Nội', '984678082'),
       ('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
       ('S003', 'Trần Hà Phương', '2000-5-5', 0, 'Nghệ An', '947654363'),
       ('S004', 'Đỗ Tiến Mạnh', '1999-3-26', 1, 'Hà Nội', '983665353'),
       ('S005', 'Phạm Duy Nhất', '1998-10-4', 1, 'Tuyên Quang', '987242678'),
       ('S006', 'Mai Văn Thái', '2002-6-22', 1, 'Nam Định', '982654268'),
       ('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', '982364753'),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999-1-22', 0, 'Hà Nam', '927867453'),
       ('S009', 'Nguyễn Tiến Đạt', '1998-8-7', 1, 'Tuyên Quang', '989274673'),
       ('S010', 'Nguyễn Thiều Quang', '2000-9-18', 1, 'Hà Nội', '984378291');
# - Bảng SUBJECT :
insert into subject (subjectId, subjectName, priority)
VALUES ('MH01', 'Toán', 2),
       ('MH02', 'Vật Lý', 2),
       ('MH03', 'Hóa Học', 1),
       ('MH04', 'Ngữ Văn', 1),
       ('MH05', 'Tiếng Anh', 2);
# - Bảng MARK:
insert into mark (subjectId, studentId, point)
VALUES ('MH01', 'S001', 8.5),
       ('MH02', 'S001', 7),
       ('MH03', 'S001', 9),
       ('MH04', 'S001', 9),
       ('MH05', 'S001', 5),
       ('MH01', 'S002', 9),
       ('MH02', 'S002', 8),
       ('MH03', 'S002', 6.5),
       ('MH04', 'S002', 8),
       ('MH05', 'S002', 6),
       ('MH01', 'S003', 7.5),
       ('MH02', 'S003', 6.5),
       ('MH03', 'S003', 8),
       ('MH04', 'S003', 7),
       ('MH05', 'S003', 7),
       ('MH01', 'S004', 6),
       ('MH02', 'S004', 7),
       ('MH03', 'S004', 5),
       ('MH04', 'S004', 6.5),
       ('MH05', 'S004', 8),
       ('MH01', 'S005', 5.5),
       ('MH02', 'S005', 8),
       ('MH03', 'S005', 7.5),
       ('MH04', 'S005', 8.5),
       ('MH05', 'S005', 9),
       ('MH01', 'S006', 8),
       ('MH02', 'S006', 10),
       ('MH03', 'S006', 9),
       ('MH04', 'S006', 7.5),
       ('MH05', 'S006', 6.5),
       ('MH01', 'S007', 9.5),
       ('MH02', 'S007', 9),
       ('MH03', 'S007', 6),
       ('MH04', 'S007', 9),
       ('MH05', 'S007', 4),
       ('MH01', 'S008', 10),
       ('MH02', 'S008', 8.5),
       ('MH03', 'S008', 8.5),
       ('MH04', 'S008', 6),
       ('MH05', 'S008', 9.5),
       ('MH01', 'S009', 7.5),
       ('MH02', 'S009', 7),
       ('MH03', 'S009', 9),
       ('MH04', 'S009', 5),
       ('MH05', 'S009', 10),
       ('MH01', 'S010', 6.5),
       ('MH02', 'S010', 8),
       ('MH03', 'S010', 5.5),
       ('MH04', 'S010', 4),
       ('MH05', 'S010', 7);

# 2. Cập nhật dữ liệu [10 điểm]:
# - Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
update student
set studentName = 'Đỗ Đức Mạnh'
where studentId = 'S004';
# - Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
update subject
set subjectName = 'Ngoại ngữ',
    priority    = 1
where subjectId = 'MH05';
# - Cập nhật lại điểm của học sinh có mã `S009` thành
# (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).
update mark
set point = 8.5
where studentId = 'S009'
  and subjectId = 'MH01';
update mark
set point = 7
where studentId = 'S009'
  and subjectId = 'MH02';
update mark
set point = 5.5
where studentId = 'S009'
  and subjectId = 'MH03';
update mark
set point = 6
where studentId = 'S009'
  and subjectId = 'MH04';
update mark
set point = 9
where studentId = 'S009'
  and subjectId = 'MH05';
# update mark
# set point = case subjectId
#                 when 'MH02' then 7
#                 when 'MH03' then 5.5
#                 when 'MH04' then 6
#                 when 'MH05' then 9
#     end
# where studentId = 'S009';
# 3. Xoá dữ liệu[10 điểm]:
# - Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm
# điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT.
delete from mark where studentId = 'S010';
delete from student where studentId = 'S010';

set sql_safe_updates = 1;
