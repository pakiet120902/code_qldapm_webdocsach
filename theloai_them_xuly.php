<?php
	// Lấy thông tin từ FORM
	$tentheloai = $_POST['tentheloai'];
	
	// Kiểm tra
	if(trim($tentheloai) == "")
		ThongBaoLoi("Tên chủ đề không được bỏ trống!");
	else
	{
		$sql = "INSERT INTO `theloai`(`tentheloai`) VALUES ('$tentheloai')";
		$danhsach = $connect->query($sql);
		//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
		if (!$danhsach) {
			die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
			exit();
		}
		else
		{
			header("Location: index.php?do=theloai");
		}	
		
	}
?>