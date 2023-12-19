
<table border="0" cellspacing="0" width="595" align="left" valign="top">
<?php

// Lấy mã lĩnh vực
$cd = $_GET["id"];


 // BƯỚC 2: TÌM TỔNG SỐ RECORDS
		$sql1 = "select count(masach) as total from sach where matheloai= '" .$cd."' ";
       
		$danhsach = $connect->query($sql1);
		//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
		if (!$danhsach) {
			die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
			exit();
		}
	
	  
		$row1 = $danhsach->fetch_array(MYSQLI_ASSOC);
		
        $total_records = $row1['total'];		
		
 
        // BƯỚC 3: TÌM LIMIT VÀ CURRENT_PAGE
        $current_page = isset($_GET['page']) ? $_GET['page'] : 1;
        $limit = 2;
 
        // BƯỚC 4: TÍNH TOÁN TOTAL_PAGE VÀ START
        // tổng số trang
        $total_page = ceil($total_records / $limit);
 
        // Giới hạn current_page trong khoảng 1 đến total_page
        if ($current_page > $total_page){
            $current_page = $total_page;
        }
        else if ($current_page < 1){
            $current_page = 1;
        }
 
        // Tìm Start
        $start = ($current_page - 1) * $limit;
 
        // BƯỚC 5: TRUY VẤN LẤY DANH SÁCH TIN TỨC
        // Có limit và start rồi thì truy vấn CSDL lấy danh sách tin tức
        $sql2 =  "select * from sach where matheloai='" . $cd . "' ORDER by `NgayDang` DESC  LIMIT $start, $limit"; 

		$danhsach = $connect->query($sql2);
		//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
		if (!$danhsach) {
			die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
			exit();
		}

	while ($row = $danhsach->fetch_array(MYSQLI_ASSOC))  
	{	
		if($row['kiemduyet'] == 1){
            echo    "<div class=\"sach\" style='float:left; width: 300px;margin-top:10px;border-bottom:thin solid gray;'>";
            echo    "<div class=\"hinhanh\" style='width: 150px; float:left;'><img width=\"150px\" src=" . $row["hinhanh"] . "></br></div>";
            echo    "<div class=\"thongtinsach\" style='width: 140px; float:left;margin-left:5px'>";
            echo    "<p style='margin-top:0;'><a class=\"tieude\" style='text-decoration:none;font-weight:bold;color:black;font-size:17px;'
            href='index.php?do=sach_chitiet&id=" . $row['masach'] . "'>" . $row['tensach'] . "</a></p>";
            echo    "<p class=\"ngay\">" . $row["nhaxuatban"] . "</p>";
            echo    "<p align=\"justify\">" . $row["tentacgia"] . "</p>";
            echo    "<p  align=\"left\">
                    <a href='index.php?do=sach_chitiet&id=" . $row['masach'] . "'>Chi tiết</a></p>";
            echo "</div>";
            echo "</div>";
        }
	}
?>
	<tr>
	<td>
	<?php 
            // PHẦN HIỂN THỊ PHÂN TRANG
            // BƯỚC 7: HIỂN THỊ PHÂN TRANG
 
            // nếu current_page > 1 và total_page > 1 mới hiển thị nút prev
            if ($current_page > 1 && $total_page > 1){			
                echo '<a href="index.php?do=sach_chude&id= '. $cd . ' &  page='.($current_page-1).'">Prev</a> | ';
            }
 
            // Lặp khoảng giữa
            for ($i = 1; $i <= $total_page; $i++){
                // Nếu là trang hiện tại thì hiển thị thẻ span
                // ngược lại hiển thị thẻ a
                if ($i == $current_page){
                    echo '<span>'.$i.'</span> | ';
                }
                else{
                    echo '<a href="index.php?do=sach_chude&id= '. $cd . ' &  page='.$i.'">'.$i.'</a> | ';
                }
            }
 
            // nếu current_page < $total_page và total_page > 1 mới hiển thị nút prev
            if ($current_page < $total_page && $total_page > 1){
                echo '<a href="index.php?do=sach_chude&id= '. $cd . ' &  page='.($current_page+1).'">Next</a> | ';
            }
           ?>
		   </td>
        </tr>
</table>