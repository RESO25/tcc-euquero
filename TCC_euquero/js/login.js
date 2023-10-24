const btnEntrar = document.querySelector(".btnEntrar");
//const btnDarLance = document.querySelector("#btnDarLance");
btnEntrar.addEventListener('click', ExibirLogin);


const divLogin = document.getElementById("filho");

divLogin.style.visibility = "hidden";
//btnDarLance.addEventListener('click', ExibirLogin);

function ExibirLogin() {
    event.preventDefault();
    if (divLogin.style.visibility == "hidden") {
        divLogin.style.visibility = "visible";

    }
    else {
        divLogin.style.visibility = "hidden";

    }
}

function BemVindo() {
    const email = document.getElementById("email").textContent;
    if (email != null)
    {
        btnEntrar.style.visibility = "hidden";
        const text = document.querySelector("#bemvindo");
        const nome = document.getElementById("nome").textContent;
        text.innerText = "Bem vindo " + nome ; 
    }

}

BemVindo();
//const body = document.getElementsByTagName("body");
//body.addEventListener('click', FecharLogin);

//function FecharLogin() {
//    event.preventDefault();
//    divLogin.style.visibility = "hidden";
//}
