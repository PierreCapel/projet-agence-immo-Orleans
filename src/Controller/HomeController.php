<?php

/**
 * Created by PhpStorm.
 * User: aurelwcs
 * Date: 08/04/19
 * Time: 18:40
 */

namespace App\Controller;

use App\Model\SloganManager;
use App\Model\BiensManager;

class HomeController extends AbstractController
{
    private BiensManager $biensManager;

    public function __construct()
    {
        parent::__construct();
        $this->biensManager = new BiensManager();
    }

    /**
     * Display home page
     */
    public function index()
    {
        $sloganManager = new SloganManager();
        $listSlogans = $sloganManager->selectAll();
        return $this->twig->render('Home/index.html.twig', [
            'listeBiens' => $this->biensManager->selectAll(2),
            'listSlogans' => $listSlogans,
        ]);
    }
    
    public function locations()
    {
        return $this->twig->render('Home/locations.html.twig', [
            'listeBiens' => $this->biensManager->selectAllByCategory(3),
        ]);
    }

    public function ventes()
    {
        return $this->twig->render('Home/ventes.html.twig', [
            'listeBiens' => $this->biensManager->selectAllByCategory(2),
        ]);
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
        $result = $this->getMensualite();
        return $this->twig->render('Home/annonce.html.twig', ['result' => $result]);
    }

    public function cgu()
    {
        return $this->twig->render('Home/cgu.html.twig');
    }

    public function mentionsLegales()
    {
        return $this->twig->render('Home/mentionsLegales.html.twig');
    }

    public function getMensualite()
    {
        $capital = 0;
        $nbYear = 0;
        $rate = 0;

        if (!empty($_GET)) {
            $capital = intval($_GET["capital"]);
            $nbYear = intval($_GET["nbYear"]);
            $rate = intval($_GET["rate"]);

            $month = $nbYear * 12;
            $interest = ($capital * $rate) / 100;

            $result = ($capital + $interest) / $month;
            return $result;
        }
    }
}
