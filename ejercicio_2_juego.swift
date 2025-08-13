
//let arreglo = []

let numeros_2: [Int] = []

print(type(of: numeros))
print(type(of: numeros_2))

for numero in numeros {
    print(numero)
    // Aqui hacemos algo con el elemento
}

var edad = 19

if edad > 20 {
    print("Puede votar y puede tomar alcohol")
}
else if edad > 17 {
    print("Puede votar y no puede tomar alcohol")
}
else {
    print("NO puede ni tomar ni votar")
}

var cantidad_de_autos = 0
let maxima_cantidad_de_autos = 10

while cantidad_de_autos < maxima_cantidad_de_autos{
    cantidad_de_autos += 1
    print("La cantidad de autos estacionados actual es \(cantidad_de_autos)")
}
var numero_loco = 13 // Entrada de un usario

switch numero_loco{
    case 10:
        print("Es un numero loco")
    case 11, 12, 13:
        print("Estan en la lista de locos...creo")
    default:
        print("NO se que sea")
}
var ejecutar_bucle = true

while ejecutar_bucle {
    print("hola mundo (2)")
    if 10 > 9 {
        ejecutar_bucle = false
    }
    print("hola mundo _ 2 (2)")
}

while true{
    print("hola mundo")
    if 10 > 9 {
        break
    }
    print("hola mundo _ 2")
}


// Ecsogo y guardo un numero aleatorio
// Creo una variable de intentos y la inicializo en 0
// Imprimo las reglas al usuario

// Iniciamos un game loop
// Pregunto por un numero al usuario
// verifico si es el numero aleatorio
//        Si es: entonces le digo al usuario que gano e imprimo la cantidad de intentos
//               Rompo el game loop

// Continuo el juego indicando si es mayor o menor el numero
// Aumento la cantidad de intentos en uno





















