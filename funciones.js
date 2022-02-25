const numbers = [1, 65, 35, 77, 3, 2, 88, 94];

const ascendingOrder = (a, b) => {
    return a - b
}

const descendingOrder = (a, b) => {
    return b - a
}

// Orden ascendente

console.log(numbers.sort(ascendingOrder))

// Orden descendente

console.log(numbers.sort(descendingOrder))




