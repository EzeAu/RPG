import wollok.game.*
import Personajes.*
import Enemigos.*

object fondo{
	
	var property position = game.at(0,0)
	
	method image() = "fondo0.png"

}
object menuBatalla{
	
	var property seleccion = 0//0 o 1// 0, 1 o 2 con flecha
	var property seccion = 0 //0=Inicio 1=ElegirAtaque 2=FijarObjetivo 
	var property position = game.origin()
	var property puedeAtacar = 0
	var property queAtaque = 0
	
	method image() = "menu.png"
	
	method datosPersonajeActual(){
		
		game.addVisual(nombre)
		game.addVisual(vida)
		game.addVisual(stamina)
		
	}
	method seleccionOpciones(){
		
		if(self.seccion()==2){
			if(self.seleccion()==0 or self.seleccion()==1){
				self.seleccion(self.seleccion()+1)
				personaje.fijar(personaje.fijar()+1)
			}else{
				self.seleccion(0)
				personaje.fijar()
			}
		}else{
			if(self.seleccion() == 0){			
				self.seleccion(1)
			}else{self.seleccion(0)}	
		}
		if (self.seccion() == 0){
			if (self.seleccion()==0){
				menuOpcion1.sprite("menuAtacarSeleccionado")
				menuOpcion2.sprite("menuProtejer")
			}else{
				menuOpcion1.sprite("menuAtacar")
				menuOpcion2.sprite("menuProtejerSeleccionado")
			}
		}
		if (self.seccion() == 1){
			if (self.seleccion()==0){
				menuOpcion1.sprite("menuAtaqueBasicoSeleccionado")
				menuOpcion2.sprite("menuAtaqueFuerte")
			}else{
				menuOpcion1.sprite("menuAtaqueBasico")
				menuOpcion2.sprite("menuAtaqueFuerteSeleccionado")
			}
		}
		if (self.seccion() == 2){
			menuOpcion1.sprite("menuFijar")
			menuOpcion2.sprite("invisible")
			if(self.seleccion()==0){
				flecha.position(enemigo0.position())
			}
			if(self.seleccion()==1){
				flecha.position(enemigo1.position())
			}
			if(self.seleccion()==2){
				flecha.position(enemigo2.position())	
			}
		}
	}
	
}
object menuOpcion1{
	
	var property sprite = "menuAtacar"
	var property position = game.at(28,2)
	
	method image() = sprite + ".png"
	
}
object menuOpcion2{
	
	var property sprite = "menuProtejer"
	var property position = game.at(37,2)
	
	method image() = sprite + ".png"
	
}
object nombre{
	
	var property position = game.at(1,4)
	
	method text() = " "+personaje.nombre()
	
	method textColor() = "FFFFFF"
	
}
object vida{
	
	var property position = game.at(7,3)
	
	method text() = "HP: "+ personaje.vida()
	
	method textColor() = "FF0000"
	
}
object stamina{
	
	var property position = game.at(7,2)
	
	method text() = "EP: "+ personaje.stamina()
	
	method textColor() = "0FE001"
	
}
object flecha{
	var property sprite = "invisible"
	var property position = enemigo0.position()
	
	method image() = sprite + ".png"
}
