<?php
	include "header.php";
	if(isset($_GET['act']))
	{
	    $act=$_GET['act'];
	
	    switch ($act)
	    {
	        case 'gioithieu':
	            {
	                include 'gioithieu.php';
	                break;
	            }
	            case 'danhmuc':
	                {
	                    include 'danhmuc.php';
	                    break;
	                }
	
	        case 'chinhsach':
	            {
	                include 'chinhsach.php';
	                break;
	            }
	        case 'lienhe':
	            {
	                include 'lienhe.php';
	                break;
	            }
	        case 'chitiet':
	            {
	                include 'chitiet.php';
	                break;
	            }
	        case 'giohang':
	            {
	                include 'giohang.php';
	                break;
	            }
	            case 'bosuutap':
	                {
	                    if (isset($_GET['category_id'])) {
	                        $categoryID = $_GET['category_id'];
	                        include 'bosuutap.php';
	                        break;
	                    }
	                }
	        default:
			{
	            include "home.php";
	            break;
	    	}
		}	
	}	
	else
	{
	    include 'home.php';
	}
	include "footer.php"
	?>