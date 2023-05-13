<?php
include 'includes/connect.php';

if(isset($_SESSION['user_id']))
{
include 'includes/wallet.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Delivery</title>
    <!--CSS-->
    <link rel="stylesheet" type="text/css" href="stylesheets.css">
    <link rel="stylesheet" type="text/css" href="styles2.css">
    <link rel="stylesheet" type="text/css" href="styles3.css">
    <link rel="stylesheet" type="text/css" href="css/customer-side/delivery.css">
    <!-- <link href="css/customer-side/jquery.dataTables.min.css" type="text/css" rel="stylesheet" media="screen,projection"> -->
    <!--Font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" href="img/logo.jpg" sizes="32x32">
   
    <!--JS Script--->
    <script rel="javascript" src="script.js" defer> </script>
</head>
<body>
        <div class="parent">
             <!--Navigation-->
            <span class="head">
            <nav class="navigation" id="main-nav">
                    <a class="logoHover" href="index.php"><img src="img/logo.jpg"  alt="Logo"></a>
                    <div class="navigation_menu">
                    <ul>
                      <li><a> <iframe class="clock" scrolling="no" frameborder="no" clocktype="html5" 
                        src="https://www.clocklink.com/html5embed.php?clock=043&timezone=Philippines
                        _Manila&color=yellow&size=120&Title=&Message=&Target=&From=2022,1,1,0,0,0&Color=yellow"></iframe></a></li>
                        <li class="und"><a href="index.php" href="javascript:void(0)"> HOME </a></li>
                        <li class="und"><a href="top_meals.php"> TOP MEALS </a></li>
                        <li class="und"><a href="news_and_blogs.php"> NEWS & BLOGS </a></li>
                        <li class="und"><a href="delivery.php">DELIVERY </li> 
                        <li class="und"><a href="router/logout.php">LOG OUT</li> 
                        <a href="javascript:void(0);" 
                        style="font-size:15px; color:#f1ce02" 
                        class="icon" onclick="FuncNav()">&#9776;</a>                 
                      </ul>
                    </div>
                </nav>
            </span>
          <!--Navigation-->
          <section id="deliveryContent">
            <div id="row">
              <div id="headerContainer">    
                <h1 id="orderSlipH1">Order Slip</h1>
              </div>
              <div id=""> <h6 id="txt">ORDER YOUR FOOD HERE</h6></div>
      <!--begin Container--->
      <form class="formValidate" id="formValidate" method="post" action="place-order.php" novalidate="novalidate">
                  <table id="data-table-customer" class="responsive-table display" cellspacing="0">
                    <thead>
                      <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                      </tr>
                    </thead>
                    <tbody>
				<?php
				$result = mysqli_query($con, "SELECT * FROM items where not deleted;");
				while($row = mysqli_fetch_array($result))
				{
					echo '<tr><td>'.$row["name"].'</td><td>'.'₱ '.$row["price"].'</td>';                      
					echo '<td><div class="input-field cols12"><label>Value 0 for none</label><br>';
					echo '<input id="'.$row["id"].'" name="'.$row["id"].'" type="number" data-error=".errorTxt'.$row["id"].'" value="0"><div class="errorTxt'.$row["id"].'"></div></td></tr>';
				}
				?>
                    </tbody>
</table>
              </div>
			  <div class="input-field_col_s12">
              <i class="mdi-editor-mode-edit prefix"></i>
              <label for="description" id="labelNote">Any note(optional)</label><br>
              <textarea id="description" name="description" class="materialize-textarea"></textarea>
              
			  </div>
			  <div>
          <div class="txtArea">
            <button class="btn  light-blue waves-effect waves-light right" type="submit" name="action" id="OrderButton">Proceed to checkout
          </button>
          </div>
        </div>
			</form>
      <!--End Cointainer-->
            </div>
            
        
          </section>

            <footer>
              <a href="about.html"> <p>ABOUT</p></a>
              <a href="https://www.facebook.com/pareSilog.zamboanga"><img src="img/FB_logo.png" alt="logo" class = "fbLogo"></a>
            </footer>
        </div>
</body>
</html>
<?php
	}
	else
	{
		if(isset($_SESSION['admin_sid']))
		{
			header("location:admin-page.php");		
		}
		else{
			header("location:login.php");
		}
	}
?>