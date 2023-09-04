import wollok.game.*
import Enemigos.*
import MenuDeBatalla.*

object personaje{
	
	var property vida = 100
	var ataqueBasico = 10
	var ataqueFuerte = 30
	var desgaste = 1
	var property stamina = 10
	var num = 0
	var property sprite = "personaje0"
	var property fijar = 0
	var property nombre = "MIKE"
	var property position = game.at(11,12)
	
	method image() = sprite + ".png"
	
	method animacion(){
		
		//sprite = "personaje1"
		if (num == 0 ){
			
			num = 1
			sprite = "personaje0"
			
		}else{
			if (num == 1){
				
				num = 2
				sprite = "personaje1"
				
			}else{
				//return "error animacion personaje"
				if (num == 2){
					
					num = 3
					sprite = "personaje2"
					
				}else{
					if (num == 3){
						
						num = 0
						sprite = "personaje1"
						
					}else{
						//return "error animacion personaje"
					}
				}
			}
		}
		
	}

	method atacarBasico(){
	
	if(vida > 0){
		
		if(fijar==0){
	
		if ((enemigo0).vida()>0 and stamina>0){
			
			game.removeTickEvent("cambioPersonaje")
			game.schedule(100, self.position(position.up(1)))
			game.schedule(200, self.position(position.up(1)))
			game.schedule(300, {
				self.sprite("personajeAtaque")
				enemigo0.vida(ataqueBasico)
				game.onTick(350, "cambioPersonaje", { self.animacion() })
			})
			game.schedule(100, self.position(position.down(1)))
			game.schedule(200, self.position(position.down(1)))

			stamina -= desgaste
		
		}
		
	}
		if(fijar==1){
	
		if ((enemigo1).vida()>0 and stamina>0){
			
			game.removeTickEvent("cambioPersonaje")
			game.schedule(100, self.position(position.up(1)))
			game.schedule(200, self.position(position.up(1)))
			game.schedule(300, {
				self.sprite("personajeAtaque")
				enemigo1.vida(ataqueBasico)
				game.onTick(350, "cambioPersonaje", { self.animacion() })
			})
			game.schedule(100, self.position(position.down(1)))
			game.schedule(200, self.position(position.down(1)))

			stamina -= desgaste
		
		}
		
	}
		if(fijar==2){
		if ((enemigo2).vida()>0 and stamina>0){
			
			game.removeTickEvent("cambioPersonaje")
			game.schedule(100, position= position.right(1))
			game.schedule(200, position= position.right(1))
			game.schedule(300, {
				self.sprite("personajeAtaque")
				enemigo2.vida(ataqueBasico)
				game.onTick(350, "cambioPersonaje", { self.animacion() })
			})
			game.schedule(100, position= position.left(1))
			game.schedule(200, position= position.left(1))

			stamina -= desgaste
		
		}
	}
	
		stamina += desgaste
	
		if (vida<=0){
			
			game.removeTickEvent("cambioPersonaje")
			sprite = "personajeMuerto"
			
			game.say((enemigo0), "Ahhhhggg")
			game.say((enemigo1), "Ahhhhggg")
			game.say((enemigo2), "Ahhhhggg")
			
			//game.say((self), "*Abatido*")
			
		}
	
		if (stamina<=0){
		
			//game.say((self), "No me queda energía...")
		
		}
	}
	
	}
	
	method atacarFuerte(){
	if(vida > 0){	
	if(fijar==0){
	
		if ((enemigo0).vida()>0 and stamina>0){
			
			game.removeTickEvent("cambioPersonaje")
			sprite = "personajeAtaque"
		
			(enemigo0).vida(ataqueFuerte)
			game.say((enemigo0), "vida -30")
		
			game.onTick(350, "cambioPersonaje", { self.animacion() })
			
			stamina -= desgaste*2
			
			game.say((self), "Mega Puño!!!")
			
		}
		if (enemigo0.vida()>0){
			
			vida -= enemigo0.ataque()
			game.say((self), "vida -5")
			enemigo0.atacar()
			
		}
	}
	if(fijar==1){
	
		if ((enemigo1).vida()>0 and stamina>0){
			
			game.removeTickEvent("cambioPersonaje")
			sprite = "personajeAtaque"
		
			(enemigo1).vida(ataqueFuerte)
			game.say((enemigo1), "vida -30")
		
			game.onTick(350, "cambioPersonaje", { self.animacion() })
			
			stamina -= desgaste*2
			
			game.say((self), "Mega Puño!!!")
			
		}
		if (enemigo1.vida()>0){
			
			vida -= enemigo1.ataque()
			game.say((self), "vida -5")
			enemigo1.atacar()
			
		}
	}
	if(fijar==2){
	
		if ((enemigo2).vida()>0 and stamina>0){
			
			game.removeTickEvent("cambioPersonaje")
			sprite = "personajeAtaque"
		
			(enemigo2).vida(ataqueFuerte)
			game.say((enemigo2), "vida -30")
		
			game.onTick(350, "cambioPersonaje", { self.animacion() })
			
			stamina -= desgaste*2
			
			game.say((self), "Mega Puño!!!")
			
		}
		if (enemigo2.vida()>0){
			
			vida -= enemigo2.ataque()
			game.say((self), "vida -5")
			enemigo2.atacar()
			
		}
	}	
	
	stamina += desgaste	
	if (vida<=0){
			
			game.removeTickEvent("cambioPersonaje")
			sprite = "personajeMuerto"
			
			game.say((enemigo0), "Ahhhhggg")
			game.say((enemigo1), "Ahhhhggg")
			game.say((enemigo2), "Ahhhhggg")
			
			game.say((self), "*Abatido*")
			
		}
	
		if (stamina<=0){
		
			game.say((self), "No me queda energía...")
		
		}
	
	}	
	if (stamina<=0){
		
		game.say((self), "No me queda energía")
		
	}
		
}
	
}
