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
use App\Model\DocumentManager;
use App\Model\TypesManager;

class HomeController extends AbstractController
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
     */
    public function index()
    {
        $sloganManager = new SloganManager();
        $listSlogans = $sloganManager->selectAll();

        return $this->twig->render('Home/index.html.twig', [
            'listSlogans' => $listSlogans,
            'listeBiens' => $this->biensManager->selectAll('id', 'DESC', 9),
            'categories' => $this->typesManager->getByTypes('categorie'),
            'besoins' => $this->typesManager->getByTypes('besoin'),
            'topAnnonces' => $this->biensManager->getTopAnnonces(),
        ]);
    }

    public function search()
    {
        $searchResults = $this->biensManager->searchByCriteria($_GET);

        return $this->twig->render('Home/search.result.html.twig', [
            'categories' => $this->typesManager->getByTypes('categorie'),
            'besoins' => $this->typesManager->getByTypes('besoin'),
            'biens' => $searchResults,
        ]);
    }

    public function locations()
    {
        return $this->twig->render('Home/locations.html.twig', [
            'listeBiens' => $this->biensManager->selectAllByCategory(3),
            'categories' => $this->typesManager->getByTypes('categorie'),
            'besoins' => $this->typesManager->getByTypes('besoin'),
        ]);
    }

    public function ventes()
    {
        return $this->twig->render('Home/ventes.html.twig', [
            'listeBiens' => $this->biensManager->selectAllByCategory(2),
            'categories' => $this->typesManager->getByTypes('categorie'),
            'besoins' => $this->typesManager->getByTypes('besoin'),
        ]);
    }

    public function agence()
    {
        return $this->twig->render('Home/agence.html.twig', [
            'categories' => $this->typesManager->getByTypes('categorie'),
            'besoins' => $this->typesManager->getByTypes('besoin'),
        ]);
    }

    public function contact()
    {
        return $this->twig->render('Home/contact.html.twig', [
            'categories' => $this->typesManager->getByTypes('categorie'),
            'besoins' => $this->typesManager->getByTypes('besoin'),
        ]);
    }

    public function annonce()
    {
        $this->setAnnonceId();
        $this->setImgFolder();
        $documentManager = new DocumentManager();

        $annonce = $this->biensManager->selectAllById($_GET['id']);
        $result = $this->getMensualite();

        return $this->twig->render('Home/annonce.html.twig', [
        'result' => $result,
        'bien' => $annonce,
        'images' => $this->getImgFolderContent(),
        'documents' => $documentManager->selectAll(),
        'categories' => $this->typesManager->getByTypes('categorie'),
        'besoins' => $this->typesManager->getByTypes('besoin'),
        ]);
    }

    public function cgu()
    {
        return $this->twig->render('Home/cgu.html.twig', [
            'categories' => $this->typesManager->getByTypes('categorie'),
            'besoins' => $this->typesManager->getByTypes('besoin'),
        ]);
    }

    public function mentionsLegales()
    {
        return $this->twig->render('Home/mentionsLegales.html.twig', [
            'categories' => $this->typesManager->getByTypes('categorie'),
            'besoins' => $this->typesManager->getByTypes('besoin'),
        ]);
    }

    public function getMensualite()
    {
        $capital = 0;
        $nbYear = 0;
        $rate = 0;

        if (!empty($_GET['capital'])) {
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
