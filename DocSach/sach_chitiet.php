<?php
	$masach = $_GET['id'];
	
	$sql = "SELECT *
			FROM sach A, theloai B, nguoidung C
			WHERE A.matheloai = B.matheloai AND A.manguoidung = C.manguoidung AND A.masach = $masach";
	
	$danhsach = $connect->query($sql);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
	
	$dong = $danhsach->fetch_array(MYSQLI_ASSOC);
	
	// Tăng lượt xem
	$sql = "UPDATE sach SET luotxem = luotxem + 1 WHERE masach = $masach";
	$truyvan_luotxem = $connect->query($sql);
	
	
?>
<h3><?php echo $dong['tensach']; ?></h3>

<p class="ThongTin">[<?php echo $dong['tentheloai']; ?>] Đăng bởi <?php echo $dong['tennguoidung']; ?>, 
vào lúc <?php echo $dong['NgayDang']; ?>, có  <?php echo $dong['luotxem']; ?> lượt xem. </p>



<p class="tentacgia"><?php echo $dong['tentacgia']; ?></p>
<p><?php echo    "<td colspan=\"2\"><img width=\"200\" src=" . $dong["hinhanh"] . "></br></td>"; ?></p>
<?php echo "<a href='index.php?do=docsach&id=" . $dong['masach'] . "&trang=1'>Đọc sách</a>"; ?>

<table border="0" cellspacing="0" width="550" align="center" valign="top">

<?php
	// các tin khác cũ hơn cùng lĩnh vực
	$sql = "select masach, tensach , date_format(NgayDang,'%d/%m') as Ngay, matheloai from  sach " .
        " where matheloai='" . $dong['matheloai'] .
        "' and NgayDang < (select NgayDang from  sach where masach=" . $dong["masach"] . ") order by masach desc";
	
	$danhsach2 = $connect->query($sql);
	if (!$danhsach2) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
		
	
	echo "<tr>";
		echo "<td class=\"tensach\"><hr/>Các sách khác cùng thể loại:<ul>";
	while ($row = $danhsach2->fetch_array(MYSQLI_ASSOC))
	{
		echo "<li>";
		echo "<a href='index.php?do=sach_chitiet&id=" . $row['masach'] . "'>" . $row['tensach'] . "</a>";
		echo "&nbsp;<span class=\"ngay\">(" . $row["Ngay"] . ")</span>";
		echo "</li>";
	}
	echo "</ul></td></tr> </table>";


?>

