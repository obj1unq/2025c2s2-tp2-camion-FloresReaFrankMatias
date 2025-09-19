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
	method todoPesoEsPar() {
		return cosas.all({cosa => cosa.pesoEsPar()})
	}
	method tieneUnaCosaConPeso(_peso) {
	  return cosas.any({cosa => cosa.peso() == _peso})
	}
	
	method pesoTotal() {
		return tara + cosas.sum({cosa => cosa.peso()})
	}
	method estaExcedidoDePeso() {
	  return self.pesoTotal() > pesoMaximoAceptable
	}
	method contieneAlgoConPeligrosidad(nivelPeligrosidad) {
	  return cosas.find({cosa => cosa.nivelDePeligrosidad() == nivelPeligrosidad})

	}





}
