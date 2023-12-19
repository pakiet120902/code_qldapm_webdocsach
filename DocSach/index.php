<?php
	session_start();
	
	include_once "cauhinh.php";
	
	include_once "thuvien.php";
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Trang đọc sách online</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />
	
		<script type="text/javascript" src="scripts/jquery-1.4.1.js"></script>
		<script type="text/javascript" src="scripts/basic.js"></script>
		
		<script type="text/javascript" src="scripts/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="scripts/ckfinder/ckfinder.js"></script>
		
		
		
	</head>
	<body onload="htGio()">
		<div id="TrangWeb">
			<div id="PhanDau">
				
			</div>
			<div id="PhanMenu1">
				<a class = "menu" href="index.php?do=home">Trang chủ</a>  
				
		
			</div>
			<div id="PhanMenu2">
				
		
			</div>
			
			<div id="PhanMenu3">
				<form action="index.php?do=search_xuly" method="post">
					Tìm kiếm: <input type="text" name="search" />
					<input type="submit" name="ok" value="search" />
				</form>
			</div>
			<div id="PhanGiua">
				<div id="BenTrai">
				<h3>Chuyên mục</h3>
					
					<?php

						$sql = "SELECT * FROM `theloai` WHERE 1";
						$danhsach = $connect->query($sql);
						//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
						if (!$danhsach) {
							die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
							exit();
						}
					?>
					<div id="menudung">
					  <ul>						
						
							<?php
							
								while ($row = $danhsach->fetch_array(MYSQLI_ASSOC)) 
								{
    								echo "<li><a href='index.php?do=sach_chude&id=" . $row['matheloai'] . "'>" . $row['tentheloai'] . "</a></li>";   
  								}
							?>  
						  
					   </ul>
						
					</div>	
					
					
				
				
					<h3>Chức năng khác</h3>
					<ul>
						<li>...........</li>
						<li>...........</li>
					</ul>
					
								
					
					
					
				</div>	
				
				<div id="Giua" style="height:800px;">
					<?php
						
						$do = isset($_GET['do']) ? $_GET['do'] : "home";
						
						include $do . ".php";
					?>
				</div>
				<div id="BenPhai">
					<h3>Tin mới nhất</h3>
					<br>............
					<h3>Thông báo quan trọng</h3>
					<br>............
					<h3>Quảng cáo</h3>
					<br>............
					
					
			</div>
			<div id="PhanCuoi">
				<div class="lienhe">Liên hệ: nhom@agu.edu.vn </div>
			</div>
		</div>
	</body>
</html>