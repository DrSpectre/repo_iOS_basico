

enum RolesJuegoEscondidas{
    case contando
    case buscando_jugadores

    
    case buscando_escondite
    case escondido
    case regresando_a_base
    case encontrado
    
    case cantar_victoria
    case suspendido /// Es el caso en que el juego vuelve a su estado original de inicio.
}

protocol JugadorDeEscondidas{
    var rol: RolesJuegoEscondidas { get set }
    
    func actualizar() -> Bool
    
    func establecer_rol(_ rol_nuevo: RolesJuegoEscondidas) -> Bool
}

extension JugadorDeEscondidas where Self: PersonajeJugable { /// Al parecer un protocol se instancia como un struct y no puede mutar el tipo de dato a menos que tenga modificado que aplciara a un tipo en especifico
    func establecer_rol(_ rol_nuevo: RolesJuegoEscondidas) -> Bool {
        switch(self.rol){
            case .suspendido: 
                self.rol = rol_nuevo
                return true
            
            case .cantar_victoria, .encontrado: 
                if rol_nuevo == .suspendido {
                    self.rol = rol_nuevo
                    return true
                }
                return false
                
                
            default: 
                return false
        }
        
    }
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

class PersonajeJugable: Personaje, JugadorDeEscondidas{
    var visibilidad: Double
    var rol: RolesJuegoEscondidas = .suspendido
    /// var rol: RolesJuegoEscondidas = RolesJuegoEscondidas.suspendido
    
    init(_ nombre: String, visibilidad: Double, ubicacion: Ubicacion2Dimensiones){
        self.visibilidad = visibilidad
        super.init(nombre, ubicacion: ubicacion)
    }
    
    func actualizar() -> Bool{
        return false
    }
}

func iniciar_juego(jugadores: [JugadorDeEscondidas]) {
    let numero_del_jugador_que_busca = Int.random(in: 0..<jugadores.count)
    var jugador_que_busca: JugadorDeEscondidas = jugadores[numero_del_jugador_que_busca]
    
    jugador_que_busca.establecer_rol(.contando)
    
    for jugador in jugadores {
        if jugador.rol == .suspendido{
            jugador.establecer_rol(.buscando_escondite)
        }
    }
    
    for jugador in jugadores{
        print("El rol del jugador es \(jugador.rol)")
    }
    
    // print("el numero del jugador es \(jugador_que_busca)")
}

let punto_de_inicio = Ubicacion2Dimensiones(1, 3)

var jugadores: [PersonajeJugable] = []

jugadores.append(PersonajeJugable("Pepito Bananas", visibilidad: 0.5, ubicacion: punto_de_inicio))
jugadores.append(PersonajeJugable("Wally", visibilidad: 0.1, ubicacion: punto_de_inicio))
jugadores.append(PersonajeJugable("Chuchito", visibilidad: 0.2, ubicacion: punto_de_inicio))
jugadores.append(PersonajeJugable("Anabelle", visibilidad: 0.9, ubicacion: punto_de_inicio))

iniciar_juego(jugadores: jugadores)
