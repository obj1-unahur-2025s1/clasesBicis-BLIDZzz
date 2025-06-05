import bicis.*

class Deposito {
    const property bicis

    method agregarBicis(listaBicis) {
        if(listaBicis.any( {x => bicis.contains(x)} )){
            // self.error(listaBicis + " una Bici ya está en el depósito")
            throw new Exception(message = "No se puede agregar 2 veces")
        }
        if(listaBicis.any({x=>listaBicis.ocurrencesOf(x) > 1})){
            self.error("Hay Bicis duplicadas entre las nuevas bicis")
        }
    }

    method bicisRapidas() = bicis.filter({x=>x.velocidadCrucero() > 25})
    method marcas() = bicis.map({x=>x.marca()}).asSet()
    method esNocturno() = bicis.all({x=>x.tieneLuz()})
    method tieneParaLlevar(unPeso) = bicis.any({x=>x.carga() >= unPeso})
    method marcaMasRapida() = bicis.max({x=>x.velocidadCrucero()}).marca()
    method cargaTotalBicisLargas() = self.bicisDeLargo(170).sum({x=>x.carga()})
    method bicisDeLargo(unLargo) = bicis.filter({x=>x.largo() > unLargo})
    method cantBicisSinAccesorios() = bicis.count({x=>x.accesorios().isEmpty()})
    






    method bicisCompañeras(unaBici) = self.bicisLargoSimilar(unaBici, self.bicisDeMarca(unaBici.marca()))

    method bicisSinLaBici(listaBicis, unaBici) = listaBicis.filter({x=> not (x.patente() == unaBici.patente())})

    method bicisDeMarca(unaMarca) = bicis.filter({x=>x.marca() == unaMarca})

    method bicisLargoSimilar(unaBici, listaBicis) = listaBicis.filter({x=>x.largo().between(unaBici.largo() - 10, unaBici.largo() + 10) and x != unaBici})

    method hayCompañeras() = bicis.map({x=> self.bicisCompañeras(x)}).any({x=>not x.isEmpty()})









    method todasLasCompañeras() = bicis.map({x=>self.posiblesParejas(x)}).asSet().asList()

    method posiblesParejas(unaBici) = self.bicisCompañeras(unaBici).map({x=>self.formarPareja(x, unaBici)})

    method formarPareja(unaBici, otraBici) = [unaBici, otraBici]
}