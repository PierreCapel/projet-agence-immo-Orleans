<?php

/**
 * Created by PhpStorm.
 * User: aurelwcs
 * Date: 08/04/19
 * Time: 18:40
 */

namespace App\Controller;

use Exception;
use App\Model\DocumentManager;
use App\Model\BiensManager;
use App\Model\TypesManager;

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
        $this->authorizeAccess();
        $this->logout();

        $biensManager = new BiensManager();
        $typesManager = new TypesManager();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $post = $_POST;

            // Champs checkbox du formulaire
            $choices = [
                'residence',
                'duplex',
                'ascenseur',
                'entree',
                'sejour',
                'salon',
                'double_vitrage',
                'volets_roulants',
                'gardien',
                'calme',
                'ensoleille',
                'logia',
                'cave',
                'grenier',
                'sous_sol',
                'cellier',
                'balcon',
                'cheminee',
                'piscine',
                'interphone',
                'digicode',
                'terrasse',
                'cour',
                'cour_close',
                'jardin',
                'jardin_clos',
                'parking',
                'garage',
                'local_velo',
            ];

            // Pour chaque checkbox,  on stocke la valeur si checkée, sinon 'non'
            foreach ($choices as $choice) {
                $post[$choice] = isset($_POST[$choice]) ? $_POST[$choice] : 'non';
            }

            $biensManager->add($post);
            header('Location: /admin/annonceAjouter');
        }

        return $this->twig->render('Admin/ajoutAnnonce.html.twig', [
            'nd' => $typesManager->getByTypes('nd'),
            'besoins' => $typesManager->getByTypes('besoin'),
            'categories' => $typesManager->getByTypes('categorie'),
            'types' => $typesManager->getByTypes('type'),
            'etats' => $typesManager->getByTypes('etat'),
            'chauffages' => $typesManager->getByTypes('chauffage'),
            'cuisines' => $typesManager->getByTypes('cuisine'),
            'revetements' => $typesManager->getByTypes('revetement'),
        ]);
    }
    public function modifSlogan()
    {
        $this->startSession();
        return $this->twig->render('Admin/modifSlogan.html.twig');
    }
    public function modifDocument()
    {
        $this->startSession();
        $this->authorizeAccess();
        $this->logout();
        $documentManager = new DocumentManager();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $newlistDoc = $_POST;
            $documentManager->modifyListDoc($newlistDoc);
        }
        $listDocs = $documentManager->selectAll();
        return $this->twig->render('Admin/modifDocument.html.twig', ["lists" => $listDocs]);
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

    public function annonceAjouter()
    {
        $biensManager = new BiensManager();

        return $this->twig->render('Admin/annonceAjouter.html.twig', [
            'id' => $biensManager->getLastAdd(),
        ]);
    }
}
