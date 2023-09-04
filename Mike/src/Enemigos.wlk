import wollok.game.*
import Personajes.*
import MenuDeBatalla.*

//////////////////////////////////////
object enemigo0{
	
	var vida = 100 
	var ataque = 5
	var num = 0
	var sprite = "enemigo0"
	
	var property position = game.at(29,16)
	
	method ataque(){return ataque}
	
	method atacar(){
		
		game.removeTickEvent("cambioEnemigo0")
		game.schedule(1000, { sprite = "enemigoAtaca"
			game.say((self), "Lenguetazo")
		})
		
		
		game.onTick(350, "cambioEnemigo0", { self.animacion() })
			
			
		
	}
	
	method image() = sprite + ".png"
	
	method textColor() = "FF0000"
	
	method animacion(){
		
		
		if (num == 0 ){
			
			num = 1
			sprite = "enemigo0"
			
		}else{
			if (num == 1){
				
				num = 2
				sprite = "enemigo1"
				
			}else{
				
				if (num == 2){
					
					num = 3
					sprite = "enemigo2"
					
				}else{
					if (num == 3){
						
						num = 0
						sprite = "enemigo1"
						
					}else{
						//return "error animacion personaje"
					}
				}
			}
		}
		
	}
	
	method vida(){return vida}
	
	method vida(_vida){
		
		vida-=_vida
		
		game.schedule(310, {
			game.removeTickEvent("cambioEnemigo0")
			sprite="enemigoDanado"
			if (vida <= 0){

			sprite="enemigoMuerto"
			
			}else{
				game.onTick(250, "cambioEnemigo0", { self.animacion() })
			}
		})
	}
	
	method sprite(){return sprite}
	
	method sprite(_sprite){sprite=_sprite}
}
///////////////////////////////////////////////////////////////
object enemigo1{
	
	var vida = 100 
	var num = 0
	var ataque = 5
	var sprite = "enemigo0"
	
	var property position = game.at(33,12)
	
	method ataque(){return ataque}
	
	method atacar(){
		
		game.removeTickEvent("cambioEnemigo1")
		game.schedule(1000, { sprite = "enemigoAtaca"
			game.say((self), "Lenguetazo")
		})
		
		game.onTick(350, "cambioEnemigo1", { self.animacion()})
			
			
		
	}
	
	method image() = sprite + ".png"
	
	method textColor() = "FF0000"
	
	method animacion(){
		
		
		if (num == 0 ){
			
			num = 1
			sprite = "enemigo0"
			
		}else{
			if (num == 1){
				
				num = 2
				sprite = "enemigo1"
				
			}else{
				
				if (num == 2){
					
					num = 3
					sprite = "enemigo2"
					
				}else{
					if (num == 3){
						
						num = 0
						sprite = "enemigo1"
						
					}else{
						//return "error animacion personaje"
					}
				}
			}
		}
		
	}
	
	method vida(){return vida}
	
	method vida(_vida){
		
		vida-=_vida
		
		game.schedule(310, {
			game.removeTickEvent("cambioEnemigo1")
			sprite="enemigoDanado"
			if (vida <= 0){
			
			sprite="enemigoMuerto"
			
			}else{
				game.onTick(250, "cambioEnemigo1", { self.animacion() })
			}
		})
	}
	
	method sprite(){return sprite}
	
	method sprite(_sprite){sprite=_sprite}
}
////////////////////////////////////////////////////////////////
object enemigo2{
	
	var vida = 100 
	var num = 0
	var ataque = 5
	var sprite = "enemigo0"
	
	var property position = game.at(37,8)
	
	method ataque(){return ataque}
	
	method atacar(){
		
		game.removeTickEvent("cambioEnemigo2")
		game.schedule(1000, { sprite = "enemigoAtaca"
			game.say((self), "Lenguetazo")
		})
		
		game.onTick(350, "cambioEnemigo2", { self.animacion() })
			
			
		
	}
	
	method image() = sprite + ".png"
	
	method textColor() = "FF0000"
	
	method animacion(){
		
		
		if (num == 0 ){
			
			num = 1
			sprite = "enemigo0"
			
		}else{
			if (num == 1){
				
				num = 2
				sprite = "enemigo1"
				
			}else{
				
				if (num == 2){
					
					num = 3
					sprite = "enemigo2"
					
				}else{
					if (num == 3){
						
						num = 0
						sprite = "enemigo1"
						
					}else{
						//return "error animacion personaje"
					}
				}
			}
		}
		
	}
	
	method vida(){return vida}
	
	method vida(_vida){
		
		vida-=_vida
		
		game.schedule(310, {
			game.removeTickEvent("cambioEnemigo2")
			sprite="enemigoDanado"
			if (vida <= 0){

			sprite="enemigoMuerto"
			
			}else{
				game.onTick(250, "cambioEnemigo2", { self.animacion() })
			}
		})
	}
	
	method sprite(){return sprite}
	
	method sprite(_sprite){sprite=_sprite}
	
}
/////////////////////////////////////////////////////////////////

