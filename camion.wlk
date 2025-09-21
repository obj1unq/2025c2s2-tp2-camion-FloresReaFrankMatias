import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
	const pesoMaximoAceptable = 2500

	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	method descargar(unaCosa) {
	  self.validarDescarga(unaCosa)
	  cosas.remove(unaCosa)
	}
	method validarCarga(cosa) {
	  if( cosas.contains(cosa)){
		self.error("El camion ya contiene a" + cosa)
	  }
	}

	method validarDescarga(cosa) {
	  if(not cosas.contains(cosa)){
		self.error("El camion no contiene a" + cosa)
	  }
	}
	method todoPesoEsPar()                                {  return cosas.all({cosa => cosa.pesoEsPar()})      }
	method tieneUnaCosaConPeso(_peso)                     {  return cosas.any({cosa => cosa.peso() == _peso})  }
	method pesoTotal()                                    {  return tara + cosas.sum({cosa => cosa.peso()})    }
	method estaExcedidoDePeso()                           {  return self.pesoTotal() > pesoMaximoAceptable     }
	method contieneAlgoConPeligrosidad(nivelPeligrosidad) {  return cosas.find({cosa => cosa.nivelDePeligrosidad() == nivelPeligrosidad})               }
	method cosasConPeligrosidadMayorA(peligrosidad)       {  return cosas.filter({cosa => cosa.nivelDePeligrosidad() > peligrosidad})                   }
	method cosasMasPeligrosasqQueLaCosa(otraCosa)         {  return cosas.filter({cosa => cosa.nivelDePeligrosidad() > otraCosa.nivelDePeligrosidad()}) }

	method puedeCircularEnRuta(peligrosidadMaxima) {
	  return not self.estaExcedidoDePeso() &&
	     self.cosasConPeligrosidadMayorA(peligrosidadMaxima).isEmpty()
	}
	//Tiene algo entre dos valores
	method tieneAlgoQuePesaEntre(pesoMin,pesoMax) { return cosas.any { cosa => cosa.peso() >= pesoMin && cosa.peso() <= pesoMax }	}
	//Cosa Mas pesada
	method cosaMasPesada() {
		self.validarCosaMasPesada()
		return cosas.max({cosa => cosa.peso()})
	}
	method validarCosaMasPesada() {
		if (cosas.isEmpty()) {
			self.error("no se puede calcular la cosa más pesada")
		}
	}
	//Pesos
	method pesosDeTodasLasCosas() {  return cosas.map({ cosa => cosa.peso()  })             }
	//Total Bultos                
	method totalBultos()          {  return cosas.sum({cosa => cosa.bultos() })             }
	//Accidente                   
	method accidentar()           {  return cosas.forEach({ cosa => cosa.accidentarse() })	}
	//Transporte
	method transportar(destino, camino) {
		self.validarCamino(camino)
	 	almacen.almacenarCosas(cosas) 
		cosas.clear()
	}
	method validarCamino(camino) {
	  if(not camino.soportaViajeDe(self) ){ 
		self.error("No se puede transportar por el camino" +" " + camino)
	  }
	}
	
}
//---------------------------        ALMACEN    -------------------------------------------
object almacen {
  const  cosas = #{}

	method almacenarCosas(cosasAAlmacenar) {  return cosas.addAll(cosasAAlmacenar) 	}
	method cosas()                         {  return cosas                          }
	method almacenar(cosa)                 {  return cosas.add(cosa)	            }

}

//------------Posible Caminos 
object caminosVecinales {
	var property pesoMaximoPermitido = 0
	
	method nivelPeligrosidadPermitido() {  return 100											}	
	method soportaViajeDe(vehiculo)     {  return vehiculo.pesoTotal() <= pesoMaximoPermitido	}
}
object ruta9 {
	 
	method nivelPeligrosidadPermitido() { return 20																	}
	method soportaViajeDe(vehiculo)     { return  vehiculo.puedeCircularEnRuta(self.nivelPeligrosidadPermitido())	}
}

