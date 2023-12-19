<?php
	$masach = $_GET['id'];
	
	$sql = "select MAX(trangso) as sotrang from trangsach where masach= '".$masach."' ";
	
	$danhsach = $connect->query($sql);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
	
	$dong = $danhsach->fetch_array(MYSQLI_ASSOC)
?>
<h3>Thêm trang sách</h3>
<form action="index.php?do=trangsach_them_xuly" method="post">
	<table class="Form">
		<input type="hidden" name="masach" value="<?php echo $masach ?>" />
		<td>
				<span class="MyFormLabel">Trang số:</span>
				<input value="<?php echo $dong['sotrang'] + 1; ?>" type="number" name="trangso" size = " 60" />
			</td>
		<tr>
			<td>
				<span class="MyFormLabel">Nội dung trang sách:</span>
				<textarea name="noidung" id="noidung"></textarea>				
				<script>CKEDITOR.replace('noidung');</script>
				
			</td>
		</tr>
	</table>
	
	<input type="submit" value="Thêm" />
</form>