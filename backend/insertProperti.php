<?php

if($_SERVER["REQUEST_METHOD"]=="POST"){
	require 'koneksi.php';
	inputProperti();
}

function inputproperti()
{
	global $connect;

	$properti_nama = $_POST["properti_nama"];
	$properti_jumlah = $_POST["properti_jumlah"];
	$properti_status = $_POST["properti_status"];
	$tgl_input = $_POST["tgl_input"];

	$query = "insert into t_properti(properti_nama,properti_jumlah,properti_status,tgl_input) values ('$properti_nama','$properti_jumlah','$properti_status','$tgl_input');";

	mysqli_query($connect, $query) or die (mysqli_error($connect));
	mysqli_close($connect);
}