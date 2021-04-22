<?php

namespace App\Model;

use App\Model\Connection;
use PDO;

class AdminManager extends AbstractManager
{
    public function addGoods(array $post) {
        $query ="INSERT INTO bien(adresse,complement,code_postal,ville,categorie_id,type_id,est_vide,etat_id,residence,duplex,ascenseur,surface,etage,disponibilité,besoin_id,charge,caution,loyer,prix,entree,sejour,salon,double_vitrage,volets_roulants,gardien,calme,ensoleille,chambre,revetement_id,logia,cave,grenier,sous_sol,cellier,balcon,cheminee,piscine,interphone,digicode,cuisine_id,terrase,cour,cour_close,jardin_clos,parking,garage,local_velo,chauffage_id,dpe_c_id,dpe_e_id,description)
                VALUES(adresse,complement,code_postal,city,categorie,type,est_vide,etat,residence,duplex,ascenseur,surface,etage,dispo,besoin,charges,caution,loyer,prix,entre,sejour,salon,d-vitrage,v-roulant,gardien,calme,ensoleille,chambre,revetement,logia,cave,grenier,sous-s,cellier,balcon,cheminee,piscine,interphone,digicode,cuisine,terrase,cour,cour_c,jardin,jardin_c,parking,garage,velo,type-chauffage,dpe-c,dpe-e,description)";
        $statement = $this->connection->prepare($query);
        return $statement->execute();
    }
}
