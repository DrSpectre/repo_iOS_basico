
enum RolesJuegoEscondidas{
    case contando
    case buscando_escondite
    case escondido
    case buscando_jugadores
    case encontrado
    case suspendido /// Es el caso en que el juego vuelve a su estado original de inicio.
}

struct Ubicacion2Dimensiones{
    var x: Int
    var y: Int 
    
    init(_ x: Int, _ y: Int){
        self.x = x
        self.y = y
    }
}

class Personaje {
    var nombre: String
    var ubicacion: Ubicacion2Dimensiones
    
    init(_ nombre: String, ubicacion: Ubicacion2Dimensiones){
        self.nombre = nombre
        self.ubicacion = ubicacion
    }
    
}

class PersonajeJugable: Personaje{
    var visibilidad: Double
    var rol: RolesJuegoEscondidas = .suspendido
    /// var rol: RolesJuegoEscondidas = RolesJuegoEscondidas.suspendido
    
    init(_ nombre: String, visibilidad: Double, ubicacion: Ubicacion2Dimensiones){
        self.visibilidad = visibilidad
        super.init(nombre, ubicacion: ubicacion)
    }
}

let punto_de_inicio = Ubicacion2Dimensiones(1, 3)

var jugadores: [PersonajeJugable] = []

jugadores.append(PersonajeJugable("Pepito Bananas", visibilidad: 0.5, ubicacion: punto_de_inicio))
jugadores.append(PersonajeJugable("Wally", visibilidad: 0.1, ubicacion: punto_de_inicio))
jugadores.append(PersonajeJugable("Chuchito", visibilidad: 0.2, ubicacion: punto_de_inicio))
jugadores.append(PersonajeJugable("Anabelle", visibilidad: 0.9, ubicacion: punto_de_inicio))



