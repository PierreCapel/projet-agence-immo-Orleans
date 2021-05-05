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
use App\Model\MessagesManager;

class MessagesController extends AdminController
{
    private MessagesManager $messagesManager;

    public function __construct()
    {
        parent::__construct();
        $this->messagesManager = new MessagesManager();
    }
    /**
     * Display home page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */

    public function messages()
    {
        $this->startSession();
        $this->authorizeAccess();
        $this->logout();

        return $this->twig->render('Admin/messages.html.twig', [
            'messages' => $this->messagesManager->selectAll(),
        ]);
    }

    public function supprimerMessage()
    {
        $this->startSession();
        $this->authorizeAccess();
        $this->logout();

        $id = $_GET['id'];

        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            $this->messagesManager->delete($id);
        }

        header('Location: ' . $_SERVER['HTTP_REFERER']);
    }
}
