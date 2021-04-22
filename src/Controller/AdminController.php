<?php

/**
 * Created by PhpStorm.
 * User: aurelwcs
 * Date: 08/04/19
 * Time: 18:40
 */

namespace App\Controller;

use Exception;

class AdminController extends AbstractController
{
    /**
     * Display home page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */

    public function loggin()
    {
        $this->startSession();
        $this->login();
        return $this->twig->render('Admin/loggin.html.twig');
    }
    public function index()
    {
        $this->startSession();
        $this->authorizeAccess();
        $this->logout();
        return $this->twig->render('Admin/index.html.twig');
    }
    public function modifAnnonce()
    {
        $this->startSession();
        return $this->twig->render('Admin/modifAnnonce.html.twig');
    }
    public function ajoutAnnonce()
    {
        $this->startSession();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            
            $post = [];

            $post['adresse'] = $_POST['adresse'];
            $post['complement'] = $_POST['complement'];
            $post['code_postal'] = $_POST['code_postal'];
            $post['city'] = $_POST['city'];

            if ($_POST['categorie'] === 'Appartement/maison') {
                $post['categorie'] = '';
            } else {
                $post['categorie'] = $_POST['categorie'];
            }

            if ($_POST['type'] === 'Type') {
                $post['type'] = '';
            } else {
                $post['type'] = $_POST['type'];
            }

            $post['est_vide'] = $_POST['est_vide'];

            if ($_POST['etat'] === 'Etat') {
                $post['etat'] = '';
            } else {
                $post['etat'] = $_POST['etat'];
            }

            if (isset($_POST['residence'])) {
                $post['residence'] = $_POST['residence'];
            } else {
                $post['residence'] = 'non';
            }

            if (isset($_POST['duplex'])) {
                $post['duplex'] = $_POST['duplex'];
            } else {
                $post['duplex'] = 'non';
            }

            if (isset($_POST['ascenseur'])) {
                $post['ascenseur'] = $_POST['ascenseur'];
            } else {
                $post['ascenseur'] = 'non';
            }

            $post['surface'] = $_POST['surface'];
            $post['etage'] = $_POST['etage'];
            $post['dispo'] = $_POST['dispo'];
            
            if ($_POST['besoin'] === 'Achat ou location') {
                $post['besoin'] = '';
            } else {
                $post['besoin'] = $_POST['besoin'];
            }

            $post['charges'] = $_POST['charges'];
            $post['caution'] = $_POST['caution'];
            $post['loyer'] = $_POST['loyer'];
            $post['prix'] = $_POST['prix'];

            if (isset($_POST['entre'])) {
                $post['entre'] = $_POST['entre'];
            } else {
                $post['entre'] = 'non';
            }

            if (isset($_POST['sejour'])) {
                $post['sejour'] = $_POST['sejour'];
            } else {
                $post['sejour'] = 'non';
            }

            if (isset($_POST['salon'])) {
                $post['salon'] = $_POST['salon'];
            } else {
                $post['salon'] = 'non';
            }

            if (isset($_POST['d-vitrage'])) {
                $post['d-vitrage'] = $_POST['d-vitrage'];
            } else {
                $post['d-vitrage'] = 'non';
            }

            if (isset($_POST['v-roulant'])) {
                $post['v-roulant'] = $_POST['v-roulant'];
            } else {
                $post['v-roulant'] = 'non';
            }

            if (isset($_POST['gardien'])) {
                $post['gardien'] = $_POST['gardien'];
            } else {
                $post['gardien'] = 'non';
            }

            if (isset($_POST['calme'])) {
                $post['calme'] = $_POST['calme'];
            } else {
                $post['calme'] = 'non';
            }

            if (isset($_POST['ensoleille'])) {
                $post['ensoleille'] = $_POST['ensoleille'];
            } else {
                $post['ensoleille'] = 'non';
            }

            $post['chambre'] = $_POST['chambre'];

            if (isset($_POST['revetement'])) {
                $post['revetement'] = $_POST['revetement'];
            } else {
                $post['revetement'] = '';
            }

            if (isset($_POST['logia'])) {
                $post['logia'] = $_POST['logia'];
            } else {
                $post['logia'] = 'non';
            }

            if (isset($_POST['cave'])) {
                $post['cave'] = $_POST['cave'];
            } else {
                $post['cave'] = 'non';
            }

            if (isset($_POST['grenier'])) {
                $post['grenier'] = $_POST['grenier'];
            } else {
                $post['grenier'] = 'non';
            }

            if (isset($_POST['sous-s'])) {
                $post['sous-s'] = $_POST['sous-s'];
            } else {
                $post['sous-s'] = 'non';
            }

            if (isset($_POST['cellier'])) {
                $post['cellier'] = $_POST['cellier'];
            } else {
                $post['cellier'] = 'non';
            }

            if (isset($_POST['balcon'])) {
                $post['balcon'] = $_POST['balcon'];
            } else {
                $post['balcon'] = 'non';
            }

            if (isset($_POST['cheminee'])) {
                $post['cheminee'] = $_POST['cheminee'];
            } else {
                $post['cheminee'] = 'non';
            }

            if (isset($_POST['piscine'])) {
                $post['piscine'] = $_POST['piscine'];
            } else {
                $post['piscine'] = 'non';
            }

            if (isset($_POST['interphone'])) {
                $post['interphone'] = $_POST['interphone'];
            } else {
                $post['interphone'] = 'non';
            }

            if (isset($_POST['digicode'])) {
                $post['digicode'] = $_POST['digicode'];
            } else {
                $post['digicode'] = 'non';
            }

            if ($_POST['cuisine'] === 'Type de cuisine') {
                $post['cuisine'] = '';
            } else {
                $post['cuisine'] = $_POST['cuisine'];
            }

            if (isset($_POST['terrase'])) {
                $post['terrase'] = $_POST['terrase'];
            } else {
                $post['terrase'] = 'non';
            }

            if (isset($_POST['cour'])) {
                $post['cour'] = $_POST['cour'];
            } else {
                $post['cour'] = 'non';
            }

            if (isset($_POST['cour_c'])) {
                $post['cour_c'] = $_POST['cour_c'];
            } else {
                $post['cour_c'] = 'non';
            }

            if (isset($_POST['jardin'])) {
                $post['jardin'] = $_POST['jardin'];
            } else {
                $post['jardin'] = 'non';
            }

            if (isset($_POST['jardin_c'])) {
                $post['jardin_c'] = $_POST['jardin_c'];
            } else {
                $post['jardin_c'] = 'non';
            }

            if (isset($_POST['parking'])) {
                $post['parking'] = $_POST['parking'];
            } else {
                $post['parking'] = 'non';
            }

            if (isset($_POST['garage'])) {
                $post['garage'] = $_POST['garage'];
            } else {
                $post['garage'] = 'non';
            }

            if (isset($_POST['velo'])) {
                $post['velo'] = $_POST['velo'];
            } else {
                $post['velo'] = 'non';
            }

            if ($_POST['type-chauffage'] === 'Type de chauffage') {
                $post['type-chauffage'] = '';
            } else {
                $post['type-chauffage'] = $_POST['type-chauffage'];
            }

            if ($_POST['dpe-c'] === 'DPE-Consommation') {
                $post['dpe-c'] = '';
            } else {
                $post['dpe-c'] = $_POST['dpe-c'];
            }

            if ($_POST['dpe-e'] === 'DPE-Emission') {
                $post['dpe-e'] = '';
            } else {
                $post['dpe-e'] = $_POST['dpe-e'];
            }

            $post['description'] = $_POST['description'];

            var_dump($_POST);
            var_dump($post);
        }

