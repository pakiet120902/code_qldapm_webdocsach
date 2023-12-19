<?php
	// Lấy thông tin từ FORM
	$masach = $_POST['masach'];
	$theloai = $_POST['theloai'];
	$tensach = $_POST['tensach'];
	$tentacgia = $_POST['tentacgia'];
	$nhaxuatban = $_POST['nhaxuatban'];	
	// Kiểm tra
	if(trim($theloai) == "")
		ThongBaoLoi("Chưa chọn thể loại!");
	elseif(trim($tensach) == "")
		ThongBaoLoi("Tên sách không được bỏ trống!");
	elseif(trim($tentacgia) == "")
		ThongBaoLoi("Tên tác giả không được bỏ trống!");
	elseif(trim($nhaxuatban) == "")
		ThongBaoLoi("Nhà xuất bản không được bỏ trống!");
	else
	{
		if($_FILES['HinhAnh']['name'] == ""){
			$sql = "UPDATE	sach
				SET		tensach = '$tensach',
						matheloai = $theloai,
						tentacgia = '$tentacgia',
						nhaxuatban = '$nhaxuatban'
				WHERE	masach = $masach";
				$danhsach = $connect->query($sql);
				if (!$danhsach) {
					die("Không thể thực hiện câu lệnh SQL1: " . $connect->connect_error);
					exit();
				}
				else
				{
					ThongBao("Chỉnh sửa sách thành công!");
				}	
		}
		else{
			$target_path = "images/";
			$target_path = $target_path . basename($_FILES['HinhAnh']['name']);
			if (move_uploaded_file($_FILES['HinhAnh']['tmp_name'], $target_path))
				echo "";
				//echo "Tập tin " . basename($_FILES['HinhAnh']['name']) . " đã được upload.<br/>";
			else
				echo "Tập tin upload không thành công.<br/>";
			$sql = "UPDATE	sach
				SET		tensach = '$tensach',
						matheloai = $theloai,
						tentacgia = '$tentacgia',
						nhaxuatban = '$nhaxuatban',
						hinhanh = '$target_path'
				WHERE	masach = $masach";
				$danhsach = $connect->query($sql);
				if (!$danhsach) {
					die("Không thể thực hiện câu lệnh SQL2: " . $connect->connect_error);
					exit();
				}
				else
				{
					ThongBao("Chỉnh sửa sách thành công!");
				}	
		}
		//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
			
		
	}
?>