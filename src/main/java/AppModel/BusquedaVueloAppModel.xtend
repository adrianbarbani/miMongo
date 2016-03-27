package AppModel

import Dominio.Asiento
import Dominio.Busqueda
import Dominio.Usuario
import Dominio.Vuelo
import Repositorios.AeropuertosRepositorio
import java.util.ArrayList
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable	
class BusquedaVueloAppModel {
	
	Usuario usr	
	List <String> todosLosAeropuertos
	
	String origen
	String destino
	Date fechaDesde
	Date fechaHasta
	String tarifaMax
		
	Vuelo vueloSeleccionado
	List <Vuelo> resultados = newArrayList
	List<Asiento> asientosDisponibles = newArrayList
	
//	Map <Vuelo, List<Asiento> > asientosPorVuelo
	
	new (Usuario unUsr){
		usr = unUsr
		todosLosAeropuertos = AeropuertosRepositorio.getInstance.nombreDeTodosLosAeropuertos
	}
	
	def buscar() {
		resultados = new Busqueda(origen, destino, fechaDesde, fechaHasta, tarifaMax).buscar(usr)
	}
	
	def separarAsientos() {
		asientosDisponibles = vueloSeleccionado.asientosValorMaximo(Float.parseFloat(tarifaMax))
	}
	
}