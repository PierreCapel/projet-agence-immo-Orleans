<?php

namespace App\Model;

use PDO;

class DocumentManager extends AbstractManager
{
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
