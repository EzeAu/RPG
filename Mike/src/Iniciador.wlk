import wollok.game.*
import Personajes.*
import Enemigos.*
import MenuDeBatalla.*

////////////////////////////////////////////
object juego{
	
	method iniciar(){
		
		//Parametros Ventana
		game.width(16*3)
  		game.height(8*5)
  		game.cellSize(16)
  		game.title("Mike el Bárbaro")
  		
		//Escenario
		game.addVisual(fondo)
		game.boardGround("fondo.png")
		
		//Personajes
		game.addVisual(personaje)
		game.addVisual(enemigo0)
		game.addVisual(enemigo1)
		game.addVisual(enemigo2)
	
		
		//MENU PELEA
		game.addVisual(menuBatalla)
		game.addVisual(menuOpcion1)
		game.addVisual(menuOpcion2)
		game.addVisual(flecha)
		menuBatalla.datosPersonajeActual()
		
		
		game.onTick(350, "cambioPersonaje", { personaje.animacion() })
		game.onTick(250, "cambioEnemigo0", { enemigo0.animacion() })
		game.onTick(250, "cambioEnemigo1", { enemigo1.animacion() })
		game.onTick(250, "cambioEnemigo2", { enemigo2.animacion() })
		game.onTick(50, "controlEnemigo0", { if(enemigo0.vida()<=0){enemigo0.sprite("enemigoMuerto")} })
		game.onTick(50, "controlEnemigo1", { if(enemigo1.vida()<=0){enemigo1.sprite("enemigoMuerto")} })
		game.onTick(50, "controlEnemigo2", { if(enemigo2.vida()<=0){enemigo2.sprite("enemigoMuerto")} })
		
		//CONTROLES
		keyboard.a().onPressDo { 
			if((menuBatalla.seleccion()==0 and menuBatalla.seccion()==0) or menuBatalla.seccion()==1){
				menuBatalla.seccion(menuBatalla.seccion()+1)
			}
			if(menuBatalla.seccion()==1 and menuBatalla.seleccion()==0){
				menuBatalla.queAtaque(0)	
			}
			if(menuBatalla.seccion()==1 and menuBatalla.seleccion()==1){
				menuBatalla.queAtaque(1)
			}
			if(menuBatalla.puedeAtacar()==1){
				if(menuBatalla.queAtaque()==0){
					personaje.atacarBasico()
				}else{personaje.atacarFuerte()}
			}
			if(menuBatalla.seccion()==2){
				flecha.sprite("menuFijarFlecha")
				menuBatalla.puedeAtacar(1)
			}else{menuBatalla.puedeAtacar(0)}
			menuBatalla.seleccionOpciones()
			menuBatalla.seleccionOpciones()
 		}
		keyboard.s().onPressDo { 
			if(0 < menuBatalla.seccion()){
				menuBatalla.seccion(menuBatalla.seccion()-1)
			}
			menuBatalla.seleccionOpciones()
			flecha.sprite("invisible")
		}
		
		
		//keyboard.m().onPressDo { game.clear() }
		
		
		//CONTROLES MENU
		keyboard.left().onPressDo { menuBatalla.seleccionOpciones() }
		keyboard.right().onPressDo { menuBatalla.seleccionOpciones() }
		
		
		game.start()
		
	}
	
}
///////////////////////////////////////////////

