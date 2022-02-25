const searchNumber = (n, numbers) => {

    for(let number of numbers){
        if(number === n) return "Numero encontrado en la coleccion"
    }
    return "Numero no encontrado en la coleccion"
}

const numbers = [2, 4, 77, 5, 65, 8, 1];
console.log(searchNumber(654, numbers))