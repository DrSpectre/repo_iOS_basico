
var lista = 1...100

for numero in lista{
    print(numero)
}

print("Numero aleatorio \(0...100)")


func validar_entrada_a_numero() -> Int{
    var entrada_del_usuario: String? = nil
    var numero_valido: Int? = nil
    
    while true{
        print("Por favor introduce un numero")
        entrada_del_usuario = readLine()
        
        if entrada_del_usuario == nil {
            print("Que paso mi hacker, creias que habia una vulnerabilidad")
        }
        
        numero_valido = Int(entrada_del_usuario!)
        
        if numero_valido == nil {
            print("Lo que introdujistes no fue un numero entero, por favor usa numeros y no letras.")
        }
        else {
            return numero_valido!
        }
        
    }
}

var respuesta_del_usuario = validar_entrada_a_numero()



