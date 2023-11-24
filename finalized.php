<?php
session_start();
error_reporting(0);
include('includes/config.php');


if(strlen($_SESSION['login'])=="")
    {   
    header("Location: index.php"); 
    }
    else{ 

$stid=intval($_GET['stid']);


$sql = "SELECT * from course_taken  where id=:stid";
$query = $dbh->prepare($sql);
$query->bindParam(':stid',$stid,PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
foreach($results as $result)
{
$StudentId=$result->StudentId;
$SubjectId=$result->SubjectId;
$total=$result->total;
echo $total;
echo $stid;



$sql2="INSERT INTO  tblresult(StudentId,SubjectId,marks) VALUES(:StudentId,:SubjectId,:total)";
$query2 = $dbh->prepare($sql2);
$query2->bindParam(':StudentId',$StudentId,PDO::PARAM_STR);
$query2->bindParam(':SubjectId',$SubjectId,PDO::PARAM_STR);

$query2->bindParam(':total',$total,PDO::PARAM_STR);

$query2->execute();
}
$sql3="update course_taken set Status=0 where id=:stid ";
$query3 = $dbh->prepare($sql3);
$query3->bindParam(':stid',$stid,PDO::PARAM_STR);
$query3->execute();
 header("Location: manage-coursetaken.php");
        
   
}


?>