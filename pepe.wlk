object pepe {
	
    var categoria = gerente
    var bonoPresentismo = 0
    var bonoResultados = bonoResultadoPorcentaje
    var cantidadDeFaltas = 0

    method categoria(_categoria) {
        categoria = _categoria
    }

    method bonoPresentismo(_bonoPresentismo) {
        bonoPresentismo = _bonoPresentismo
    }

    method bonoResultados(_bonoResultados) {
        bonoResultados = _bonoResultados
    }

    method cantidadDeFaltas(_cantidadDeFaltas) {
        cantidadDeFaltas = _cantidadDeFaltas
    }

    method sueldoNeto(){
        return categoria.neto() + bonoPresentismo + bonoResultados.monto(categoria)
    }
}

object cadete {
    const sueldoCadete = 20000

    method neto() = sueldoCadete 
}

object gerente {
    const sueldoGerente = 15000

    method neto() = sueldoGerente 
}

object bonoResultadoPorcentaje {
    method monto(_categoria) {return _categoria.neto() * 1.10}  
}
