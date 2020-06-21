import MarcasYJarras.*
import Personas.*

class CarpasCerveceras {
	var property genteAdmitida
	var property bandaTradicional = true
	var property marca
	var property genteDentro = []
	
	method cantidadDeGente(){
		return genteDentro.size()
	}
	
	method admitePasar(persona){
		return self.cantidadDeGente() < genteAdmitida and not persona.estaEbria()
	}
	
	method entrarALaCarpa(quien){
		genteDentro.add(quien)
	}
	
	method servirUnaJarra(aQuien, jarra){
		aQuien.nuevaJarra(jarra)
	}
	
	method ebriosEmpedernidos(){
		return genteDentro.filter({ g => g.ebrioEmpedernido()}).size()
	}
}