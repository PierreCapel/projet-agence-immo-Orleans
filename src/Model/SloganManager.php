<?php

namespace App\Model;

use PDO;

class SloganManager extends AbstractManager
{
    public const TABLE = 'slogan';

    public function modifyListSlogan(array $listSlogan)
    {
        //vide la table justificatifs
        $query = 'TRUNCATE TABLE ' . self::TABLE;
        $statement = $this->pdo->query($query);

        //ajout de la nouvelle liste
        foreach ($listSlogan as $field => $value) {
            $query = 'INSERT INTO ' . self::TABLE . '(slogan) VALUES (:' . $field . ')';
            $statement = $this->pdo->prepare($query);
            $statement->bindValue(":$field", $value, PDO::PARAM_STR);
            $statement->execute();
        }
    }
}
