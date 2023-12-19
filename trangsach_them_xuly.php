<?php
	// Lấy thông tin từ FORM
	$masach = $_POST['masach'];
	$trangso = $_POST['trangso'];
	$noidung = $_POST['noidung'];
	
	// Kiểm tra
	if(trim($trangso) == "")
		ThongBaoLoi("Trang sách không được bỏ trống!");
	else
	{
		$sql = "INSERT INTO `trangsach`(`trangso`, `noidung`, `masach`) VALUES ( $trangso,'$noidung',$masach)";
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
		
	}
?>