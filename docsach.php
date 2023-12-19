
<?php

$masach = $_GET["id"];
$trang = $_GET["trang"];
$current_page = $trang;

		$sql = "select * from trangsach where masach= '" .$masach. "' AND trangso ='".$trang."'";
        $danhsach = $connect->query($sql);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
	
	$dong = $danhsach->fetch_array(MYSQLI_ASSOC);
        echo $dong['noidung'];

        $sql2 = "select MAX(trangso) as sotrang from trangsach where masach= '".$masach."' ";
        $danhsach2 = $connect->query($sql2);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach2) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
	$dong2 = $danhsach2->fetch_array(MYSQLI_ASSOC);
    $sotrang = $dong2['sotrang'];

?>
	<tr>
	<td>
	<?php 
            // PHẦN HIỂN THỊ PHÂN TRANG
            // BƯỚC 7: HIỂN THỊ PHÂN TRANG
 
            // nếu current_page > 1 và total_page > 1 mới hiển thị nút prev
            if ($current_page > 1 ){			
                echo '<a href="index.php?do=docsach&id= '. $masach . ' &  trang='.($current_page-1).'">Prev</a> | ';
            }
	?>
			<select name="trangso" onchange="loadDocSach(this.options[this.selectedIndex].value,<?php echo $masach ?>)">
			<?php
            echo '<option value="">-- Chọn --</option>';
						$sql = "SELECT trangso FROM `trangsach` WHERE masach= '".$masach."' ";
						$danhsach = $connect->query($sql);
						//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
						if (!$danhsach) {
							die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
							exit();
						}

						while ($dong = $danhsach->fetch_array(MYSQLI_ASSOC)) 
						{
							echo "<option value='" . $dong['trangso'] . "'>" 
							.$dong['trangso'] . "</option>";
						}
						
			echo '</select>';
            // nếu current_page < $total_page và total_page > 1 mới hiển thị nút prev
            if ($current_page >= 1 && $current_page < $sotrang ){
                echo '<a href="index.php?do=docsach&id= '. $masach . ' &  trang='.($current_page+1).'">Next</a> | ';
            }
           ?>
		   </td>
		   <script type="text/javascript">
				function loadDocSach(value,id){
					let url = "http://127.0.0.1:85/WEBSITE_DOCSACH/Admin/index.php?do=docsach&id=" + id + "&trang=" + value;
					window.location.href = url;
				}
		   </script>
        </tr>
</table>