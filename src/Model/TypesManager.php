<?php

namespace App\Model;

use PDO;

class TypesManager extends AbstractManager
{   
    public const TABLE = 'types';
    
    public function getByTypes(string $type):array
    {
        $query = "SELECT * FROM " . self::TABLE . " WHERE type = :type";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(":type" , $type);
        $statement->execute();

        return $statement->fetchAll();
    }
}
