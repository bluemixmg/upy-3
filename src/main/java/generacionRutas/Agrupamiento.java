package generacionRutas;

import java.util.ArrayList;

import com.upy.model.Pasajero;

public class Agrupamiento {
	
	private ArrayList<Pasajero> pasajeros;
	private ArrayList<ArrayList<Pasajero>> grupos;
	
	public Agrupamiento(ArrayList<Pasajero> pasajeros){
		
		this.pasajeros = pasajeros;
	}
	
	public ArrayList<ArrayList<Pasajero>> dbscanClustering() {
		grupos= new ArrayList<ArrayList<Pasajero>>();
		DBScan dbscan = new DBScan(this.pasajeros);
		grupos = dbscan.applyDBScan();
		/*System.out.print("Numero de grupos = " + grupos.size());
		System.out.print(" Ubicaciones en total = ");
		int acum = 0;
		for (int i = 0; i < grupos.size(); i++) {
			acum += grupos.get(i).size();
		}
		System.out.println(acum);
		for(int i=0; i<grupos.size(); i++){
			System.out.println("\nGrupo " + (i+1) + " (" + grupos.get(i).size() + " ubicaciones)");
			for(int j=0; j<grupos.get(i).size(); j++){
				//System.out.println("Coordenadas = (" +  grupos.get(i).get(j).getLatitud() + ", " + grupos.get(i).get(j).getLongitud() + ")");
				System.out.println("Ubicaci�n = " + grupos.get(i).get(j).getNombre());
			}
		}*/
		return grupos;
	}


}
