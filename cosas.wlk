	
object knightRider {
    method peso()                {  return 500  }
	method nivelDePeligrosidad() {  return 10   }
	method bultos()              {  return 1	}
	method accidentarse()        {  return null	}
}
object arenaAGranel {
	var  property  peso = 50
	
	method nivelDePeligrosidad() {  return 1                  }
	method pesoEsPar()           {  return self.peso().even() }
	method bultos()              {  return 1	              }
	method accidentarse()        {  peso = peso + 20	      }

}


object bumblebee {
	var property tranformacion = auto

	method peso()                   {  return 800                                   }
	method nivelDePeligrosidad()    {  return tranformacion.nivelDePeligrosidad()	}
	method estaTransformadoEn(algo) {  return tranformacion == algo	                }
	method pesoEsPar()              {  return self.peso().even()	                }
	method bultos()                 {  return  2	                                }
	method accidentarse()           {  tranformacion = tranformacion.cambiarModo()	}

}

object auto {

	method nivelDePeligrosidad() {  return 15    }
	method cambiarModo()         {  return robot }

}
object robot {
  method nivelDePeligrosidad() {  return 30   }
  method cambiarModo()         {  return auto }
}
//-------------------------
object paqueteDeLadrillos {
  var pesoLadrillo = 2
  var property  cantLadrillos = 0 

	method peso()                {	return pesoLadrillo * cantLadrillos	  }
	method nivelDePeligrosidad() {  return 2                              }
	method pesoEsPar()           {  return self.peso().even() 	          }
	method bultos()              {  return if(cantLadrillos <= 100) 1
                                             else if(cantLadrillos >= 101&& cantLadrillos <= 300) 2
			                               else 3		}
	method accidentarse()        {  cantLadrillos = (cantLadrillos - 12).max(0)	}

	
}


object bateriaAntiAerea {
	var property tieneMisiles = false 

	method peso()                {  return if (self.tieneMisiles()) 300    else 200 }
	method nivelDePeligrosidad() {  return if (self.tieneMisiles()) 100    else 0   }
	method pesoEsPar()           {  return self.peso().even()                       }             
	method bultos()              {  return if(tieneMisiles) 2              else 1	}
	method accidentarse()        {  tieneMisiles = false	                        }
	
}

object residuosRadioactivos {
	var property peso = 0

	method nivelDePeligrosidad() {  return 200                }
	method pesoEsPar()           {	return self.peso().even() }
	method bultos()              {	return 1	              }
	method accidentarse()        {  peso += 15                }
}


object contenedorPortuario {
  const  property  cosas = #{}

  method peso()                 			{  return 100 + self.sumaDeCosasContenidas()	                                 	  }
  method cargar(unaCosa)        			{  return cosas.add(unaCosa)                                                		  }
  method descargar(unaCosa)      			{  return cosas.remove(unaCosa) 													  }
  method sumaDeCosasContenidas() 			{  return cosas.sum({cosa => cosa.peso()})                                            }
  method nivelDePeligrosidad()   			{  return if (not cosas.isEmpty())  self.peligrosidadDeLaCosaMasPeligrosa()   else 0  }
  method peligrosidadDelasCosas()           {  return cosas.map({cosa => cosa.nivelDePeligrosidad()}) 							  }
  method peligrosidadDeLaCosaMasPeligrosa() {  return self.peligrosidadDelasCosas().max()										  }
  method bultos()                           {  return 1 + cosas.sum({cosa => cosa.bultos()}) 									  }
  method accidentarse()                     {  return cosas.forEach({cosa => cosa.accidentarse()})  							  }
}

object embalajeDeSeguridad {
	var cosaEmbalada = null

	method peso()                {  return cosaEmbalada.peso()                   } 
	method nivelDePeligrosidad() {  return cosaEmbalada.nivelDePeligrosidad() /2 }
	method embalar(unaCosa)      {  cosaEmbalada = unaCosa                       }
	method bultos()              {  return 2	                                 }
	method accidentarse()        {	return null	                                 }
}