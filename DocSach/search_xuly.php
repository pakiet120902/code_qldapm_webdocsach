 <?php
        if (isset($_REQUEST['ok'])) {
 
            // Gán hàm addslashes để chống sql injection
            $search = addslashes($_POST['search']);
            // Dùng câu lênh like trong sql và sứ dụng toán tử % của php 
			//để tìm kiếm dữ liệu chính xác hơn.
            $sql = "select * from sach where tensach like '%$search%' or tentacgia like '%$search%'";
 
           
 
            // Thực thi câu truy vấn
            $danhsach = $connect->query($sql);
			//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
			if (!$danhsach) {
				die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
				exit();
			}
            // Đếm số dòng trả về trong sql.
            $num = mysqli_num_rows($danhsach);
 
            // Nếu $search rỗng thì báo lỗi tức là người dùng chưa
			//nhập liệu mà đã nhấn submit.
            if (empty($search)) {
                echo "Hãy nhập dữ liệu vào ô tìm kiếm";
            } else {
                // Ngược lại nếu người dùng nhập liệu thì tiến hành xứ lý show dữ liệu.
                // Nếu $num > 0 hoặc $search khác rỗng tức 
				//là có dữ liệu mối show ra nhé, ngược lại thì báo lỗi.
                if ($num > 0 && $search != "") {
 
                    // Dùng $num để đếm số dòng trả về.
                    echo "$num kết quả trả về với từ khóa <b>$search</b>";
                    // Vòng lặp while & mysql_fetch_assoc dùng để lấy toàn bộ 
					//dữ liệu có trong table và trả về dữ liệu ở dạng array.
                    while ($row = $danhsach->fetch_array(MYSQLI_ASSOC))
					{						
						if($row['kiemduyet'] == 1){
							echo    "<div class=\"sach\" style='float:left; width: 300px;margin-top:10px;border-bottom:thin solid gray;'>";
							echo    "<div class=\"hinhanh\" style='width: 150px; float:left;'><img width=\"150px\" src=" . $row["hinhanh"] . "></br></div>";
							echo    "<div class=\"thongtinsach\" style='width: 140px; float:left;margin-left:5px'>";
							echo    "<p style='margin-top:0;'><a class=\"tieude\" style='text-decoration:none;font-weight:bold;color:black;font-size:17px;'
							href='index.php?do=baiviet_chitiet&id=" . $row['masach'] . "'>" . $row['tensach'] . "</a></p>";
							echo    "<p class=\"ngay\">" . $row["nhaxuatban"] . "</p>";
							echo    "<p align=\"justify\">" . $row["tentacgia"] . "</p>";
							echo    "<p  align=\"left\">
									<a href='index.php?do=sach_chitiet&id=" . $row['masach'] . "'>Chi tiết</a></p>";
							echo "</div>";
							echo "</div>";
						} 
                    }
                } else 
                    echo "Không tìm thấy kết quả!";
				}
			}
        ?>   