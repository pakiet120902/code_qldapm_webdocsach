<?php
	// Lấy chủ đề cần sửa "đổ" vào form
	$sql = "SELECT * FROM `theloai` WHERE matheloai = " . $_GET['id'];
	$danhsach = $connect->query($sql);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
	
	$dong = $danhsach->fetch_array(MYSQLI_ASSOC);
?>
<h3>Sửa thể loại</h3>
<form action="index.php?do=theloai_sua_xuly" method="post">
	<table class="Form">
		<input type="hidden" name="matheloai" value="<?php echo $dong['matheloai']; ?>" />
		<tr>
			<td>Tên thể loại:</td>
			<td><input type="text" name="tentheloai" value="<?php echo $dong['tentheloai']; ?>" /></td>
		</tr>
	</table>
	
	<input type="submit" value="Cập nhật" />
</form>