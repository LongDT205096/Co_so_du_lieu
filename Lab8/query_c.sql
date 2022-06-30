--create index co_quan on khach_hang(coquan)

select * from khach_hang 
where Coquan like '%m'

--create index ma_nha on nha_cho_thue(maN)
select a.maN, a.Tenchunha, b.SoNhaChoThue from nha_cho_thue as a 
inner join (select maN, count(maN) as SoNhaChoThue from hop_dong group by maN ) as b on a.maN = b.maN;

SET STATISTICS IO ON
go