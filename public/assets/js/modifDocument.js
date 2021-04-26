/**
 * ajouter un input
 */
const button = document.getElementById('monbouton');
const form = document.getElementById('monform');
let pTag = document.getElementsByClassName('mabalise');
let suppButton = document.getElementsByClassName('supp');

let id = pTag.length;

button.addEventListener('click', (e) => {
    e.preventDefault();
    //création balise p
    const maNouvelleBalise = document.createElement('p');
    maNouvelleBalise.classList.add('mabalise');
    maNouvelleBalise.classList.add('d-flex');
    maNouvelleBalise.classList.add('align-items-center');


    //création balise input
    id += 1;
    const newTextArea = document.createElement('textarea');
    newTextArea.type = "text";
    newTextArea.name = 'justificatifs' + id;
    newTextArea.id = id;
    newTextArea.rows = "1";
    newTextArea.classList.add('textarea-doc');

    //création balise a
    const newLink = document.createElement('a');
    newLink.classList.add("btn");
    newLink.classList.add("btn-primary");
    newLink.classList.add("supp");
    newLink.classList.add("ms-1");
    newLink.innerHTML = "Supprimer";

    //ajout balises input et a dans p
    maNouvelleBalise.appendChild(newTextArea);
    maNouvelleBalise.appendChild(newLink);

    //ajout p dans form 
    form.appendChild(maNouvelleBalise);


    newLink.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        console.log(e)
        newLink.parentNode.parentNode.removeChild(maNouvelleBalise);
    }
    )
    
});

for (let i = 0; i < suppButton.length; i++) {
    suppButton[i].addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        console.log(e)
        suppButton[i].parentNode.parentNode.removeChild(pTag[i]);
    }
    )
};

