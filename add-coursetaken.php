<?php
session_start();
error_reporting(0);
include('includes/config.php');


if(strlen($_SESSION['login'])=="")
    {   
    header("Location: index.php"); 
    }
    else{ 
$usernaming=$_SESSION['login'];



if(isset($_POST['submit']))
{
$subjectid=$_POST['subjectid'];
$roolid=$_POST['rollid'];
$attendance=$_POST['attendance']; 
$class_test=$_POST['class_test'];
$assignment=$_POST['assignment']; 
$mid_term=$_POST['mid_term']; 


$final=$_POST['final'];
$total=$attendance+$class_test+$assignment+$mid_term+$final; 

$status=1;
$sql="INSERT INTO  course_taken(SubjectId,StudentId,UserId,attendance,class_test,assignment,mid_term,final,total,status) VALUES(:subjectid,:roolid,:usernaming,:attendance,:class_test,:assignment,:mid_term,:final,:total,:status)";
$query = $dbh->prepare($sql);
$query->bindParam(':subjectid',$subjectid,PDO::PARAM_STR);
$query->bindParam(':roolid',$roolid,PDO::PARAM_STR);
$query->bindParam(':usernaming',$usernaming,PDO::PARAM_STR);
$query->bindParam(':attendance',$attendance,PDO::PARAM_STR);
$query->bindParam(':class_test',$class_test,PDO::PARAM_STR);
$query->bindParam(':assignment',$assignment,PDO::PARAM_STR);
$query->bindParam(':mid_term',$mid_term,PDO::PARAM_STR);
$query->bindParam(':final',$final,PDO::PARAM_STR);
$query->bindParam(':total',$total,PDO::PARAM_STR);
$query->bindParam(':status',$status,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$msg="Student info added successfully";
}
else 
{
$error="Something went wrong. Please try again";
}

}
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SMS Admin| Student Admission< </title>
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="css/select2/select2.min.css" >
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <script src="js/modernizr/modernizr.min.js"></script>
    </head>
    <body class="top-navbar-fixed">
        <div class="main-wrapper">

            <!-- ========== TOP NAVBAR ========== -->
  <?php include('includes/topbar.php');?> 
            <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
            <div class="content-wrapper">
                <div class="content-container">

                    <!-- ========== LEFT SIDEBAR ========== -->
                   <?php if($_SESSION['login']==6)include('includes/leftbar.php');else include('includes/leftbar_user.php') ?>  

                    <!-- /.left-sidebar -->

                    <div class="main-page">

                     <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-md-6">
                                    <h2 class="title">Student Admission</h2>
									
									
									
									
									
									
									
									
									
									
									
									
									
                                
                                </div>
                                
                                <!-- /.col-md-6 text-right -->
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-md-6">
                                    <ul class="breadcrumb">
                                        <li><a href="dashboard.php"><i class="fa fa-home"></i> Home</a></li>
                                
                                        <li class="active">Student Admission</li>
                                    </ul>
                                </div>
                             
                            </div>
                            <!-- /.row -->
                        </div>
                        <div class="container-fluid">
                           
                        <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel">
                                            <div class="panel-heading">
                                                <div class="panel-title">
                                                    <h5>Fill the Student info</h5>
                                                </div>
                                            </div>
                                            <div class="panel-body">
<?php if($msg){?>
<div class="alert alert-success left-icon-alert" role="alert">
 <strong>Well done!</strong><?php echo htmlentities($msg); ?>
 </div><?php } 
else if($error){?>
    <div class="alert alert-danger left-icon-alert" role="alert">
                                            <strong>Oh snap!</strong> <?php echo htmlentities($error); ?>
                                        </div>
                                        <?php } ?>
                                                <form class="form-horizontal" method="post">

												
												
<div class="form-group">
                                                        <label for="default" class="col-sm-2 control-label">Student Id</label>
                                                        <div class="col-sm-10">
 <select name="rollid" class="form-control" id="default" required="required">
<option value="">Student Id</option>
<?php $sql = "SELECT * from tblstudents";
$query = $dbh->prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{
foreach($results as $result)
{   ?>
<option value="<?php echo htmlentities($result->StudentId); ?>"><?php echo htmlentities($result->RollId); ?></option>
<?php }} ?>
 </select>
                                                        </div>
                                                    </div>
													
													
													
													
													<div class="form-group">
                                                        <label for="default" class="col-sm-2 control-label">Subject Id</label>
                                                        <div class="col-sm-10">
 <select name="subjectid" class="form-control" id="default" required="required">
<option value="">Course Code</option>

<?php 


$sql = "SELECT * from assigned_course join tblsubjects where assigned_course.course_id=tblsubjects.id and assigned_course.user_id=:usernaming and assigned_course.Status=1";
$query = $dbh->prepare($sql);
$query-> bindParam(':usernaming', $usernaming, PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{
foreach($results as $result)
{   ?>
<option value="<?php echo htmlentities($result->id); ?>"><?php echo htmlentities($result->SubjectName); ?></option>
<?php }} ?>
 </select>
                                                        </div>
                                                    </div>
													
													
													

<div class="form-group">
<label for="default" class="col-sm-2 control-label">Attendance</label>
<div class="col-sm-10">
<input type="number_format" name="attendance" class="form-control" id="attendance" autocomplete="off">
</div>
</div>


<div class="form-group">
<label for="default" class="col-sm-2 control-label">Class Test</label>
<div class="col-sm-10">
<input type="text" name="class_test" class="form-control" id="class_test"   autocomplete="off">
</div>
</div>


<div class="form-group">
<label for="default" class="col-sm-2 control-label">Assignment</label>
<div class="col-sm-10">
<input type="text" name="assignment" class="form-control" id="assignment"  autocomplete="off">
</div>
</div>

<div class="form-group">
<label for="default" class="col-sm-2 control-label">Mid Term</label>
<div class="col-sm-10">
<input type="text" name="mid_term" class="form-control" id="mid_term"  autocomplete="off">
</div>
</div>

<div class="form-group">
<label for="default" class="col-sm-2 control-label">Final</label>
<div class="col-sm-10">
<input type="text" name="final" class="form-control" id="final"  autocomplete="off">
</div>
</div>










                                                    
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" name="submit" class="btn btn-primary">Add</button>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.col-md-12 -->
                                </div>
                    </div>
                </div>
                <!-- /.content-container -->
            </div>
            <!-- /.content-wrapper -->
        </div>
        <!-- /.main-wrapper -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>
        <script src="js/prism/prism.js"></script>
        <script src="js/select2/select2.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            $(function($) {
                $(".js-states").select2();
                $(".js-states-limit").select2({
                    maximumSelectionLength: 2
                });
                $(".js-states-hide").select2({
                    minimumResultsForSearch: Infinity
                });
            });
        </script>
    </body>
</html>
<?PHP } ?>
