<?php

/**
 * Created by PhpStorm.
 * User: aurelwcs
 * Date: 08/04/19
 * Time: 18:40
 */

namespace App\Controller;

class HomeController extends AbstractController
{
    /**
     * Display home page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function index()
    {
        return $this->twig->render('Home/index.html.twig');
    }
    public function locations()
    {
        return $this->twig->render('Home/locations.html.twig');
    }
    public function ventes()
    {
        return $this->twig->render('Home/ventes.html.twig');
    }
    public function agence()
    {
        return $this->twig->render('Home/agence.html.twig');
    }
    public function contact()
    {
        return $this->twig->render('Home/contact.html.twig');
    }
    public function annonce()
    {
        return $this->twig->render('Home/annonce.html.twig');
    }
    public function cgu()
    {
        return $this->twig->render('Home/cgu.html.twig');
    }
    public function mentionsLegales()
    {
        return $this->twig->render('Home/mentionsLegales.html.twig');
    }
}
