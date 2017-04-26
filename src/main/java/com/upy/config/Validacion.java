package com.upy.config;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
import java.util.Locale;
import java.util.ArrayList;
import java.util.Arrays;
//import java.util.Locale;

public class Validacion
{
    public static String getFechaActual() 
   {
      Date ahora = new Date();
      SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
      return formateador.format(ahora);
    } 
    public static String getHoraActual()
    {
       Date ahora=new Date();
       SimpleDateFormat formateador=new SimpleDateFormat("hh:mm:ss");
       return formateador.format(ahora);
    }
//==============================================================================
    public static Date CnvStringFecha(String fecha)
{
    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
    Date fechaDate = null;
    try 
    {
        fechaDate = formato.parse(fecha);
    }
    catch (ParseException ex)
    {
        System.out.println(ex.getMessage());
    }
    return fechaDate;
}
//==============================================================================
    public static String CnvFechaString(Date fecha)
    {
        String fechaStr=null;
        SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
        try
        {
            fechaStr = sdf2.format(fecha);
        }
        catch (Exception ex)
        {
            System.out.println(ex.getMessage());
        }
        return fechaStr;
    }
//==============================================================================
     public static boolean isDate(String fechax)
 {
  try 
  {
      SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault());
      formatoFecha.setLenient(false);
      formatoFecha.parse(fechax);
      return true;
  } catch (ParseException e) 
     {
      return false;
     }
  
}
//-----------------------------------
 public static int Generar_Aleatorio(int limite) 
   { 
      return (int) (Math.random()*limite+1)-1;
   }
     
//------------------------------------     
//==============================================================================
public static String Apost(String Texto) 
{ 
  return "'"+Texto+"'";
} 
//==============================================================================
public static String CnvHoraString(Date hour)
{
    String hora=null;
    SimpleDateFormat sdf= new SimpleDateFormat("hh:mm");
    try{
        hora=sdf.format(hour);
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
    return hora;
}

//==============================================================================
public static Date CnvStringHora(String hora)
{
    SimpleDateFormat formato = new SimpleDateFormat("hh:mm");
    Date horaDate = null;
    try 
    {
        horaDate = formato.parse(hora);
    }
    catch (ParseException ex)
    {
        System.out.println(ex.getMessage());
    }
    return horaDate;
}

//==============================================================================
    public static boolean BuscarDato(Object clave, ArrayList<Object> arreglo)
    {
        boolean encontro=false;
        int i=0;
        while(i<arreglo.size() && !encontro)
        {
            if(arreglo.get(i).equals(clave))
                encontro=false;
            else
                i++;
        }
        return encontro;
    }
    
//==============================================================================
    //Verificar si un dia de la semana es fin de semana
    public  static boolean EsFinDeSemana(String f)
    {
        Date fec=CnvStringFecha(f);
        Calendar fecha= Calendar.getInstance();
        fecha.setTime(fec);
        boolean fin=false;
        if(fecha.get(Calendar.DAY_OF_WEEK)==Calendar.SUNDAY || fecha.get(Calendar.DAY_OF_WEEK)==Calendar.SATURDAY){
            fin=true;
        }
        return fin;
    }
//==============================================================================
    //Verificar si un dia es feriado
      public static boolean EsFeriado(String fecha)
   {
        //Arreglo para agregar los dias feriados
        String feriados[]={"01/01/2015","19/04/2015","01/07/2015","24/06/2015","05/07/2015","24/07/2015","12/10/2015","25/12/2015"};
        Arrays.sort(feriados);
        int i=Arrays.binarySearch(feriados, fecha);
        boolean enc=false;
        if(i>0)
            enc=true;
        return enc;
   }
//==============================================================================
      //Verificar si es Lunes
      public static boolean EsLunes(String f)
      {
        Date fec=CnvStringFecha(f);
        Calendar fecha= Calendar.getInstance();
        fecha.setTime(fec);
        boolean mon=false;
        if(fecha.get(Calendar.DAY_OF_WEEK)==Calendar.MONDAY){
            mon=true;
        }
        return mon;
      }
//============================================================================
      // seleccionar mes de una fecha
      public static int ObtenerMes(Date date)
      {
          if(null == date)
          {
              return 0;
          }
          else 
          {
              String formato = "MM";
              SimpleDateFormat dateFormat = new SimpleDateFormat(formato);
              return Integer.parseInt(dateFormat.format(date));
          }
      }
      //---------------------------------------------
      //sumar dias a una fecha
   public static Date sumarFechasDias(Date fecha, int dias) 
   {
        Calendar unCal = Calendar.getInstance();
        unCal.setTimeInMillis(fecha.getTime());
        unCal.add(Calendar.DATE, dias);
        return new java.sql.Date(unCal.getTimeInMillis());
    }
   
   //------------------------------------------------------
   //Separar las palabras clave por espacio o coma
   public static String[] separarPalabras(String cadena){
	   String delimitadores = " ,";
	   String[] palabras = cadena.split(delimitadores);
	   return palabras;
   }
   
   public static String formatDate(Date fecha){
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   return dateFormat.format(fecha);   
   }

}
