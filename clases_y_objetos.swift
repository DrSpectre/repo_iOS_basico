
/**

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*/

struct CoordenadasInstituto{
    let instituto: String
    let edificio: String
    let salon: Int
    let detalles: String? = nil
}

let coordenadas_ficticias = CoordenadasInstituto(instituto: "IADA", edificio: "V1", salon: 107)
let coordenadas_ficticias_2 = CoordenadasInstituto(instituto: "IADA", edificio: "V1", salon: 107)

if (coordenadas_ficticias_2 == coordenadas_ficticias) {
    print("Si son iguales")
}
else {
    print("Son diferentes")
}

struct Carrera{
    let nombre: String
    let ubicacion_cordinacion: CoordenadasInstituto
    let instituto: String
}

class Estudihambre {
    var nombre: String
    var apellidos: String
    var matricula: Int
    var semestre: Double
    var carrera: Carrera
    var edad: Int
    
    
    init(_ nombre: String, _ apellidos: String, matricula matr: Int, semestre: Double, carrera: Carrera, edad: Int){
        self.nombre = nombre
        self.apellidos = apellidos
        
        matricula = matr
        self.semestre = semestre
        self.carrera = carrera
        self.edad = edad
        
        // print("nombre \(nombre)")
    }
    
    func tiene_hambre() -> String {
        return "Si, esta muerto de hambre"
    }
    
    func enviar_correo(mensaje: String) -> String{
        return "Eviar a \(nombre) el siguiente mensaje: \(mensaje)"
    }
}

/*
let estudihambre = Estudihambre("Armando", "Mendoza", matricula: 123456, semestre: 72.5, carrera: "DDMI", edad: 79)

print("El estudihambre es \(estudihambre.nombre)")
print(estudihambre.tiene_hambre())
print(estudihambre.enviar_correo(mensaje: "Si tienes hambre, pues compra comida. Si no tienes dinero, trabaja mi todo pobre"))
*/
