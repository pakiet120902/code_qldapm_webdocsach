<h3>Đăng sách</h3>
<form enctype="multipart/form-data"  action="index.php?do=sach_them_xuly" method="post">
	<table class="FormDangsach">
		<tr>
			<td>
				<span class="MyFormLabel">Tên sách:</span>
				<input type="text" name="tensach" size = " 60" />
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

						
						while ($dong = $danhsach->fetch_array(MYSQLI_ASSOC)) 
						{
							echo "<option value='" . $dong['matheloai'] . "'>" 
							.$dong['tentheloai'] . "</option>";
						}
					?>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<span class="MyFormLabel">Tên tác giả:</span>
				<input type="text" name="tentacgia" size = " 60" />
			</td>
		</tr>
		<tr>
			<td>
				<span class="MyFormLabel">Nhà xuất bản:</span>
				<input type="text" name="nhaxuatban" size = " 60" />
			</td>
		</tr>
		<tr>
			<td>Hình ảnh<input type="file" name="HinhAnh"></td>
		</tr>
		    

	</table>
	
	<input type="submit" value="Đăng sách" />
</form>