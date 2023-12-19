<?php
	// Lấy thông tin từ FORM
	$tensach = $_POST['tensach'];
	$theloai = $_POST['theloai'];
	$tentacgia = $_POST['tentacgia'];
	$nhaxuatban = $_POST['nhaxuatban'];
	//$ChuThichAnh = $_POST['ChuThichAnh'];
	
	// Kiểm tra
	if(trim($tensach) == "")
		ThongBaoLoi("Tên sách không được bỏ trống!");
	elseif(trim($theloai) == "")
		ThongBaoLoi("Chưa chọn thể loại!");
	elseif(trim($tentacgia) == "")
		ThongBaoLoi("Tên tác giả không được bỏ trống!");
	elseif(trim($nhaxuatban) == "")
		ThongBaoLoi("Nhà xuất bản không được bỏ trống!");
	else
	{
		//Lưu tập tin upload vào thư mục hinhanh
		$target_path = "images/";
		$target_path = $target_path . basename($_FILES['HinhAnh']['name']);
		if (move_uploaded_file($_FILES['HinhAnh']['tmp_name'], $target_path))
			echo "";
			//echo "Tập tin " . basename($_FILES['HinhAnh']['name']) . " đã được upload.<br/>";
		else
			echo "Tập tin upload không thành công.<br/>";		
	


		$manguoidung = $_SESSION['MaND'];
		
		if($_SESSION['QuyenHan'] == 1)
			$kiemduyet = 1;
		else
			$kiemduyet = 0;
		
		$sql = "INSERT INTO `sach`(`matheloai`, `manguoidung`, `tensach`, `tentacgia`, `nhaxuatban`, `NgayDang`, `hinhanh`, `kiemduyet`, `luotxem`)
				VALUES ($theloai, $manguoidung, '$tensach', '$tentacgia', '$nhaxuatban', now(), '$target_path', '$kiemduyet', 0)";
		$danhsach = $connect->query($sql);
		//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
		if (!$danhsach) {
			die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
			exit();
		}
		else
		{
			ThongBao("Đăng sách thành công!");
		}
		
		
		
	}
?>