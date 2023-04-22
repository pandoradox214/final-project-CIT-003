
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="stylesheets.css">
    <link rel="stylesheet" type="text/css" href="styles2.css">
    <link rel="stylesheet" type="text/css" href="styles3.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script rel="javascript" src="script.js" defer> </script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News and Blogs</title>
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
                        
                        <div class="dropdown">
                        <li class="und"><a href="delivery.php"><button class="dropbtn" id="delivery">DELIVERY </li> 
                        <li class="und"><a href="logout.php"><button class="dropbtn">Log Out</li> 
                        </div> 

                        <a href="javascript:void(0);" 
                        style="font-size:15px; color:#f1ce02" 
                        class="icon" onclick="FuncNav()">&#9776;</a>
                                            
                      </ul>
                    </div>
                </nav>
            </span>
          <!--Navigation-->
          <section class="header2">
            <br><br>
              <center><h1 class="subtitle" id="TD">DELIVERY</h1></center>
      
        <section class="blackery"></section>
            <section class="deliveryC">
            
       <div class="panda">
        <img src="img/Delivery/foodpanda-scaled.jpg" class="imaged" alt="FoodPanda">
        <img src="img/Art/unavailable.png" class="unavailable">  
      </div>
            
        <div class="maxim">
          <img src="img/Delivery/Maxim.png" class="imaged1" alt="Maxim">
          <img src="img/Art/unavailable.png" class="unavailable"> 
        </div>
              
        <div class="grab">
          <img src="img/Delivery/Grab.jpg" class="imaged2" alt="GrabFood">
          <img src="img/Art/unavailable.png" class="unavailable"> 
        </div>

            </section>
          </section>

            <footer>
                        <a href="about.html"> <p>ABOUT</p></a>
                        <a href="https://www.facebook.com/pareSilog.zamboanga"><img src="img/FB_logo.png" alt="logo" class = "fbLogo"></a>
            </footer>
        </div>
</body>
</html>