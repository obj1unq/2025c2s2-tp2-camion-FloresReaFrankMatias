object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}




object arenaAGranel {
	var  property  peso = 50
	
	method nivelPeligrosidad() { return 1 }
	method pesoEsPar() {
	  return self.peso() % 2 ==0
	}
}


object bumblebee {
	var property tranformacion = null
	method peso() { return 800 }
	method nivelDePeligrosidad() {
		return if (self.estaTransformadoEn(auto)) 15
               else if (self.estaTransformadoEn(robot))  30
               else 0
	}

	method estaTransformadoEn(algo) {
	  return tranformacion == algo
	}
	method pesoEsPar() {
	  return self.peso() % 2 ==0
	}
}
object paqueteDeLadrillos {
  var pesoLadrillo = 2
  var property  cantLadrillos = 0 
	method peso() {
		return pesoLadrillo * cantLadrillos
  	}
	method nivelDePeligrosidad() {
	  return 2
	}
	method pesoEsPar() {
	  return self.peso() % 2 ==0
	}

}


object bateriaAntiAerea {
	var property tieneMisiles = false 
	method peso() {
	  return if (self.tieneMisiles()) 300
	         else 200
	}
	method nivelDePeligrosidad() {
	  return if (self.tieneMisiles()) 100
	         else 0
	}
	
	method pesoEsPar() {
	  return self.peso() % 2 ==0
	}
}

object residuosRadioactivos {
	var property peso = 0
	method nivelDePeligrosidad() {
	  return 200
	}
	method pesoEsPar() {
	  return self.peso() % 2 ==0
	}
}



object auto {
  
}
object robot {
  
}