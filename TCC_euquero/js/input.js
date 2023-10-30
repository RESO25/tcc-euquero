let numero = document.getElementById("lanceAtual").innerText;
numero = numero.substring(3);

numero = numero.replace('.', '');

let lanceGanhador = parseFloat(numero) + 50;
numero = lanceGanhador;

let aumentoLance = 5;

for (let i = 10; i < 1000000; i = i * 10) {
    if (lanceGanhador > i) {
        aumentoLance += 15;
    }
}

function less() {
    if (numero > lanceGanhador) {
        numero -= aumentoLance;
    }

    setValue(numero);
}

function more() {
    numero += aumentoLance;
    setValue(numero);
}

const inputLance = document.getElementById('main_txtLance');

function setValue(valor) {
    inputLance.value = valor;
}

setValue(numero);