SELECT me.custno, me.custname, me.grade, sum(mo.price) price FROM tbl_member me, tbl_money mo WHERE me.custno = mo.custno GROUP BY me.custno, me.custname, me.grade ORDER BY sum(mo.price) desc

UPDATE tbl_member SET custname=?, phone=?, address=?, joindate=?, grade=?, city=? WHERE custno=?