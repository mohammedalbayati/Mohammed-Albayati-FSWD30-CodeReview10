<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>A-Z Library</title>
  </head>
  <body>


<?php

 ob_start();

 session_start();

 require_once 'dbconnect.php';

 

 // it will never let you open index(login) page if session is set

 if ( isset($_SESSION['user'])!="" ) {

  header("Location: home.php");

  exit;

 }

 

 $error = false;

 

 if( isset($_POST['btn-login']) ) {

 

  // prevent sql injections/ clear user invalid inputs

  $user_email = trim($_POST['user_email']);

  $user_email = strip_tags($user_email);

  $user_email = htmlspecialchars($user_email);

 

  $user_pass = trim($_POST['user_pass']);

  $user_pass = strip_tags($user_pass);

  $user_pass = htmlspecialchars($user_pass);

  // prevent sql injections / clear user invalid inputs

 

  if(empty($user_email)){

   $error = true;

   $emailError = "Please enter your email address.";

  } else if ( !filter_var($user_email,FILTER_VALIDATE_EMAIL) ) {

   $error = true;

   $emailError = "Please enter valid email address.";

  }

 

  if(empty($user_pass)){

   $error = true;

   $passError = "Please enter your password.";

  }

 

  // if there's no error, continue to login

  if (!$error) {

   

   $password =  $user_pass ; // password hashing using SHA256

 

   $res=mysqli_query($conn, "SELECT user_id, first_name, user_pass FROM users WHERE user_email='$user_email'");

   $row=mysqli_fetch_array($res, MYSQLI_ASSOC);

   $count = mysqli_num_rows($res); // if uname/pass correct it returns must be 1 row

   

   if( $count == 1 && $row['user_pass'] == $password ) {

    $_SESSION['user'] = $row['user_id'];

    header("Location: home.php");

   } else {

    $errMSG = "Incorrect Credentials, Try again...";

   }

   

  }

 

 }

?>

<!DOCTYPE html>

<html>

<head>

<title>Login & Registration System</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<body>

<!-- Image and text -->
<nav class="navbar navbar-dark bg-dark">
   <a class="navbar-brand" href="home.php" style="font-size: 26px;"> <i class="fab fa-leanpub fa-2x" style="color:#E23D80"></i> <span>A-Z Library</span> </a>
      <a class="navbar-brand"></a>

         

 <a class="navbar-brand" >

  
  </a>
 


</nav>


  <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">Sing in <i class="fas fa-sign-in-alt"></i> </h1>


 <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">

             <hr />

      
            <?php

   if ( isset($errMSG) ) {



echo $errMSG; ?>

               

                <?php

   }

   ?>

           

           

             

<input type="email" name="user_email" class="form-control" placeholder="Your Email" value="<?php echo $user_email; ?>" maxlength="40" />

         

 <span class="text-danger"><?php echo $emailError; ?></span>

   

           


  <input type="password" name="user_pass" class="form-control" placeholder="Your Password" maxlength="15" />

         

<span class="text-danger"><?php echo $passError; ?></span>


 <hr />
 <button type="submit" name="btn-login" class="btn btn-outline-info">Sign In.</button>
             <hr />
             <a href="register.php">Sign Up Here <i class="fas fa-user-plus"></i></a>
    </form>
         
        </div>
      </section>


    


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

       
       <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

    <title>Welcome - <?php echo $userRow['user_name']; ?></title>

    <style type="text/css">
      
      body{

        background-color:  rgba(0, 0, 0, 0.7);
      }

.navbar-dark .navbar-brand{

  color: #E23D80;
}.navbar-dark .navbar-brand:hover{

  color: #FFFFFF;
}

.card{

height: 600px;

  margin: 35px 20px 20px 20px ;

  text-align: center;

}

.card img{

 height: 280px;
}.card:hover {
  -ms-transform: scale(1.1,1.1); /* IE 9 */
    -webkit-transform: scale(1.1,1.1); /* Safari */
    transform: scale(1.1,1.1); /* Standard syntax */
}

.card .card-text{

  max-height: 100px;
}
.nav-tabs{

  width: 40%;
  margin: 0 auto;

}
#myTab{

  padding: 5px;
  border:none;
}
.nav-tabs .nav-link{

  margin-left: 25px;
  text-align: center;
color: #E23D80;
font-size: 23px;
}.nav-tabs .nav-link:hover{

  border:none;

  border-bottom: 3px solid red;

  color: red;
}
center{

  width: 100%
}
span{

  line-height: 1.2;
}
.jumbotron{

  margin-bottom: 0rem;
}

    </style>
  </head>
  <body>
 
    

<div class="container">
<ul class="nav nav-tabs" id="myTab" role="tablist"">
  <li class="nav-item">
    <a class="nav-link " id="home-tab" data-toggle="tab" href="#all" role="tab" aria-controls="home" aria-selected="ALL">All</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#book" role="tab" aria-controls="profile" aria-selected="false">Book</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#dvd" role="tab" aria-controls="contact" aria-selected="false">Dvd</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#cd" role="tab" aria-controls="contact" aria-selected="false">Cd</a>
  </li>
