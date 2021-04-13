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
        return $this->twig->render('Admin/loggin.html.twig');
    }
    public function index()
    {
        return $this->twig->render('Admin/index.html.twig');
    }
    public function modifAnnonce()
    {
        return $this->twig->render('Admin/modifAnnonce.html.twig');
    }
    public function ajoutAnnonce()
    {
        return $this->twig->render('Admin/ajoutAnnonce.html.twig');
    }
    public function modifSlogan()
    {
        return $this->twig->render('Admin/modifSlogan.html.twig');
    }
    public function modifDocument()
    {
        return $this->twig->render('Admin/modifDocument.html.twig');
    }
}
