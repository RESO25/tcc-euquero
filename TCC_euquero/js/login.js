const btnEntrar = document.querySelector("#btnEntrar");

btnEntrar.addEventListener('click', ExibirLogin);


const divLogin = document.getElementById("filho");

divLogin.style.visibility = "hidden";

function ExibirLogin() {
    event.preventDefault();
    if (divLogin.style.visibility == "hidden") {
        divLogin.style.visibility = "visible";

    }
    else {
        divLogin.style.visibility = "hidden";

    }
}


