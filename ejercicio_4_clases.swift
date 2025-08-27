

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


protocol JugadorDeEscondidas: class{
    var rol: RolesJuegoEscondidas { get set }
    
    func actualizar() -> Bool
    
    func establecer_rol(_ rol_nuevo: RolesJuegoEscondidas) -> Bool
}



extension JugadorDeEscondidas { /// Al parecer un protocol se instancia como un struct y no puede mutar el tipo de dato a menos que tenga modificado que aplciara a un tipo en especifico
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

class UbicacionFisica{
    var nombre: String
    var lugares_cercanos: [UbicacionFisica]
    
    init(_ nombre: String, lugares_cercanos: [UbicacionFisica]){
        self.nombre = nombre
        self.lugares_cercanos = lugares_cercanos
    }
    
    func agregar_lugar(_ lugar: UbicacionFisica) -> Bool{
        for ubicacion in lugares_cercanos{
            if ubicacion.nombre == lugar.nombre{
                return false
            }
        }
        
        lugar.lugares_cercanos.append(self)
        self.lugares_cercanos.append(lugar)
        return true
    }
}

class Personaje {
    var nombre: String
    var ubicacion: UbicacionFisica?
    
    init(_ nombre: String){
        self.nombre = nombre
        self.ubicacion = nil
    }
    
    func establecer_ubicacion(_ nueva_ubicacion: UbicacionFisica) -> Bool{
        if ubicacion == nil{
            self.ubicacion = nueva_ubicacion
            return true
        }
        
        if ubicacion!.nombre == nueva_ubicacion.nombre{
            return false
        }
        
        ubicacion = nueva_ubicacion
        return true
    }
    
}

class PersonajeJugable: Personaje, JugadorDeEscondidas{
    var visibilidad: Double
    var rol: RolesJuegoEscondidas = .suspendido
    
    var numero_contado: Int
    /// var rol: RolesJuegoEscondidas = RolesJuegoEscondidas.suspendido
    
    init(_ nombre: String, visibilidad: Double){
        self.visibilidad = visibilidad
        numero_contado = 0
        super.init(nombre)
    }
    
    func actualizar() -> Bool{
        switch(rol){
            case .contando:
                self.contar_para_buscar()
            
            case .buscando_jugadores:
                //self.cambiar_ubicacion()
                //self.identificar_jugadores()
                print("Todo")
                
            case .cantar_victoria, .suspendido:
                //self.haz_nada()
                print("TODO")
            
            default:
                print("todo")
        }
        return false
    }
    
    func contar_para_buscar(){
        numero_contado += 1
        print("Soy \(nombre) y voy en el \(numero_contado)")
        
        if numero_contado > 10{
            self.rol = .buscando_jugadores
        }
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

    // print("el numero del jugador es \(jugador_que_busca)")
}

let punto_de_inicio = Ubicacion2Dimensiones(1, 3)

var jugadores: [PersonajeJugable] = []

jugadores.append(PersonajeJugable("Pepito Bananas", visibilidad: 0.5))
jugadores.append(PersonajeJugable("Wally", visibilidad: 0.1))
jugadores.append(PersonajeJugable("Chuchito", visibilidad: 0.2))
jugadores.append(PersonajeJugable("Anabelle", visibilidad: 0.9))

let loby = UbicacionFisica("Loby")
let oficina = UbicacionFisica("Oficina")
let sala_de_estar = UbicacionFisica("Sala de estar")
let salon = UbicacionFisica("Salon")
let baños = UbicacionFisica("Baños")

loby.agregar_lugar(sala_de_estar)

loby.agregar_lugar(oficina)


var ubicaciones_juego [UbicacionFisica] = []
ubicaciones_juego.append(loby)


iniciar_juego(jugadores: jugadores)

for jugador in jugadores{
    print("El rol de \(jugador.nombre) es \(jugador.rol)")
}


/// Aqui tenemos la parte de auto juego
var ciclo_actual = 0

while true {
    for jugador in jugadores{
        jugador.actualizar()
    }
    
    for jugador in jugadores{
        print("El rol de \(jugador.nombre) es \(jugador.rol)")
    }
   
   ciclo_actual += 1 
   if ciclo_actual > 25{
       break
   }
}



