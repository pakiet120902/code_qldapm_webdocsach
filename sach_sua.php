<?php
	$masach = $_GET['id'];
	
	$sql = "SELECT * FROM `sach` WHERE masach = $masach";
	
	$danhsach = $connect->query($sql);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
	
	$dong = $danhsach->fetch_array(MYSQLI_ASSOC)
?>
<h3>Sửa bài viết</h3>
<form enctype="multipart/form-data" action="index.php?do=sach_sua_xuly" method="post">
	<table class="FormDangBaiViet">
		
		<input type="hidden" name="masach" value="<?php echo $dong['masach']; ?>" />
		
		<tr>
			<td>
				<span class="MyFormLabel">Tên sách:</span>
				<input type="text" name="tensach" value="<?php echo $dong['tensach']; ?>" />
			</td>
		</tr>
		<tr>
			<td>
				<span class="MyFormLabel">Thể loại:</span>
				<select name="theloai">
					<option value="">-- Chọn --</option>
					<?php
						$sql = "SELECT * FROM `theloai` WHERE 1 ORDER BY tentheloai";
						$danhsach = $connect->query($sql);
						//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
						if (!$danhsach) {
							die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
							exit();
						}
						
						while($dong_dscd = $danhsach->fetch_array(MYSQLI_ASSOC))
						{
							if($dong['matheloai'] == $dong_dscd['matheloai'])
								echo "<option value='" . $dong_dscd['matheloai'] . "' selected='selected'>" . $dong_dscd['tentheloai'] . "</option>";
							else
								echo "<option value='" . $dong_dscd['matheloai'] . "'>" . $dong_dscd['tentheloai'] . "</option>";
						}
					?>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<span class="MyFormLabel">Tên tác giả</span>
				<input type="text" name="tentacgia" value="<?php echo $dong['tentacgia']; ?>" />
			</td>
		</tr>
		<tr>
			<td>
				<span class="MyFormLabel">Nhà xuất bản</span>
				<input type="text" name="nhaxuatban" value="<?php echo $dong['nhaxuatban']; ?>" />
			</td>
		</tr>
		<tr>
			<td>Hình ảnh<input type="file" name="HinhAnh"></td>
		</tr>

	</table>
	
	<input type="submit" value="Cập nhật" />
</form>