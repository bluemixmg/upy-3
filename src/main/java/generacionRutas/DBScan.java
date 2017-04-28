package generacionRutas;

import java.util.*;
import com.upy.model.*;

public class DBScan {
	
	//public static double epsilon = 0.012;
	
	private static double factor_conversion = 0.00909340475289646391752277917545;

	private static double km = 1.5;
	
	public static double epsilon = km * factor_conversion;
	
	public static int minpts = 1;
	public static int max_Pasajeroes = 4;
	
	public ArrayList<Pasajero> puntos;
	public static ArrayList<Pasajero> vecinos;
	
	public static ArrayList< ArrayList<Pasajero> > resultados;
	
	public DBScan() {
		
	}
	
	public DBScan(ArrayList<Pasajero> puntos) {
		this.puntos = puntos;
	}
	
	public ArrayList<Pasajero> getPuntos() {
		return puntos;
	}
	
    public ArrayList< ArrayList<Pasajero> > applyDBScan(){
    	
    	//puntos = new ArrayList<Pasajero>();
    	resultados = new ArrayList< ArrayList<Pasajero> >();
    	vecinos = new ArrayList<Pasajero>();
    	
    	//puntos = Utility.getList();
    	int index2 = 0;
    	
    	while (puntos.size() > index2) {
    		//System.out.println("puntos.size() = " + puntos.size() + " e index2 = " + index2);
    		Pasajero p = puntos.get(index2);
    		//System.out.print("Este es mi p: \"" + p.getNombre());
    		//String visitado = (Utility.isVisited(p)) ? "ya lo visit�" : "no lo he visitado";
    		//System.out.println("\" y " + visitado);
    		if (!Utility.isVisited(p)){
    			//Utility.Visited(p);
				//System.out.println("Marqu� \"" + p.getNombre() + "\" como visitado y buscar� sus vecinos...\n");
				int sizeViejo = vecinos.size();
				vecinos = Utility.getNeighbours(p);
				if (vecinos.size() > sizeViejo) {
					Utility.Visited(p);
				}
				//System.out.println("\nVecinos encontrados: " + vecinos.size());
				
				if (vecinos.size() >= minpts) {
					int ind=0;
					//System.out.println("Entrar� al while interno...\n");
					while (vecinos.size() > ind) {
						//System.out.println("vecinos.size() = " + vecinos.size() + " e ind = " + ind);
						Pasajero r = vecinos.get(ind);
						//System.out.println("Obtuve r = " + r.getNombre());
						//String visitado = (Utility.isVisited(r)) ? "ya lo visit�" : "no lo he visitado";
			    		//System.out.println(" y " + visitado);
						if (!Utility.isVisited(r)) {
							Utility.Visited(r);
							//System.out.println("Marqu� " + r.getNombre() + " como visitado y buscar� sus vecinos...\n");
							ArrayList<Pasajero> vecinos2 = Utility.getNeighbours(r);
							/*System.out.println("\nvecinos.size() + vecinos2.size() = " + vecinos.size() + vecinos2.size());
							while (vecinos.size() + vecinos2.size() > max_Pasajeroes) {
								System.out.println("Remover� un vecino2...");
								System.out.println("Remov� a " + vecinos2.remove(vecinos2.size() - 1).getNombre());
								System.out.println("vecinos.size() + vecinos2.size() = " + vecinos.size() + vecinos2.size());
							}*/
							//System.out.println("\nvecinos2.size() = " + vecinos2.size());
							if (vecinos2.size() >= minpts) {
								//System.out.println("Fusionar� vecinos con vecinos2");
								vecinos = Utility.Merge(vecinos, vecinos2);
							}
						}
						ind++;
						//System.out.println("\nIncremento ind, que ahora vale: " + ind);
					} //While interno
					//System.out.println("N"+vecinos.size());
					//System.out.println("\nA�adir� vecinos a la lista de resultados DESPU�S del while");
					resultados.add(vecinos);
				} //Vecinos>=minpts
    		}
    		index2++; //Visited(p)
    		//System.out.println("\nIncremento index2, que ahora vale: " + index2);
    	}
    	//System.out.println("\nFinalic� y retornar� los resultados");
    	return resultados; //While externo
    	
    } //Fin del metodo
    
}
