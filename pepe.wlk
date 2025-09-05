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

// Categorias con sus propiedades sueldo
object cadete {
    const sueldoCadete = 20000

    method neto() = sueldoCadete 
}

object vendedor {
    var sueldoVendedor = 16000
    
    method activarAumentoPorMuchasVentas() {
        sueldoVendedor = sueldoVendedor * 1.25
    }

    method desactivarAumentoPorMuchasVentas() {
        sueldoVendedor = 16000
    }

    method neto() = sueldoVendedor

}

object gerente {
    const sueldoGerente = 15000

    method neto() = sueldoGerente 
}


object medioTiempo {
    var sueldoMedioTiempo = 0

    method categoriaBase(categoria) {
        sueldoMedioTiempo = categoria.neto()/2
    }

    method neto() = sueldoMedioTiempo 
}

// Bonos por resultado calculados segun el empleado que se le de

object bonoResultadoPorcentaje {

    // Devuelve el monto del bono resultado por porcentaje de 10% del sueldo neto, el sueldo neto depende del rango del empleado

    method monto(empleado) {return empleado.sueldoNeto() * 10/100}  
}

object bonoResultadoMontoFijo {
    const montoFijo = 800

    // Devuelve el monto del bono resultado fijo de 800$ sin importar la categoria

    method monto(_categoria) = montoFijo 
}

// Bonos nulo valido para bono resultado y porcentaje
object bonoNulo {
    method monto(_categoria) = 0
}

// Bonos por presentismo (demagocio solo depende de la categoria)
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



object sofia {
    var categoria = cadete
    var bonoResultados = bonoNulo

    //Modifica el tipo de bono por resultado que recibe
    method bonoResultados(_bonoResultados) {
        bonoResultados = _bonoResultados
    }

    // Devuelve el sueldo neto de sofia segun su categoria
    method sueldoNeto(){
        return categoria.neto() * 1.3 
    }

    // Devuelve el sueldo compelto de sofia
    method sueldo() = self.sueldoNeto()+ bonoResultados.monto(self) 
}


object roque {
    const neto = 28000
    var bonoResultados = bonoResultadoMontoFijo

    //Modifica el tipo de bono por resultado que recibe roque
    method bonoResultados(_bonoResultados) {
        bonoResultados = _bonoResultados
    }

    // el sueldo completo de roque
    method sueldo() = neto + bonoResultados.monto(self) + 9000
  
}

object ernesto {
    var compañero = pepe
    var neto = 0
    var bonoPresentismo = bonoPresentismoNormal
    const cantidadDeFaltas = 0

    //Asigna el compañero a roque 
    method asignarCompañero(_compañero) {
        compañero = _compañero
    }

    ////Modifica el tipo de bono por presentismo que recibe ernesto
    method bonoPresentismo(_bonoPresentismo) {
        bonoPresentismo = _bonoPresentismo
    }

    //modifica y devuelve el sueldo neto de ernesto segun el compañero que se le asigne
    method sueldoNeto() {
        neto = compañero.sueldoNeto()
        return neto
    }

    method diasQueFalto() = cantidadDeFaltas

    //Devuelve el sueldo completo de ernesto
    method sueldo() = self.sueldoNeto() + bonoPresentismo.monto(self)
  
}