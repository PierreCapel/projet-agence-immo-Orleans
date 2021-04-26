<?php

namespace App\Model;

use PDO;

class DocumentManager extends AbstractManager
{
    public const TABLE = 'justificatifs';

    public function modifyListDoc(array $listDoc)
    {
        //vide la table justificatifs
        $query = 'TRUNCATE TABLE ' . self::TABLE;
        $statement = $this->pdo->query($query);

        //ajout de la nouvelle liste
        foreach ($listDoc as $field => $value) {
            $query = 'INSERT INTO ' . self::TABLE . '(justificatifs) VALUES (:' . $field . ')';
            $statement = $this->pdo->prepare($query);
            $statement->bindValue(":$field", $value, PDO::PARAM_STR);
            $statement->execute();
        }
    }
}
