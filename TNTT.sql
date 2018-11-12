create database TNTT
use TNTT
drop database TNTT
create table tblUsers
(
	sUserName varchar(30) primary key not null,
	sPassword varchar(30),
	fDiem float
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
 iDapan int
)
alter table tblDapan add constraint FK1 foreign key (iMacauhoi) references  tblCauhoi(iMacauhoi)
insert into tblCauhoi values(N'Ai Đẹp trai nhất lớp 14A04?',1)
insert into tblCauhoi values(N'Ai xinh gái nhất lớp 14A04?',6)
insert into tblCauhoi values(N'Biển số xe của Hiền là bao nhiêu?','95052','0400','1234','Ai để ý')
insert into tblCauhoi values(N'BIển số xe ny của hiền?','0400',N'Cũng k để ý','98765','95052')
insert into tblCauhoi values(N'Người giang hồ gọi hiền là gì?',N'Hiền cụt tay',N'Hiền quỵt','hdz',N'Bàn tay sấm sét')
insert into tblCauhoi values(N'Long đang dùng điện thoại gì?',N'Không care','Nokia 6030','SS Note 4','Iphone X')
insert into tblCauhoi values(N'Hiền đang đi xe gì?',N'Xe đạp',N'Ô tô',N'Xe ôm',N'wave')
insert into tblCauhoi values(N'Long đang đi xe gì?',N'Xe đạp',N'Ô tô',N'Xe ôm','SH')
insert into tblCauhoi values(N'Bạn thân của hiền là ai?',N'Ngọc Anh',N'1 bạn nữ giấu tên',N'Không biết',N'NT95052')
insert into tblCauhoi values(N'Hiền hay mua nước cho ai?',N'Tuấn Anh',N'Long',N'Đạt',N'Ngọc thảo')

insert into tblDapan values(N'Hiền',1)
insert into tblDapan values(N'Đạt',1)
insert into tblDapan values(N'Long',1)
insert into tblDapan values(N'Tùng',1)
insert into tblDapan values(N'Long queo',2)
insert into tblDapan values(N'Ngọc Thảo',2)
insert into tblDapan values(N'Không ai cả',2)
insert into tblDapan values(N'Không biết',2)

select iMacautl,sCautl from tblCauhoi,tblDapan
where tblCauhoi.iMacauhoi=tblDapan.iMacauhoi and tblCauhoi.iMacauhoi='1'
select top 10 * from tblCauhoi order by newid()
select sDapan1 from tblCauhoi where iMacauhoi=1
select top 10 * from tblCauhoi order by newid()