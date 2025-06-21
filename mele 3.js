// compito.mele.js

const giorniSettimana = ["Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato", "Domenica"];

let mele = 5;
let giorno = 0; // Lunedì, 1° del mese

while (mele > 2) {
    const giornoCorrente = giorniSettimana[giorno % 7];

    if (giornoCorrente !== "Mercoledì") {
        mele--; // Mangia una mela
        console.log(`${giornoCorrente}: Mangio una mela. Mele rimaste: ${mele}`);
    } else {
        console.log(`${giornoCorrente}: Non mangio la mela.`);
    }

    giorno++; // Passa al giorno successivo
}
console.log("Ho finito le mele!");

