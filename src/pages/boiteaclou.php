<?php
$nom=$_POST['nom'];
$idee=$_POST['idee'];

if($nom!='' && $idee!='') {
	$str=file_get_contents("boiteaclou.json");
	$arr=json_decode($str);
	$arr[]=[nom => $nom, idee => $idee];
	$str=json_encode($arr);
	file_put_contents("boiteaclou.json", $str);
	?>
	<span class="succes">Message envoyé avec succès!</span>
	<?php
}
?>

<h2>Boite questions/idées</h2>
<form action="boiteaclou.php" method="POST">
	<span>
		<label for="nom">Nom</label>
		<input type="text" name="nom" id="nom" />
	</span>
	<label for="idee">Idée</label>
	<textarea name="idee" id="idee"></textarea>
	<input type="submit" value="Envoyer" />
</form>
