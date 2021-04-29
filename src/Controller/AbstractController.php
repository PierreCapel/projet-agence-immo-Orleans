<?php

/**
 * Created by PhpStorm.
 * User: root
 * Date: 11/10/17
 * Time: 15:38
 * PHP version 7
 */

namespace App\Controller;

use App\Model\BiensManager;
use Twig\Environment;
use Twig\Extension\DebugExtension;
use Twig\Loader\FilesystemLoader;

abstract class AbstractController
{
    /**
     * @var Environment
     */
    protected Environment $twig;

    /**
     *  Initializes this class.
     */
    public function __construct()
    {
        $loader = new FilesystemLoader(APP_VIEW_PATH);
        $this->twig = new Environment(
            $loader,
            [
                'cache' => !APP_DEV, // @phpstan-ignore-line
                'debug' => APP_DEV,
            ]
        );
        $this->twig->addExtension(new DebugExtension());
    }

    public function listAnnonce()
    {   
        $biensManager = new BiensManager();
        if (!empty($_GET)) {
            $besoin = $_GET['besoin'];
            if ($besoin === 'vente') {
                return $this->twig->render('Admin/listAnnonce.html.twig', [
                   'biens' => $this->biensManager->selectAllByCategory(3),
                ]);
            }
            if ($besoin === 'location') {
                return $this->twig->render('Admin/listAnnonce.html.twig', [
                   'biens' => $this->biensManager->selectAllByCategory(2),
                ]);
            }
        }
        return $this->twig->render('Admin/listAnnonce.html.twig', [
                'biens' => $biensManager->selectAll('id', 'DESC'),
            ]);
    }
}
