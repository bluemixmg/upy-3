package generacionRutas;

import java.util.ArrayList;
import java.util.Iterator;
import com.upy.model.*;

public class Utility {
	
	public static ArrayList<Pasajero> VisitList = new ArrayList<Pasajero>();

	public static double getDistance (Pasajero p, Pasajero q) {

		double dx = p.getLatitud() - q.getLatitud();
		double dy = p.getLongitud() - q.getLongitud();
		double distance = Math.sqrt (dx * dx + dy * dy);
		return distance;

	}
	
	/**
	 * neighbourhood puntos of any Pasajero p
	 **/
	public static ArrayList<Pasajero> getNeighbours(Pasajero p) {
		
		ArrayList<Pasajero> neigh = new ArrayList<Pasajero>();
		Iterator<Pasajero> Pasajeroes = new DBScan().getPuntos().iterator();
		int i = 0;
		while(Pasajeroes.hasNext()) {
			Pasajero q = Pasajeroes.next();
			if(getDistance(p,q) <= DBScan.epsilon && i < DBScan.max_Pasajeroes && !isVisited(q)) {
				//System.out.println("Encontr� el vecino " + i + " de " + p.getNombre() +": " + q.getNombre());
				neigh.add(q);
				i++;
			}
		}
		return neigh;
		
	}

	public static void Visited(Pasajero d) {
		
		VisitList.add(d);
		
	}

	public static boolean isVisited(Pasajero c) {
		
		return VisitList.contains(c);
		
	}

	public static ArrayList<Pasajero> Merge(ArrayList<Pasajero> a, ArrayList<Pasajero> b) {
	
		Iterator<Pasajero> it5 = b.iterator();
		int i = a.size();
		while(it5.hasNext() && i < DBScan.max_Pasajeroes) {
			Pasajero t = it5.next();
			if (!a.contains(t)) {
				a.add(t);
				i++;
			}
		}
		return a;
		
	}

	//Returns puntos to DBscan.java 

	public static ArrayList<Pasajero> getList() {
	
		ArrayList<Pasajero> newList = new ArrayList<Pasajero>();
		newList.clear();
		
		/*newList.add(new Pasajero(10.072620, -69.294934, "Sambil")); //Sambil
		newList.add(new Pasajero(10.061983, -69.365798, "Metropolis")); //Metropolis
		newList.add(new Pasajero(10.073106, -69.289677, "Flor")); //Flor
		newList.add(new Pasajero(10.066631, -69.356679, "Obelisco")); //Obelisco
		newList.add(new Pasajero(10.077078, -69.282832, "Trinitarias")); //Trinitarias
		newList.add(new Pasajero(10.0620743, -69.3597487, "Estadio Antonio H. Guti�rrez")); //Estadio Antonio Herrera Guti�rrez
		newList.add(new Pasajero(10.079446, -69.2863006, "Parque del Este")); //Parque del Este
		newList.add(new Pasajero(10.061561, -69.292847, "Marna")); //Marna
		newList.add(new Pasajero(10.065058, -69.293104, "Saime Av. Lara")); //Saime Av. Lara
		newList.add(new Pasajero(10.067872, -69.284592, "CC Par�s")); //CC Par�s
		newList.add(new Pasajero(10.073154, -69.286309, "CC Los Pr�ceres")); //CC Los Pr�ceres*/
		
		return newList;
		
	}		

	public static boolean equalPasajeros(Pasajero m , Pasajero n) {
		
		return (m.getLatitud() == n.getLatitud()) && (m.getLongitud() == n.getLongitud());
		
	}	

}
