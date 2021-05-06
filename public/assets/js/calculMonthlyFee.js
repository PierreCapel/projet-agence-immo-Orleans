const capital = document.getElementById('capital');
const nbYear = document.getElementById('nbYear');
const rate = document.getElementById('rate');

const buttonCalcul = document.getElementById('getMensualites');

const pTag = document.getElementById('calcResult');

function calculMonthlyFee(capital, nbYear, rate) {
    let nbMonth = nbYear * 12;
    let interest = (capital * rate) / 100;

    let result = (Number(capital) + interest) / nbMonth;

    return result;
}

buttonCalcul.addEventListener('click', (e) => {
    e.preventDefault();
    let monthlyFee = calculMonthlyFee(capital.value, nbYear.value, rate.value);
    pTag.innerHTML = "Vos mensualités seront de <span class=\"text-primary fw-bolder fs-4\">" + Math.trunc(monthlyFee) + "</span> €.";

})