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
        $biens = $biensManager->selectAll('id', 'DESC');
        $besoin = isset($_GET['besoin']) ? $_GET['besoin'] : "all";

        if ($besoin) {
            if ($besoin === 'vente') {
                $biens = $biensManager->selectAllByCategory(2);
            }

            if ($besoin === 'location') {
                $biens = $biensManager->selectAllByCategory(3);
            }
        }

        return $this->twig->render('Admin/listAnnonce.html.twig', [
            'besoin' => $besoin,
            'biens' => $biens,
        ]);
    }

    public function startSession()
    {
        session_start();
        session_regenerate_id();
    }

    public function authorizeAccess()
    {
        if (!isset($_SESSION['usermail'])) {
            header('Location: /admin/loggin');
        }
    }

    public function logout()
    {
        if (!empty($_GET['logout'])) {
            $_SESSION['logout'] = $_GET['logout'];
        }
        if (isset($_SESSION['logout']) && $_SESSION['logout'] === 'true') {
            session_destroy();
            header('Location: /admin/loggin');
        }
    }

    public function login()
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
