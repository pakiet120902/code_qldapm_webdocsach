<?php
	if(isset($_GET['k']))
	{
		$k = $_GET['k'];
		$id = $_GET['id'];
		
		$sql = "UPDATE sach SET kiemduyet = $k WHERE masach = $id";
		$sach_kiemduyet = $connect->query($sql);
		//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
		if (!$sach_kiemduyet) {
			die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
			exit();
		}
		else
		{
			header("Location: index.php?do=sach");
		}		
	}
	else
	{
		header("Location: index.php?do=sach");
	}
?>