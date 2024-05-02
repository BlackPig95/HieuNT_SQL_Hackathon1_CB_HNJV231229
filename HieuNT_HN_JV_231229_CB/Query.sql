# Bài 3: Truy vấn dữ liệu [25 điểm]:
use quanlydiemthi;
# 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
select *
from student;
# 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
select subjectId `Mã môn học`, subjectName `Tên môn học`
from subject
where priority = 1;
# 3. Hiển thị thông tin học sinh bào gồm:
# mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ năm sinh) ,
# giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]
select studentId                                             Id,
       studentName                                           Ten,
       year(curdate()) - year(birthday)                   as Tuoi,
       case gender when 0 then 'Nữ' when 1 then 'Nam' end as `Giới tính`,
       address                                               `Quê quán`
from student;
# 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học ,
# điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần. [4 điểm]
select st.studentName TenHS, sub.subjectName TenMH, m.point DiemThi
from student st
         join mark m on st.studentId = m.studentId
         join subject sub on m.subjectId = sub.subjectId
where subjectName like 'Toan'
order by point desc;
# 5. Thống kê số lượng học sinh theo giới tính ở trong bảng
# (Gồm 2 cột: giới tính và số lượng). [4 điểm]
select if(gender, 'Nam', 'Nữ') `Giới tính`, count(gender)
from student
group by gender;
# 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh
# (yêu cầu sử dụng hàm để tính toán) , bảng gồm mã học sinh, tên hoc sinh,
# tổng điểm và điểm trung bình. [5 điểm]
select m.studentId   Id,
       s.studentName TenHS,
       sum(m.point)  TongDiem,
       avg(m.point)  TrungBinh
from student s
         join mark m on s.studentId = m.studentId
group by m.studentId;

