import MarcasYJarras.*
import Carpas.*

class Personas{
	
	var property peso = 0
	var property gustaMusicaTradicional = false
	var property nivelDeAguante = 0
	var property jarrasQueCompro = []

	
	// REQUERIMIENTOS 1
	
	method nuevaJarra(jarra){
		jarrasQueCompro.add(jarra)
	}
	
	method jarrasCompradas(){
		return jarrasQueCompro.size()
	}
	
	method totalDeAlchohol(){
		return jarrasQueCompro.sum({ g => g.contenidoDeAlchohol()})
	}
	
	method estaEbria(){
		return self.totalDeAlchohol() * peso > nivelDeAguante
	}
	
	method leGusta(cerveza){
		return true
	}
	
	method quiereEntrarALaCarpa(carpa){
		return self.leGusta(carpa.marca()) and
		if (gustaMusicaTradicional){
			carpa.bandaTradicional()
		}
		else if(not gustaMusicaTradicional){
			not carpa.bandaTradicional()
		}
	}
	
	method puedeEntrar(carpa){
		return self.quiereEntrarALaCarpa(carpa) and not self.estaEbria()
	}
	
	method entrarALaCarpa(carpa){
		if (carpa.admitePasar(self) and self.puedeEntrar(carpa)){
			carpa.entrarALaCarpa(self)
		}
		else {
			throw new Exception(message = "No pasas!")
		}

	}
	
	method ebrioEmpedernido(){
		return jarrasQueCompro.any({ g => g.capacidadLitros() > 1})
	}

}

class Belgas inherits Personas{
	
	override method leGusta(cerveza){
		return cerveza.lupulo() > 4
	}
	
		method esPatriota(){
		return jarrasQueCompro.all({ g => g.paisDeFabricacion() == "Belgica"})
	}
	
}

class Checos inherits Personas{
	
	override method leGusta(cerveza){
		return cerveza.graduacion() > 8
	}
		method esPatriota(){
		return jarrasQueCompro.all({ g => g.paisDeFabricacion() == "Republica Checa"})
	}
}
	
class Alemanes inherits Personas{
	override method quiereEntrarALaCarpa(carpa){
	return super(carpa) and carpa.cantidadDeGente() % 2 == 0
	}
	
	method esPatriota(){
		return jarrasQueCompro.all({ g => g.paisDeFabricacion() == "Alemania"})
	}
	
}
