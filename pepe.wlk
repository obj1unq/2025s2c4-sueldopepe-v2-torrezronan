object pepe {

	//se colocan manualmenete mediante setter

    var categoria = gerente 
    var bonoPresentismo = bonoPresentismoNormal
    var bonoResultados = bonoResultadoMontoFijo 
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

    // Devuelve los dias que falto

    method diasQueFalto() = cantidadDeFaltas 
    // Devuelve el sueldo neto de pepe segun categoria y tipos de bono

    method sueldoNeto(){
        return categoria.neto() 
    }

    // Devuelve el sueldo completo de pepe los bonos se calculan dandoles el nombre del empleado(objeto) del que tienen que sacar la info necesaria (faltas y categoria)

    method sueldo() = self.sueldoNeto()+ bonoPresentismo.monto(self) + bonoResultados.monto(self)
}

// Rangos con sus propiedades sueldo
object cadete {
    const sueldoCadete = 20000

    method neto() = sueldoCadete 
}

object gerente {
    const sueldoGerente = 15000

    method neto() = sueldoGerente 
}

// Bonos por resultado calculados segun el empleado que se le de

object bonoResultadoPorcentaje {

    // Devuelve el monto del bono resultado por porcentaje de 10% del sueldo neto, el sueldo neto depende del rango del empleado

    method monto(empleado) {return empleado.sueldoNeto() * 10/100}  
}

object bonoResultadoMontoFijo {
    const montoFijo = 800

    // Devuelve el monto del bono resultado fijo de 800$ sin importar el rango

    method monto(_categoria) = montoFijo 
}

object bonoNulo {
    method monto(_categoria) = 0
}

object bonoPresentismoNormal {  
    var monto = 0

    //Calcula el bono segun los dias que falto el empleado y devuelve el valor

    method monto(empleado) {
        var faltas = empleado.diasQueFalto()
        
        if(faltas == 0) monto =2000  else if (faltas==1) monto=1000 else monto = 0

        return monto
        } 
}

object bonoPresentismoAjuste {
    var monto = 0

    //Devuelve el monto del bono segun los dias que falto el empleado  

    method monto(empleado) {
        
        monto = if(empleado.diasQueFalto() == 0) 100 else 0

        return monto
    } 
   
}

object bonoPresentismoDemagogico {

    // Devuelve el monto del bono segun el sueldo neto del empleado

    method monto(empleado) = if (empleado.sueldoNeto()<18000) 500 else 300
}