</ul>

</div>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="home-tab">
    
    <?php

$sql1 = "SELECT * FROM media";
$result1 = $conn->query($sql1);

if ($result1->num_rows > 0) {
  echo '
  <main role="main" class="main">
    <div class="album py-5 " style="background-color: #ccc;">
        <div class="container">
    <div class="row">
          ';

    while($row1 = $result1->fetch_assoc()) {
      echo '
   
       <div class="col-md-4">
             <div class="card">
          <img class="card-img-top" src='.$row1["image"].' alt="Card image cap" width="40px">
          <div class="card-body">
            <h5 class="card-title"> Title : '.$row1["title"].'</h5>
            <p class="card-text">"'.$row1["description"].'"</p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item"> Iteme-number : '.$row1["fk_author_id"].'</li>
            <li class="list-group-item"> Type : '.$row1["type"].'</li>
            <li class="list-group-item"> ISBN : '.$row1["ISBN"].'</li>
          </ul>
          
        </div>
            </div>
            ';
    }
       echo "
           </div>
          </div>
        </div>
      </main>";
 } else {
    echo "0 results";
}



?>


  </div>
  <div class="tab-pane fade" id="book" role="tabpanel" aria-labelledby="profile-tab">


        <?php

          $sql2 = "SELECT * FROM media WHERE type='book'";
          $result2 = $conn->query($sql2);

          if ($result2->num_rows > 0) {
            echo '
            <main role="main" class="main">
              <div class="album py-5 " style="background-color: #ccc;">
                  <div class="container">
              <div class="row">
                    ';

              while($row2 = $result2->fetch_assoc()) {
                echo '
             
                 <div class="col-md-4">
                       <div class="card">
                    <img class="card-img-top" src='.$row2["image"].' alt="Card image cap" width="40px">
                    <div class="card-body">
                      <h5 class="card-title"> Title : '.$row2["title"].'</h5>
                      <p class="card-text">"'.$row2["description"].'"</p>
                    </div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item"> Iteme-number : '.$row2["fk_author_id"].'</li>
                      <li class="list-group-item"> Type : '.$row2["type"].'</li>
                      <li class="list-group-item"> ISBN : '.$row2["ISBN"].'</li>
                    </ul>
                    
                  </div>
                      </div>
                      ';
              }
                 echo "
                     </div>
                    </div>
                  </div>
                </main>";
           } else {
              echo "0 results";
          }

          

          ?>
    
  </div>
  <div class="tab-pane fade" id="cd" role="tabpanel" aria-labelledby="contact-tab">
        <?php

          $sql3 = "SELECT * FROM media WHERE type='cd'";
          $result3 = $conn->query($sql3);

          if ($result3->num_rows > 0) {
            echo '
            <main role="main" class="main">
              <div class="album py-5 " style="background-color: #ccc;">
                  <div class="container">
              <div class="row">
                    ';

              while($row3 = $result3->fetch_assoc()) {
                echo '
             
                 <div class="col-md-4">
                       <div class="card">
                    <img class="card-img-top" src='.$row3["image"].' alt="Card image cap" width="40px">
                    <div class="card-body">
                      <h5 class="card-title"> Title : '.$row3["title"].'</h5>
                      <p class="card-text">"'.$row3["description"].'"</p>
                    </div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item"> Iteme-number : '.$row3["fk_author_id"].'</li>
                      <li class="list-group-item"> Type : '.$row3["type"].'</li>
                      <li class="list-group-item"> ISBN : '.$row3["ISBN"].'</li>
                    </ul>
                   
                  </div>
                      </div>
                      ';
              }
                 echo "
                     </div>
                    </div>
                  </div>
                </main>";
           } else {
              echo "0 results";
          }

          ?>






  </div>
  <div class="tab-pane fade" id="dvd" role="tabpanel" aria-labelledby="contact-tab">
     <?php

          $sql4 = "SELECT * FROM media WHERE type='dvd'";
          $result4 = $conn->query($sql4);

          if ($result4->num_rows > 0) {
            echo '
            <main role="main" class="main">
              <div class="album py-5 " style="background-color: #ccc;">
                  <div class="container">
              <div class="row">
                    ';

              while($row4 = $result4->fetch_assoc()) {
                echo '
             
                 <div class="col-md-4">
                       <div class="card">
                    <img class="card-img-top" src='.$row4["image"].' alt="Card image cap" width="40px">
                    <div class="card-body">
                      <h5 class="card-title"> Title : '.$row4["title"].'</h5>
                      <p class="card-text">"'.$row4["description"].'"</p>
                    </div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item"> Iteme-number : '.$row4["fk_author_id"].'</li>
                      <li class="list-group-item"> Type : '.$row4["type"].'</li>
                      <li class="list-group-item"> ISBN : '.$row4["ISBN"].'</li>
                    </ul>
                    
                  </div>
                      </div>
                      ';
              }
                 echo "
                     </div>
                    </div>
                  </div>
                </main>";
           } else {
              echo "0 results";
          }

          ?>

 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>