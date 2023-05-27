import wollok.game.*


object snake{
	var property position = game.center()
	const property image = "head.png"
	
	const body1 = new SnakeBody(position = game.at(position.x() -5, position.y()))
	const body2 = new SnakeBody(position = game.at(body1.position().x() -5, body1.position().y()))
	const body3 = new SnakeBody(position = game.at(body2.position().x() -5, body2.position().y()))
	
	const property body = [body1,body2,body3]
	var property ultPosBody
	var property ultPosHead
	
	
	method agregarBody(unSnakeBody){
		body.add(unSnakeBody)
	}
	
	method cambiarPosicion(){
		/* mueve el cuerpo de la serpiente a la posicion en la que estaba el cuadrado anterior.
		 * para esto genera un array de numeros ("(body.size() - 1.. 1)" es lo mismo que [2,1] cuando empieza, y se va incrementando
		 * a medida que se hace mas larga la cola. Ej: [3, 2, 1], [4, 3, 2, 1], etc) siempre en reverza.
		 * con este array se toma cada numero para usarlo en el .get() en el "body[]" y asi obtener un cubo del cuerpo del snake empezando desde el final
		 * esto para poder mover el ultimo cubo al lugar del cubo que tiene delante, asi asi con los demas.
		 * como termina en 1 el array y el primer elemento es el de la posiocion 0, a este nunca lo toma, se lo deja como caso de borde
		 * finalmente se mueve el primer elemento a la posicion anterior de la cabeza de la snake
		 */
			(body.size() - 1.. 1).forEach{e => body.get(e).position(body.get(e - 1).position())}
			body.first().position(ultPosHead)
	}
	
	
	
	method moverArriba(){
		ultPosBody = body.last().position()
		ultPosHead = position
		self.position(self.position().up(5))
		self.cambiarPosicion()
	}
	
	method moverAbajo(){
		ultPosBody = body.last().position()
		ultPosHead = position
		self.position(self.position().down(5))
		self.cambiarPosicion()
	}
	method moverDerecha(){
		ultPosBody = body.last().position()
		ultPosHead = position
		self.position(self.position().right(5))	
		self.cambiarPosicion()
	}
	method moverIzquierda(){
		ultPosBody = body.last().position()
		ultPosHead = position
		self.position(self.position().left(5))
		self.cambiarPosicion()
	}
	
	
}

object snakeHead{
	var property position = game.center()
	
	method image() = "head.png"
}


class SnakeBody{
	var property position
	
	method image() = "body.png"
}

class Manzana{
	var property position
	
	method image() = "manzana.png"
}
