class Dependencia {
	var flota = []	
	var property cantidadDeEmpleados
	
	method agregarAFlota(vehiculo) { flota.add(vehiculo) }
	method quitarDeFlota(vehiculo) { flota.remove(vehiculo) }
	
	// la suma del peso de cada rodado afectado a la flota 
	method pesoTotalFlota() { return flota.sum({ veh => veh.peso() }) }
	
	// es verdadero si la flota tiene al menos 3 rodados, y además, 
	// todos los rodados de la flota pueden ir al menos a 100 km/h
	method estaBienEquipada() { 
		return flota.size() >= 3 and flota.all({ veh => veh.velocidadMaxima() >= 100 })
	}

	// la cantidad total de personas que puede transportar 
	// la flota afectada a la dependencia, 
	// considerando solamente los rodados del color indicado	
	method capacidadTotalEnColor(color) {
		return flota.filter({ veh => veh.color() == color }).sum({ veh => veh.capacidad() })
	}
	// una variante que usa un método auxiliar
	method capacidadTotalEnColor_variante(color) {
		return self.vehiculosDeColor(color).sum({ veh => veh.capacidad() })
	}
	method vehiculosDeColor(color) {
		return flota.filter({ veh => veh.color() == color })
	}
	
	method colorDelRodadoMasRapido() {
		return flota.max({ veh => veh.velocidadMaxima() }).color()
	}
	
	// el resultado de restar, de la cantidad de empleados, 
	// la capacidad sumada de los vehículos de la flota
	method capacidadFaltante() {
		return cantidadDeEmpleados - self.capacidadFlota()
	}
	method capacidadFlota() { 
		return flota.sum({ veh => veh.capacidad() })
	}
	
	//  la condición es que la dependencia tenga al menos 40 empleados y 5 rodados
	method esGrande() {
		return cantidadDeEmpleados >= 40 and flota.size() >= 5
	}
}
