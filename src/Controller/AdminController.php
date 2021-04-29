<?php

/**
 * Created by PhpStorm.
 * User: aurelwcs
 * Date: 08/04/19
 * Time: 18:40
 */

namespace App\Controller;

use Exception;
use DirectoryIterator;
use App\Model\DocumentManager;
use App\Model\BiensManager;
use App\Model\TypesManager;
use App\Model\SloganManager;

class AdminController extends AbstractController
{
    private BiensManager $biensManager;
    private TypesManager $typesManager;

    public function __construct()
    {
        parent::__construct();
        $this->biensManager = new BiensManager();
        $this->typesManager = new TypesManager();
    }
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

    // --------------- Fonctions annonces -----------------------

    public function ajoutAnnonce()
    {
        $this->startSession();
        $this->authorizeAccess();
        $this->logout();

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

            $post['date'] = date('Y-m-d');

            $this->biensManager->add($post);
            header('Location: /admin/annonceAjouter');
        }

        return $this->twig->render('Admin/ajoutAnnonce.html.twig', [
            'nd' => $this->typesManager->getByTypes('nd'),
            'besoins' => $this->typesManager->getByTypes('besoin'),
            'categories' => $this->typesManager->getByTypes('categorie'),
            'types' => $this->typesManager->getByTypes('type'),
            'etats' => $this->typesManager->getByTypes('etat'),
            'chauffages' => $this->typesManager->getByTypes('chauffage'),
            'cuisines' => $this->typesManager->getByTypes('cuisine'),
            'revetements' => $this->typesManager->getByTypes('revetement'),
        ]);
    }
    public function modifAnnonce()
    {
        $this->startSession();
        $this->authorizeAccess();
        $this->logout();

        $id = $_GET['id'];

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $post = $_POST;
            $this->biensManager->upDate($post, $id);
            header('Location: listAnnonce');
        }

        return $this->twig->render('Admin/modifAnnonce.html.twig', [
            'bien' => $this->biensManager->selectOneById($id),
        ]);
    }

    public function supprimerAnnonce()
    {
        $this->startSession();
        $this->authorizeAccess();
        $this->logout();

        $id = $_GET['id'];

        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            $this->biensManager->del($id);
            $this->deleteDirectory(realpath(__DIR__ . '/../../public/assets/images/annonces/' . $id));
        }

        return $this->twig->render('Admin/supprimerAnnonce.html.twig');
    }

    // ------------------------------------------------------------------------------------

    public function modifSlogan()
    {
        $this->startSession();
        $this->authorizeAccess();
        $this->logout();

        $sloganManager = new SloganManager();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $newlistSlogan = $_POST;
            $sloganManager->modifyListSlogan($newlistSlogan);
        }

        $listSlogans = $sloganManager->selectAll();

        return $this->twig->render('Admin/modifSlogan.html.twig', ['listSlogans' => $listSlogans]);
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
            if (!empty($_POST['setAsMain'])) {
                $uploadFile = $uploadDir . 'main.jpg';
            } else {
                $uploadFile = $uploadDir . basename($_FILES['pictureUpload']['name']);
            }

            //set liste d'extensions
            $extensionsOk = ['jpg', 'jpeg', 'png'];

            //check extension du fichier vs extensions autorisées
            if (!in_array($extension, $extensionsOk)) {
                throw new Exception('L\'image doit etre de type jpeg, jpg ou png');
            }

            move_uploaded_file($_FILES['pictureUpload']['tmp_name'], $uploadFile);

            return '/assets/images/annonces/' . $annonceId . '/' . basename($uploadFile);
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
        $this->startSession();
        $this->authorizeAccess();
        $this->logout();
        
        return $this->twig->render('Admin/annonceAjouter.html.twig', [
            'id' => $this->biensManager->getLastAdd(),
        ]);
    }

    private function deleteDirectory($path)
    {
        try {
            $iterator = new DirectoryIterator($path);

            foreach ($iterator as $fileinfo) {
                if ($fileinfo->isDot()) {
                    continue;
                }

                if ($fileinfo->isDir()) {
                    if ($this->deleteDirectory($fileinfo->getPathname())) {
                        rmdir($fileinfo->getPathname());
                    }
                }

                if ($fileinfo->isFile()) {
                    unlink($fileinfo->getPathname());
                }
            }

            rmdir($path);
        } catch (Exception $e) {
            return false;
        }

        return true;
    }
}
