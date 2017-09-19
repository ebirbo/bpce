<?php

Class User extends CI_Model
{
	function login($user_email, $user_mdp) {
	
		$this -> db -> select('id, user_nom, user_prenom, user_email, user_mdp');
		$this -> db -> from('users');
		$this -> db -> where('user_email', $user_email);
		$this -> db -> where('user_mdp', MD5($user_mdp));
		$this -> db -> limit(1);

		$query = $this -> db -> get();

		if($query -> num_rows() == 1)
			return $query->result();
		else
			return false;
	}

	function effectuer_virement($user1, $user2,$montant)
	{
		$bdd = new PDO('mysql:host=http://e2r1p6.42.fr:8080/;dbname=bpce', 'root', 'root');
		$bdd->exec("set names utf8");

		$client=$bdd->prepare("SELECT * FROM client where id = $user1");
		$client->execute();
		while($c=$client->fetch(PDO::FETCH_ASSOC))
		{

			$solde1 = $c['solde'] +$c['decouverte'];

			if($solde1 >= $montant)
			{
				$client2=$bdd->prepare("SELECT * FROM client where id = $user2");
				$client2->execute();
				while($c2=$client2->fetch(PDO::FETCH_ASSOC))
				{
					$solde2 = $c2['solde'] + $montant;
					$solde1 = $solde1 - $montant;
				}
			}
			else
			{
				return False;
			}

			$sql = " UPDATE client 
				SET		
						solde = '$solde1'									
				WHERE  	id = '$user1' ";

			$result = $this->db->query($sql);
			$sql = " UPDATE client 
				SET		
						solde = '$solde2'									
				WHERE  	id = '$user2' ";

			$result = $this->db->query($sql);
				
		}
		return 1;
	}
	

	
	function insert_user()
	{
		$user_nom = strtoupper($this->input->post('user_nom'));
		$user_prenom = $this->input->post('user_prenom');
		$user_email = $this->input->post('user_email');
		$user_mdp = MD5($this->input->post('user_mdp'));
		
		$user_nom = str_replace("'", "''", $user_nom);
		$user_prenom = str_replace("'", "''", $user_prenom);
		
		$adresse_nouvelle = "SELECT id FROM users WHERE user_email='".$user_email."'";
		$resultat = $this->db->query ($adresse_nouvelle);
		$nombre_adresse =$resultat->num_rows();
		 if($nombre_adresse < 1)
		{
			$sql = " INSERT INTO users ( user_nom, user_prenom, user_email, user_mdp,droits,agence)
			Values ('" . $user_nom . "',
					'" . $user_prenom ."',
					'" . $user_email . "',
					'" . $user_mdp . "',
					'" . $droits . "',
					'" . $agence . "')";
			$result = $this->db->query($sql);
			return $user_prenom;
		}
		else
		{
			return False;
		}
	}

}

?>