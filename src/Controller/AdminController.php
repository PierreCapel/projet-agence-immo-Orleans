<?php

/**
 * Created by PhpStorm.
 * User: aurelwcs
 * Date: 08/04/19
 * Time: 18:40
 */

namespace App\Controller;

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

    private function startSession()
    {
        session_start();
    }

    private function authorizeAccess()
    {
        if (!isset($_SESSION['usermail'])) {
            header('Location: /admin/loggin');
        }
    }

    private function logout()
    {
        if (isset($_SESSION['logout']) && $_SESSION['logout'] === true) {
            $_SESSION = array();
            session_destroy();
            unset($_SESSION);
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
