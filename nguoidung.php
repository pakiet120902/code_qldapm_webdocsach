<?php
	$sql = "SELECT * FROM `nguoidung` WHERE 1";
	$danhsach = $connect->query($sql);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}

?>
<h3>Danh sách người dùng</h3>
<table class="DanhSach">
	<tr>
		<th>Mã ND</th>
		<th>Họ và tên</th>
		<th>Tên đăng nhập</th>
		<th>Quyền</th>
		<th colspan="3">Hành động</th>
	</tr>
	<?php
		$stt = 1;
		//Dùng vòng lặp while truy xuất các phần tử trong table
		while ($dong = $danhsach->fetch_array(MYSQLI_ASSOC)) 
		{			
			echo "<tr  bgcolor='#ffffff' onmouseover='this.style.background=\"#dee3e7\"' onmouseout='this.style.background=\"#ffffff\"'>";
				echo "<td>" . $dong["manguoidung"] . "</td>";
				echo "<td>" . $dong["tennguoidung"] . "</td>";
				echo "<td>" . $dong["tendangnhap"] . "</td>";
				
				echo "<td>";
					if($dong["quyenhan"] == 1)
						echo "Quản trị (<a href='index.php?do=nguoidung_kichhoat&id=" . $dong["manguoidung"] . "&quyen=2'>Hạ quyền</a>)";
					else
						echo "Thành viên (<a href='index.php?do=nguoidung_kichhoat&id=" . $dong["manguoidung"] . "&quyen=1'>Nâng quyền</a>)";
				echo "</td>";
				
				echo "<td align='center'>";
					if($dong["khoa"] == 0)
						echo "<a href='index.php?do=nguoidung_kichhoat&id=" . $dong["manguoidung"] . "&khoa=1'><img src='images/active.png' /></a>";
					else
						echo "<a href='index.php?do=nguoidung_kichhoat&id=" . $dong["manguoidung"] . "&khoa=0'><img src='images/ban.png' /></a>";
				echo "</td>";
				
				echo "<td align='center'><a href='index.php?do=nguoidung_sua&id=" . $dong["manguoidung"] . "'><img src='images/edit.png' /></a></td>";
				echo "<td align='center'><a href='index.php?do=nguoidung_xoa&id=" . $dong["manguoidung"] . "' onclick='return confirm(\"Bạn có muốn xóa người dùng " . $dong['tennguoidung'] . " không?\")'><img src='images/delete.png' /></a></td>";
			echo "</tr>";
		}
	?>
</table>
	
<a href="index.php?do=dangky">Thêm mới người dùng</a>
</form>