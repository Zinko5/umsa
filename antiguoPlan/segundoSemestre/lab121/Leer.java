/*Programa Leer,para datos de tipo Short,Int,Float,Double,Long*/

import java.io.*;
public class Leer
{ public static String dato ()
    { String cadena = "";
	try
	{   /*InputstreamRederisr=new InputStreamReader(System.in);
	    BufferedReaderEntrada=new BufferedReader(isr);
	    Cadena=Entrada.readLine();*/

	    //Otra alternativapara declarar la Entrada de Datos
	    BufferedReader Entrada=new BufferedReader(new InputStreamReader (System.in));
	    cadena=Entrada.readLine();
	}
	catch (IOException e)
	{System.err.println ("Error:" + e.getMessage ());
	}
	return cadena;
    }


    public static short datoShort ()
    { try
      { return Short.parseShort (dato ());
      }
      catch (NumberFormatException e)
      {return Short.MIN_VALUE;
      }
    }


    public static int datoInt ()
    { try
      {return Integer.parseInt (dato ());
      }
      catch (NumberFormatException e)
      { return Integer.MIN_VALUE;
      }
    }


    public static long datoLong ()
    { try
      { return Long.parseLong (dato ());
      }
      catch (NumberFormatException e)
      { return Long.MIN_VALUE;
      }
    }
    
    public static float datoFloat()
    { try
      { Float f=new Float(dato());
	return f.floatValue();
      }
      catch(NumberFormatException e)
      { return Float.NaN;
      }
    }
    
    public static double datoDouble()
    { try
      { Double d=new Double(dato());
	return d.doubleValue();
      }
      catch(NumberFormatException e)
      { return Double.NaN;
      }
    }
  }  

