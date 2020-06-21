import Personas.*
import Carpas.*

class Marcas {
	
	var property lupulo	= 0
	var property paisDeFabricacion
}

class CervezaRubia inherits Marcas{
	var property graduacion = 0
	
	method alchoholPorLitro(){
		return (self.graduacion() * 0.10) / 10
	}
}

class CervezaNegra inherits Marcas{
	var property graduacionReglamentaria
	
	method graduacion(){
		return 0.max(graduacionReglamentaria - lupulo * 2)
	}
	
	method alchoholPorLitro(){
		return  (self.graduacion() * 0.10) / 10
	}
}

class CervezaRoja inherits CervezaNegra{
	override method graduacion(){
		return  super() * 0.10
	}
	
	override method alchoholPorLitro(){
		return  (self.graduacion() * 0.10) / 10
	}
}

class Jarras {
	var property capacidadLitros
	var property marca
	
	// REQUERIMIENTOS 1
	
	method contenidoDeAlchohol(){
		return capacidadLitros * marca.alchoholPorLitro()
	}
	
	method paisDeFabricacion(){
		return marca.paisDeFabricacion()	
	}
}
