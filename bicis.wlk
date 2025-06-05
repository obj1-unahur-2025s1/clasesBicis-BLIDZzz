class Bici {
    const property rodado
    const property largo
    const property marca
    const property accesorios = []
    const property patente

    method agregarAccesorio(unAccesorio) {accesorios.add(unAccesorio)}
    method quitarAccesorio(unAccesorio) {accesorios.remove(unAccesorio)}
    method altura() = rodado * 2.5 * 15
    method velocidadCrucero() = if(largo>120) rodado+6 else rodado+2
    method carga() = accesorios.sum({x=>x.carga()})
    method peso() = (rodado/2) + accesorios.sum({x=>x.peso()})
    method tieneLuz() = accesorios.any({x=>x.esLuminoso()})
    method cantAccesoriosLivianos() = accesorios.filter({x=>x.peso() < 1})

    method initialize() {
        if(largo < 100){
            self.error(largo.toString() + " no es un largo válido")
        }
        if(not (patente.length() == 6)){
            self.error(patente.toString() + " no es una patente válida")
        }
        if(registroPatentes.patentes().contains(patente)){
            self.error(patente.toString() + " no es una patente válida")
        }
        registroPatentes.agregarPatente(patente)
    }
}

object registroPatentes {
    const property patentes = []
    method agregarPatente(unaPatente) {patentes.add(unaPatente)}
}

class Farolito {
    method peso() = 0.5
    method carga() = 0
    method esLuminoso() = true
}

class Canasto {
    const volumen
    method peso() = volumen/10
    method carga() = volumen/2
    method esLuminoso() = false

    method initialize() {
        if(not volumen.between(1, 20)){
            // self.error(volumen.toString() + " no es un volumen válido")
            throw new Exception(message = volumen.toString() + " no es un volumen válido")
        }
    }
}

class Morral {
    const largo
    const tieneOjoDeGato
    method peso() = 1.2
    method carga() = largo/3
    method esLuminoso() = tieneOjoDeGato
}

/*
Etapa 5)
Para agregar un nuevo tipo de accesorio, este debe entender los mensajes:
1 - peso (int)
2 - carga (int)
3 - esLuminoso (bool)
*/