const addButton = document.getElementById('add-button');
const form = document.getElementById('my-form');
let pTag = document.getElementsByClassName('input-area');
let suppButton = document.getElementsByClassName('supp');

let id = pTag.length;

addButton.addEventListener('click', (e) => {
    e.preventDefault();
    //création balise p
    const newInputarea = document.createElement('p');
    newInputarea.classList.add('input-area');
    newInputarea.classList.add('d-flex');
    newInputarea.classList.add('align-items-center');


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
    newInputarea.appendChild(newTextArea);
    newInputarea.appendChild(newLink);

    //ajout p dans form 
    form.appendChild(newInputarea);


    newLink.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        console.log(e)
        newLink.parentNode.parentNode.removeChild(newInputarea);
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

