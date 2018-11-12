create database TNTT
use TNTT
drop database TNTT
create table tblUsers
(
	sUserName varchar(30) primary key not null,
	sPassword varchar(30),
	fDiem float,
	sEmail varchar(30),
	iRole int default(3)
)

create table tblRole
(
	iRole int primary key,
	sTenrole varchar(30) 
)
create table tblMonhoc
(
	iMamon int primary key,
	sTenmon varchar(30)
)

create table tblDapan
(
	iMacautl int primary key identity(1,1),
	sCautl nvarchar(100),
	iMacauhoi int 
)
create table tblCauhoi
(
 iMacauhoi int primary key identity(1,1),
 sCauhoi nvarchar(100),
 iDapan int,
 bTt varchar(5),
 iMamon int
)


alter table tblDapan add constraint FK1 foreign key (iMacauhoi) references  tblCauhoi(iMacauhoi)
alter table tblCauhoi add constraint FK2 foreign key (iMamon) references tblMonhoc(iMamon)
alter table tblUsers add constraint FK3 foreign key (iRole) references tblRole(iRole)

insert into tblUsers(sUserName,sPassword,iRole) values ('admin','admin',1)
insert into tblUsers(sUserName,sPassword,iRole) values('123','123',2)

insert into tblRole values(1,'admin')
insert into tblRole values(2,'Teacher')
insert into tblRole values(3,'Customer')
insert into tblMonhoc values(1,'Math')
insert into tblMonhoc values(2,'Vietnamese')
insert into tblCauhoi values(N'Ai Đẹp trai nhất lớp 14A04?',1,'false',1)
insert into tblCauhoi values(N'Ai xinh gái nhất lớp 14A04?',5,'false',1)
insert into tblCauhoi values(N'Biển số xe của Hiền là bao nhiêu?',9,'false',1)
insert into tblCauhoi values(N'Biển số xe ny của hiền?',13,'false',1)
insert into tblCauhoi values(N'Người giang hồ gọi hiền là gì?',17,'false',2)
insert into tblCauhoi values(N'Long đang dùng điện thoại gì?',21,'false',2)
insert into tblCauhoi values(N'Hiền đang đi xe gì?',25,'false',2)
insert into tblCauhoi values(N'Long đang đi xe gì?',29,'false',2)
insert into tblCauhoi values(N'Bạn thân của hiền là ai?',33,'false',2)
insert into tblCauhoi values(N'Hiền hay mua nước cho ai?',37,'false',2)
insert into tblCauhoi values(N'a',41,'false',2)

select * from tblDapan
insert into tblDapan values(N'Hiền',1)
insert into tblDapan values(N'Đạt',1)
insert into tblDapan values(N'Long',1)
insert into tblDapan values(N'Tùng',1)
insert into tblDapan values(N'Long queo',2)
insert into tblDapan values(N'Ngọc Thảo',2)
insert into tblDapan values(N'Không ai cả',2)
insert into tblDapan values(N'Không biết',2)
insert into tblDapan values(N'95052',3)
insert into tblDapan values(N'0400',3)
insert into tblDapan values(N'1234',3)
insert into tblDapan values(N'Ai để ý',3)
insert into tblDapan values(N'0400',4)
insert into tblDapan values(N'cũng không để ý',4)
insert into tblDapan values(N'98765',4)
insert into tblDapan values(N'95052',4)
insert into tblDapan values(N'Hiền cụt tay',5)
insert into tblDapan values(N'Hiền quỵt',5)
insert into tblDapan values(N'HDZ',5)
insert into tblDapan values(N'bàn tay sấm sét',5)
insert into tblDapan values(N'không care',6)
insert into tblDapan values(N'note 8',6)
insert into tblDapan values(N'ip X',6)
insert into tblDapan values(N'1200',6)
insert into tblDapan values(N'xe đạp',7)
insert into tblDapan values(N'ô tô',7)
insert into tblDapan values(N'xe máy',7)
insert into tblDapan values(N'đi bộ',7)
insert into tblDapan values(N'sh',8)
insert into tblDapan values(N'wave',8)
insert into tblDapan values(N'liberty',8)
insert into tblDapan values(N'lambogini',8)
insert into tblDapan values(N'NT95052',9)
insert into tblDapan values(N'ngọc anh',9)
insert into tblDapan values(N'1 bạn nữ giấu tên',9)
insert into tblDapan values(N'không biết',9)
insert into tblDapan values(N'ngoc thao',10)
insert into tblDapan values(N'long',10)
insert into tblDapan values(N'đạt',10)
insert into tblDapan values(N'tuấn anh',10)

select top 1 * from tblCauhoi  where bTt='false' order by newid()
select * from tblDapan where iMacauhoi=1
select iMacautl,sCautl from tblCauhoi,tblDapan
where tblCauhoi.iMacauhoi=tblDapan.iMacauhoi and tblCauhoi.iMacauhoi='1'
select top 10 * from tblCauhoi order by newid()
select iMacautl,sCautl from tblDapan where iMacauhoi=2
select top 10 * from tblCauhoi order by newid()
update tblCauhoi
set bTt='false'
select *from tblCauhoi
--------
create proc dangky
@sUserName varchar(30) ,
@sPassword varchar(30),
@sEmail varchar(30)
as 
begin 
insert into tblUsers(sUserName,sPassword,sEmail) values(@sUserName,@sPassword,@sEmail)
end
select * from tblUsers

create proc kiemtra
@sUserName varchar(30) ,
@sPassword varchar(30)
as 
begin 
select * from tblUsers where sUserName=@sUserName and sPassword=@sPassword and iRole=3
end

create proc dangnhap
@sUserName varchar(30) ,
@sPassword varchar(30)
as 
begin 
select * from tblUsers where sUserName=@sUserName and sPassWord=@sPassword 
end
exec dangnhap 'admin','admin'
create proc dangnhapadmin
@sUserName varchar(30) ,
@sPassword varchar(30)
as 
begin 
select * from tblUsers where sUserName=@sUserName and sPassWord=@sPassword and (iRole=1 or iRole=2)
end
select * from tblUsers
create proc kiemtramonhoc
@sTenmon varchar(30)
as 
begin 
select * from tblMonhoc where sTenmon=@sTenmon 
end
exec kiemtramonhoc ''

SELECT TOP 1 tblMonhoc.iMamon  FROM tblMonhoc ORDER BY iMamon DESC

create proc themmonhoc
@iMamon int,
@sTenmon varchar(30)
as 
begin 
insert into tblMonhoc values(@iMamon,@sTenmon)
end
select * from tblCauhoi
---------------timkiem--------------------
create proc timkiemtheoma
@timkiem int
as
begin 
 select * from tblCauhoi where iMacauhoi=@timkiem 
end
create proc timkiemtheoten
@timkiem varchar(10)
as
begin 
select * from tblCauhoi where sCauhoi=@timkiem 
end



--------tìm kiếm câu hỏi có từ khóa cần tìm
select * from tblCauhoi where sCauhoi like '%t%'


------bao mật đăng nhaaoj-----------
create proc kiemtradangnhap
@sUsername varchar(30)
as 
begin
select * from tblUsers where sUserName=@sUsername
end
exec kiemtradangnhap 'admin'
--------------
create proc hienthi
as
begin
select * from tblCauhoi
end