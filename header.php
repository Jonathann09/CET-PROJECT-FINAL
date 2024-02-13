<?php
  session_start();
 ?>
 <!DOCTYPE html>
 <html>
 <head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="style.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
 integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
 <link rel="stylesheet" href="styleloggedin.css">

 <title>Baybytes Website</title>
 </head>
  <body>
    <div class="topnav" id="myTopnav">
    <a href="loggedin.php" class="active">Home</a>
    <a href="profile.php" class="active">Profile</a>
    <a href="lesson.php" class="active">Lesson</a>
    <a href="quiz.php" class="active">Quiz</a>
    <a href="includes/logout.inc.php" name="logout-submit">SIGN OUT</a>
       </div>

  </header>
