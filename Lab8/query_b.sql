--cau b
select Diachi, Tenchunha from nha_cho_thue  
where Giathue < 10000000

select k.maKH, k.Hoten, k.Coquan from khach_hang k 
inner join (
select h.maKH, h.maN, n.Tenchunha from hop_dong h
inner join nha_cho_thue n on n.maN = h.maN ) a
on a.maKH = k.maKH
where a.Tenchunha = N'Nông Văn Dền'

select maN, Tenchunha, Diachi from nha_cho_thue where maN not in
( select maN from hop_dong group by maN )

select MAX(Giathue) as gia_thue_max from(
select n.maN, n.Giathue from nha_cho_thue n
inner join hop_dong h on n.maN = h.maN
group by n.Giathue, n.maN) as a
