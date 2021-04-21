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
        return $this->twig->render('admin/loggin.html.twig');
    }
    public function index()
    {
        return $this->twig->render('admin/index.html.twig');
    }
    public function modifAnnonce()
    {
        return $this->twig->render('admin/modifannonce.html.twig');
    }
    public function ajoutAnnonce()
    {
        return $this->twig->render('admin/ajoutannonce.html.twig');
    }
    public function modifSlogan()
    {
        return $this->twig->render('admin/modifslogan.html.twig');
    }
    public function modifDocument()
    {
        return $this->twig->render('admin/modifdocument.html.twig');
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

        return $this->twig->render('admin/ajoutphoto.html.twig', [
            'imageUrl' => $imageUrl,
            'error' => $error,
        ]);
    }

    // fonction d'ajout des images par formulaire 
    private function upload()
    {
        //check methode serveur
        if ($_SERVER["REQUEST_METHOD"] === "POST" && (!empty($_FILES))) {
            //set dossier reception
            $uploadDir = __DIR__ . "/../../public/assets/images/uploads/";

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
            
            return '/assets/images/uploads/' . basename($_FILES['pictureUpload']['name']);
        }
    }
}
