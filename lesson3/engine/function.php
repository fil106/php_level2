<?php

function DownloadImage()
{
if ($_POST['OneFile'])
{
	$flag = false;
	
	$uploaddir = UPLOAD_DIR;
	$uploaddsmalldir = UPLOAD_SMALL_DIR;
	$my_hash_file = hash_file('md5', $_FILES['myfile']['tmp_name']). '.'. end(explode(".", $_FILES['myfile']['name']));
	$my_file_name = $_FILES['myfile']['name'];
	$destination = $uploaddir .'/' . $my_hash_file; 
	$destination_small = $uploaddsmalldir . $my_hash_file;


	
	if (file_exists($destination)) 
		{
			echo "Файл $my_file_name уже загружен <br>";
			$sql = "SELECT * FROM `galery` WHERE hash_file = '$my_hash_file';";
			$result = getRowResult($sql);
			if ($result)
			{
				echo "Файл уже загружен и запись в БД так же существует <br>";
			}
		} 
	else 
		{
			echo "Файл $my_file_name не существует <br>";
		
			if (move_uploaded_file($_FILES['myfile']['tmp_name'],$destination)) 
				{ 
					echo "Файл успешно загружен <br>";
					
					
					$sql = "INSERT INTO `galery` (`id_galery`, `name_foto`, `hash_file`, `name_file`) VALUES (NULL, '$NameImg', '$my_hash_file', '$my_file_name')";
					executeQuery($sql);
					
					create_thumbnail($destination, $destination_small, 320, 320);
				} 
			else 
				{
				  echo "Произошла ошибка при загрузке файла.
					Некоторая отладочная информация:<br>";
					echo "<pre>";
					print_r($_FILES);
					echo "</pre>";
				}
		}
}

$sql = "Select * from galery ORDER BY view DESC";
return $galery = getAssocResult($sql);
}

function foto($id)
{
	$id = (int)($_GET['id']);	//Самый простой и достаточный способ защиты от sql инъекции. Какой бы параметр мы не получили, он в любом случае будет принудительно преобразован в число
	$sql = "Select * from galery where id_galery = '$id';";
	$galery = getAssocResult($sql);


	if ($galery) //Если получен результат, то увеличиваем количество просмотров на 1
	{
		$sql = "UPDATE galery SET `view` = `view` + 1 where id_galery = '$id'";
		executeQuery($sql);
		return $galery;
	}
	else
	{
		header('Location: http://php2-3-dz/?error');

		exit();
	}
}


?>