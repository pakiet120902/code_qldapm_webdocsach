<?php
	$sql = "SELECT * FROM `theloai` WHERE 1";
	$danhsach = $connect->query($sql);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
?>
<h3>Danh sách thể loại</h3>
<table class="DanhSach">
	<tr>
		<th width="15%">Mã thể loại</th>
		<th width="70%">Tên thể loại</th>
		<th width="15%" colspan="2">Hành động</th>
	</tr>
	<?php
		while ($dong = $danhsach->fetch_array(MYSQLI_ASSOC)) {		
			echo "<tr  bgcolor='#ffffff' onmouseover='this.style.background=\"#dee3e7\"' onmouseout='this.style.background=\"#ffffff\"'>";
				echo "<td>" . $dong["matheloai"] . "</td>";
				echo "<td>" . $dong["tentheloai"] . "</td>";
				echo "<td align='center'><a href='index.php?do=theloai_sua&id=" . $dong["matheloai"] . "'><img src='images/edit.png' /></a></td>";
				echo "<td align='center'><a href='index.php?do=theloai_xoa&id=" . $dong["matheloai"] . "' onclick='return confirm(\"Bạn có muốn xóa thể loại " . $dong['tentheloai'] . " không?\")'><img src='images/delete.png' /></a></td>";
			echo "</tr>";
		}
	?>
</table>
	
<a href="index.php?do=theloai_them">Thêm mới thể loại</a>
</form>