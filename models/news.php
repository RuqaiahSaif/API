<?php
include('../db_config.php');
class News{
public $id;
public $news_title;
public $news_details;
public $news_image;
public $news_date;
public $id_cat;
public $database;
public $catogery;

function __construct(){

    $this->database=new DBconfig();
}


function getRow(){
    $pdo=$this->database->connect();
    $smt=$pdo->prepare("select * from news");
    
    $smt->execute();
   
   $rows=$smt->fetchAll(PDO::FETCH_OBJ);
  /* $data=array();
   foreach($rows as $row){
       $content['id']=$row->id;
       $content['title']=$row->news_title;
       $content['date']=$row->news_date;
       array_push($data,$content);
       
   }*/
   return $rows ;
     

}
function singleRow($id){
    $pdo=$this->database->connect();
    $smt=$pdo->prepare("select * from news where id=?");
    $smt->execute([$this->id]);
   
    $rows=$smt->fetchAll(PDO::FETCH_OBJ);
    return $rows;
     

}
function typeNews($catogery){

    $pdo=$this->database->connect();
    $smt=$pdo->prepare("select * FROM news WHERE id_cat IN(select id FROM `categories` WHERE category=?)");
    $smt->execute([$this->catogery]);
   
    $rows=$smt->fetchAll(PDO::FETCH_OBJ);
    return $rows;
     

}
function addRow(){
  try{  $pdo=$this->database->connect();
    $smt=$pdo->prepare('insert into news values(null,?,?,?,now(),?)');
    $smt->execute([$this->news_title,$this->news_image,$this->news_details,$this->id_cat]);
   return true;
}
    catch(Exception $e){  
        Echo " failed" . $e->getMessage(); 
        return false; 
        }  

}  
function updateRow($id){
   try{ 
       $pdo=$this->database->connect();
    $smt=$pdo->prepare("UPDATE news SET news_title=?, news_image=?,news_details=?, news_date=now(), id_cat=? WHERE id=?");
    $smt->execute([$this->news_title,$this->news_image,$this->news_details,$this->id_cat,$this->id]);
    return true;}
    catch(Exception $e){  
        Echo " failed" . $e->getMessage(); 
        return false; 
        } 

} 
function deleteRow($id){
  try{  $pdo=$this->database->connect();
    $smt=$pdo->prepare("DELETE FROM news WHERE id=?");
    $smt->execute([$this->id]);
    return true;}
    catch(Exception $e){  
        Echo " failed" . $e->getMessage(); 
        return false; 
        } 

}
public function catogeries_id($catogery){
    $pdo=$this->database->connect();
    $smt=$pdo->prepare("select id from categories where category=?");
    $smt->execute([$this->catogery]);
   $rows=$smt->fetchAll(PDO::FETCH_OBJ); 
   foreach($rows as $row){
       $content['id']=$row->id;
   }
   
   return $content['id'];
}
/*public function catogeries_name($id_cat){
    $pdo=$this->database->connect();
    $smt=$pdo->prepare("select category from categories where id=?");
    $smt->execute([$id_cat]);
   $rows=$smt->fetchAll(PDO::FETCH_OBJ); 
   return $rows;
}*/

}




?>