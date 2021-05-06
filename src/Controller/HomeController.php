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
use App\Model\MessagesManager;

class HomeController extends AbstractController
{
    private BiensManager $biensManager;
    private TypesManager $typesManager;
    private MessagesManager $messagesManager;

    public function __construct()
    {
        parent::__construct();
        $this->biensManager = new BiensManager();
        $this->typesManager = new TypesManager();
        $this->messagesManager = new MessagesManager();
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
            'listeBiens' => $this->biensManager->selectAllVisible('id', 'DESC', 9),
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
        $done = '';

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $post = $_POST;
            $post['date'] = date('Y-m-d G-i');

            $this->messagesManager->add($post);
            $done = 'yes';
        }

        return $this->twig->render('Home/contact.html.twig', [
            'done' => $done,
        ]);
    }

    public function annonce()
    {
        $this->setAnnonceId();
        $this->setImgFolder();
        $documentManager = new DocumentManager();

        $annonce = $this->biensManager->selectAllById($_GET['id']);

        return $this->twig->render('Home/annonce.html.twig', [
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
}
