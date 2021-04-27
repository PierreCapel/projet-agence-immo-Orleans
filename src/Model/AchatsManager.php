<?php

namespace App\Model;

use PDO;
class AchatsManager extends AbstractManager
{
    public function showSales()
    {
        $query = 'SELECT ville, titre, type_id, description, prix FROM bien WHERE categorie_id = 2;';
        return $this->pdo->query($query)->fetchAll();
    }
}