<?php
	$sql = "SELECT *
			FROM sach A, theloai B, nguoidung C
			WHERE A.matheloai = B.matheloai AND A.manguoidung = C.manguoidung ORDER by `NgayDang` DESC";
	$danhsach = $connect->query($sql);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
?>
<h3>Danh sách sách</h3>
<table class="DanhSach">
	<tr>
		<th>Mã Sách</th>
		<th>Tên sách</th>
		<th>Thể loại</th>
		<th>Người đăng</th>
		<th colspan="4">Hành động</th>
	</tr>
	<?php
		while ($dong = $danhsach->fetch_array(MYSQLI_ASSOC)) {	
			echo "<tr>";
				echo "<td>" . $dong['masach'] . "</td>";
				echo "<td><a href='index.php?do=sach_chitiet&id=" . $dong['masach'] . "'>" . $dong['tensach'] . "</a></td>";
				echo "<td>" . $dong['tentheloai'] . "</td>";
				echo "<td>" . $dong['tennguoidung'] . "</td>";
				
				echo "<td align='center'><a href='index.php?do=trangsach_them&id=" . $dong['masach'] . "'>Thêm trang</a></td>";
				echo "<td align='center'>"; 
					if($dong['kiemduyet'] == 0)
						echo "<a href='index.php?do=sach_kiemduyet&k=1&id=" . $dong['masach'] . "'><img src='images/ban.png' /></a>";
					else
						echo "<a href='index.php?do=sach_kiemduyet&k=0&id=" . $dong['masach'] . "'><img src='images/active.png' /></a>";
				echo "</td>";
				
				echo "<td align='center'><a href='index.php?do=sach_sua&id=" . $dong['masach'] . "'><img src='images/edit.png' /></a></td>";
				echo "<td align='center'><a href='index.php?do=sach_xoa&id=" . $dong['masach'] . "' onclick='return confirm(\"Bạn có muốn xóa sách " . $dong['tensach'] . " không?\")'><img src='images/delete.png' /></a></td>";
			echo "</tr>";
		}
	?>
</table>

<a href="index.php?do=sach_them">Đăng sách</a>