        return $this->twig->render('Admin/ajoutAnnonce.html.twig');
    }
    public function modifSlogan()
    {
        $this->startSession();
        return $this->twig->render('Admin/modifSlogan.html.twig');
    }
    public function modifDocument()
    {
        $this->startSession();
        return $this->twig->render('Admin/modifDocument.html.twig');
    }
    public function ajoutPhoto()
    {
        $error = '';
        $imageUrl = '';

        try {
            $imageUrl = $this->upload();
        } catch (Exception $e) {
            $error = $e->getMessage();
        }

        return $this->twig->render('Admin/ajoutphoto.html.twig', [
            'imageUrl' => $imageUrl,
            'error' => $error,
            'id' => $_GET['id'],
        ]);
    }
    // fonction d'ajout des images par formulaire
    private function upload()
    {
        //check methode serveur
        if ($_SERVER["REQUEST_METHOD"] === "POST" && (!empty($_FILES))) {
            //recup id de l'annonce via $_GET
            if (!empty($_GET)) {
                $annonceId = $_GET['id'];
            } else {
                $annonceId = '';
            }
            //creer dossier pour image si non existant
            if (!is_dir(__DIR__ . "/../../public/assets/images/annonces/" . $annonceId)) {
                mkdir((__DIR__ . "/../../public/assets/images/annonces/" . $annonceId . "/"));
            }
                //creer fichier .gitkeep
            if (!is_file(__DIR__ . "/../../public/assets/images/annonces/" . $annonceId . "/.gitkeep")) {
                    touch(__DIR__ . "/../../public/assets/images/annonces/" . $annonceId . "/.gitkeep");
            }
            //set dossier reception
            $uploadDir = __DIR__ . "/../../public/assets/images/annonces/" . $annonceId . "/";

            //recup extension fichier
            $extension = pathinfo($_FILES['pictureUpload']['name'], PATHINFO_EXTENSION);

            //set chemin destination fichier
            $uploadFile = $uploadDir . basename($_FILES['pictureUpload']['name']);

            //set liste d'extensions
            $extensionsOk = ['jpg', 'jpeg', 'png'];

            //check extension du fichier vs extensions autorisées
            if (!in_array($extension, $extensionsOk)) {
                throw new Exception('L\'image doit etre de type jpeg, jpg ou png');
            }

            move_uploaded_file($_FILES['pictureUpload']['tmp_name'], $uploadFile);

            return '/assets/images/annonces/' . $annonceId . '/' . basename($_FILES['pictureUpload']['name']);
        }
    }

    private function startSession()
    {
        session_start();
        session_regenerate_id();
    }

    private function authorizeAccess()
    {
        if (!isset($_SESSION['usermail'])) {
            header('Location: /admin/loggin');
        }
    }

    private function logout()
    {
        if (!empty($_GET['logout'])) {
            $_SESSION['logout'] = $_GET['logout'];
        }
        if (isset($_SESSION['logout']) && $_SESSION['logout'] === 'true') {
            session_destroy();
            header('Location: /admin/loggin');
        }
    }

    private function login()
    {
        if (isset($_SESSION["usermail"])) {
            header('Location: /admin/index');
        }
        define('EMAIL', 'masteragence@gmail.com');
        define('PASSWORD', 'test');
        if (!empty($_POST)) {
            $usermail = $_POST['usermail'];
            $password = $_POST['password'];

            if ($usermail === EMAIL && $password === PASSWORD) {
                $_SESSION['usermail'] = $usermail;
                header('location: /admin/index');
            }
        }
    }
}
