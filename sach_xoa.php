<?php
	$masach = $_GET['id'];
	
	$sql = "DELETE FROM `sach` WHERE masach = $masach";
	$danhsach = $connect->query($sql);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
	else
	{
		header("Location: index.php?do=sach");
	}	
	
?>

