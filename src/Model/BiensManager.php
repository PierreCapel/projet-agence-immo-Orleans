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
        $query = "SELECT id FROM " . self::TABLE . " ORDER BY ID DESC LIMIT 0, 1";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':id', $this->pdo->lastInsertId(), PDO::PARAM_INT);
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
    public function upDate(array $post, int $id)
    {
         // Création de la requêtes
        $query = "UPDATE " . self::TABLE . " SET ";
        $count = 0;
        // Ajout des collones à modifier ansi que leur nouvelle valeurs à la requête
        foreach ($post as $field => $value) {
            if ($count !== (count($post) - 1)) {
                $query .= "$field = '$value' , ";
                $count += 1;
            } else {
                $query .= "$field = '$value' ";
            }
        }

        // Ajout de la condition pour modifier
        $query .= "WHERE id = :id";

        $statement = $this->pdo->prepare($query);

        $statement->bindValue(':id', $id, PDO::PARAM_INT);

        return $statement->execute();
    }

    public function del(int $id)
    {
        $query = "DELETE FROM " . self::TABLE . " WHERE id = :id";

        $statement = $this->pdo->prepare($query);

        $statement->bindValue(":id", $id, PDO::PARAM_INT);

        return $statement->execute();
    }
    /**
     * Mets à jour la photo par défault d'un bien
     */
    public function updateMainPicture(int $idBien, string $pictureName): bool
    {
        $statement = $this->pdo->prepare("UPDATE " . self::TABLE .
            " SET photo_principale = :photo_principale WHERE id = :id;");
        $statement->bindValue(':id', $idBien, PDO::PARAM_INT);
        $statement->bindValue(':photo_principale', $pictureName);

        return $statement->execute();
    }

    public function selectAllById(int $id): array
    {
        $query = "SELECT 
                    b.*, 
                    type.libelle AS type, 
                    categorie.libelle AS categorie, 
                    etat.libelle AS etat,
                    chauffage.libelle AS chauffage,
                    cuisine.libelle AS cuisine,
                    revetement.libelle AS revetement,
                    besoin.libelle AS besoin
                FROM biens b 
                
                INNER JOIN types type ON b.type_id = type.types_id 
                INNER JOIN types categorie ON b.categorie_id = categorie.types_id 
                INNER JOIN types etat ON b.etat_id = etat.types_id
                INNER JOIN types chauffage ON b.chauffage_id = chauffage.types_id
                INNER JOIN types cuisine ON b.cuisine_id = cuisine.types_id 
                INNER JOIN types revetement ON b.revetement_id = revetement.types_id
                INNER JOIN types besoin ON b.besoin_id = besoin.types_id 
                
                WHERE id = :id;";

        $statement = $this->pdo->prepare($query);

        $statement->bindValue(':id', $id, PDO::PARAM_INT);

        $statement->execute();

        return $statement->fetch();
    }

    public function searchByCriteria(array $criteriaUser)
    {
        $location = $criteriaUser['location'];

        $endQueryByPrice = $this->searchSubcriteriaPrice($criteriaUser);
        $endQueryByRoom = $this->searchSubcriteriaRoom($criteriaUser);
        $endQueryBySize = $this->searchSubcriteriaSize($criteriaUser);

        $query = "SELECT * FROM " . self::TABLE . " WHERE besoin_id=" . $criteriaUser['besoin'];
        if ($criteriaUser['type'] !== '*') {
            $query .= " AND categorie_id=" . $criteriaUser['type'];
        }

        if ($criteriaUser['location'] !== '') {
            $query .= " AND ville LIKE '%$location%'";
        }

        if ($endQueryByPrice !== '') {
            $query .= $endQueryByPrice;
        }
        if ($endQueryByRoom !== '') {
            $query .= $endQueryByRoom;
        }
        if ($endQueryBySize !== '') {
            $query .= $endQueryBySize;
        }
        echo $query;
        return $this->pdo->query($query)->fetchAll(PDO::FETCH_ASSOC);
    }

    private function searchSubcriteriaPrice(array $subcriteria)
    {
        $priceCriteria = '';

        if ($subcriteria['prixMin'] !== '') {
            if ($subcriteria['besoin'] == 2) {
                $priceCriteria .= " AND prix >= " . $subcriteria['prixMin'];
            } elseif ($subcriteria['besoin'] == 3) {
                $priceCriteria .= " AND loyer >= " . $subcriteria['prixMin'];
            }
        }

        if ($subcriteria['prixMax'] !== '') {
            if ($subcriteria['besoin'] == 2) {
                $priceCriteria .= " AND prix <= " . $subcriteria['prixMax'];
            } elseif ($subcriteria['besoin'] == 3) {
                $priceCriteria .= " AND loyer <= " . $subcriteria['prixMax'];
            }
        }

        return $priceCriteria;
    }

    private function searchSubcriteriaRoom(array $subcriteria)
    {
        $roomCriteria = '';

        if ($subcriteria['roomMin'] !== '') {
            $roomCriteria .= " AND piece >= " . $subcriteria['roomMin'];
        }
        if ($subcriteria['roomMax'] !== '') {
            $roomCriteria .= " AND piece <= " . $subcriteria['roomMax'];
        }

        return $roomCriteria;
    }

    private function searchSubcriteriaSize(array $subcriteria)
    {
        $sizeCriteria = '';

        if ($subcriteria['sizeMin'] !== '') {
            $sizeCriteria .= " AND surface >= " . $subcriteria['sizeMin'];
        }
        if ($subcriteria['sizeMax'] !== '') {
            $sizeCriteria .= " AND surface <= " . $subcriteria['sizeMax'];
        }

        return $sizeCriteria;
    }
}
