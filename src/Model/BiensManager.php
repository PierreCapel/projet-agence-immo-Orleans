<?php

namespace App\Model;

use PDO;

class BiensManager extends AbstractManager
{
    public const TABLE = 'biens';

    public function add(array $post)
    {
        $fields = array_keys($post);
        $values = [];

        // Création des colonnes de la requêtes
        $query = "INSERT INTO " . self::TABLE . " (" . implode(',', $fields) . ") ";

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

    public function getLastAdd(): array
    {
        $query = "SELECT id FROM " . self::TABLE . " WHERE id=(SELECT Max(id) FROM biens)";
        $statement = $this->pdo->prepare($query);
        $statement->execute();

        return $statement->fetchAll();
    }

    public function selectAllByCategory(int $category)
    {
        $statement = $this->pdo->prepare("SELECT * FROM " . self::TABLE . " WHERE besoin_id = :category;");
        $statement->bindValue(':category', $category, PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetchAll();
    }
}
