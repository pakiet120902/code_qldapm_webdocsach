<!DOCTYPE html>
<html>
	<head>
		<title>Trang Đọc Sách Online</title>
		<meta charset="utf-8" />
	</head>
	<body>
		<table border="0" cellspacing="0" width="590" align="center" valign="top">
		
<?php

$sql = "select t.masach, t.tensach, t.NgayDang, t.tentacgia, t.matheloai, t.hinhanh, t.nhaxuatban, l.matheloai, l.tentheloai, t.kiemduyet
        from (theloai l inner join sach t on t.matheloai=l.matheloai)
        group by t.matheloai, t.masach, t.tensach, t.NgayDang, t.tentacgia
        having (t.NgayDang >= all (select NgayDang from sach where matheloai=l.matheloai))";
		$danhsach = $connect->query($sql);
		//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
		if (!$danhsach) {
			die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
			exit();
		}
		while ($row = $danhsach->fetch_array(MYSQLI_ASSOC)) 		
		{
			if($row['kiemduyet'] == 1){
				echo    "<div class=\"sach\" style='float:left; width:300px;margin-top:10px;'>";
				echo    "<div class=\"hinhanh\" style='width: 150px;height: 225px; float:left;'><img width=\"150px\" height=\"224px\" src=" . $row["hinhanh"] . "></br></div>";
				echo    "<div class=\"thongtinsach\" style='width: 140px; float:left;margin-left:5px'>";
				echo    "<p style='margin-top:0;'><a class=\"tieude\" style='text-decoration:none;font-weight:bold;color:black;font-size:17px;'
				href='index.php?do=sach_chitiet&id=" . $row['masach'] . "'>" . $row['tensach'] . "</a></p>";
				echo    "<p class=\"ngay\">" . $row["nhaxuatban"] . "</p>";
				echo    "<p align=\"justify\">" . $row["tentacgia"] . "</p>";
				echo    "<p  align=\"left\">
						<a href='index.php?do=sach_chitiet&id=" . $row['masach'] . "'>Chi tiết</a></p>";
				echo "</div>";
				echo "</div>";
			}
		}

?>
</table>

		
	</body>
</html>