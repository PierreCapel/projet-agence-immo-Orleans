<?php

namespace App\Model;

use PDO;

class AdminManager extends AbstractManager
{
    public function addGoods(array $post)
    {
        $fields = array_keys($post);
        $values = [];

        // Création des colonnes de la requêtes
        $query = "INSERT INTO bien (" . implode(',', $fields) . ") ";

        foreach ($fields as $field) {
            $values[] = ":$field";
        }

        // Ajout des valeurs à la requête
        $query .= "VALUES (" . implode(',', $values) . ")";

        $statement = $this->pdo->prepare($query);

        foreach ($post as $field => $value) {
            $statement->bindValue(":$field", $value, is_int($value) ? PDO::PARAM_INT : PDO::PARAM_STR);
        }

        return $statement->execute();
    }

    public function getListDoc()
    {
        $query = 'SELECT * FROM justificatifs';
        $statement = $this->pdo->query($query);
        $list = $statement->fetchAll(PDO::FETCH_ASSOC);

        return $list;
    }

    public function modifyListDoc(array $listDoc)
    {
        //vide la table justificatifs
        $query = 'TRUNCATE TABLE `justificatifs`';
        $statement = $this->pdo->query($query);

        //ajout de la nouvelle liste
        foreach ($listDoc as $field => $value) {
            $query = 'INSERT INTO justificatifs(justificatifs) VALUES (:' . $field . ')';
            $statement = $this->pdo->prepare($query);
            $statement->bindValue(":$field", $value, PDO::PARAM_STR);
            $statement->execute();
        }
    }
}
