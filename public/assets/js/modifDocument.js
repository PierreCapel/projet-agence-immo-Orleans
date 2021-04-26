/**
 * ajouter un input
 */
const button = document.getElementById('monbouton');
const form = document.getElementById('monform');
let pTag = document.getElementsByClassName('mabalise');
let suppButton = document.getElementsByClassName('supp');

function addListenerDelete() {
    if (suppButton.length != 0) {
    for (let i = 0; i < suppButton.length; i++) {
        suppButton[i].addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation();
            console.log(e)
            suppButton[i].parentNode.parentNode.removeChild(pTag[i]);
            pTag = document.getElementsByClassName('mabalise');
            suppButton = document.getElementsByClassName('supp');
        }
        )
    }}};

    addListenerDelete();

button.addEventListener('click', (e) => {
    e.preventDefault();
    //création balise p
    const maNouvelleBalise = document.createElement('p');
    maNouvelleBalise.classList.add('mabalise');

    let newId = pTag.length + 1;

    //création balise input
    const newInput = document.createElement('input');
    newInput.type = "text";
    newInput.name = 'justificatifs' + newId;
    newInput.id = newId;
    newInput.classList.add('input-doc');

    //création balise a
    const newLink = document.createElement('a');
    newLink.classList.add("btn");
    newLink.classList.add("btn-primary");
    newLink.classList.add("supp");
    newLink.classList.add("ms-1");
    newLink.innerHTML = "Supprimer";

    //ajout balises input et a dans p
    maNouvelleBalise.appendChild(newInput);
    maNouvelleBalise.appendChild(newLink);

    //ajout p dans form 
    form.appendChild(maNouvelleBalise);
    pTag = document.getElementsByClassName('mabalise');
    suppButton = document.getElementsByClassName('supp');
    addListenerDelete();
});



