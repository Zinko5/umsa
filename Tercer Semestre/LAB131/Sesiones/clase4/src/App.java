import java.util.*;
public class App {
    public static void juntarDepartamentos(CSimpleD a, CCircularP b)
    {
        CSimpleD aa = new CSimpleD();
        CCircularP bb = new CCircularP();
        while(!a.esvacia())
        {
            Departamento dx=a.eliminar();
            System.out.print("\n\nDEPARTAMENTO: ");
            dx.mostrar();
            System.out.print("\nPROVINCIAS: ");
            while(!b.esvacia())
                {
                Provincia px=b.eliminar();
                if(px.getId() == dx.getId()) {
                    System.out.print(" <");
                    px.mostrar();
                    System.out.print("> ");
                }
                bb.adicionar(px);
            }
            b.vaciar(bb);
            aa.adicionar(dx);
        }
        a.vaciar(aa);
    }
    public static void llevarAdelante (CSimpleD colaDepartamento, CCircularP ColaProvincia, String x) {
        CSimpleD auxColaDepartamento = new CSimpleD();
        CCircularP auxColaProvincias = new CCircularP();
        Departamento auxDepartamento = null;
        while(!colaDepartamento.esvacia())
        {
            Departamento departamentoSacado = colaDepartamento.eliminar();
            if (departamentoSacado.getNombre().equals(x)) {
                auxDepartamento = departamentoSacado;
            }
            else
                auxColaDepartamento.adicionar(departamentoSacado);
        }
        if (auxDepartamento != null) {
            colaDepartamento.adicionar(auxDepartamento);
            colaDepartamento.vaciar(auxColaDepartamento);
            int n = ColaProvincia.nroelem();
            for (int i = 0; i <= n; i++) {
                Provincia provinciaSacada = ColaProvincia.eliminar();
                if (provinciaSacada.getId() == auxDepartamento.getId()) {
                    ColaProvincia.adicionar(provinciaSacada);
                } else {
                    auxColaProvincias.adicionar(provinciaSacada);
                }
            }
            ColaProvincia.vaciar(auxColaProvincias);
        }
    }
    public static void main(String[] args) {
        //Cola FIFO
        //Cola simple de departamentos con id, nombre y capital
        //Cola circular de provincia con id, nombre, nroHab y superficie
        CSimpleD A=new CSimpleD();
        Departamento d1=new Departamento(11,"La Paz", "La Paz");
        Departamento d2=new Departamento(22,"Beni", "Trinidad");
        Departamento d3=new Departamento(33,"Chuquisaca", "Sucre");
        Departamento d4=new Departamento(44,"Oruro", "Oruro");
        Departamento d5=new Departamento(88,"Potosi", "Potosi");
        A.adicionar(d1);
        A.adicionar(d2);
        A.adicionar(d3);
        A.adicionar(d4);
        A.adicionar(d5);
        
        //1.
        A.mostrar();
        
        CCircularP B=new CCircularP();
        Provincia p1=new Provincia(11, 654, 1489, "Murillo");
        Provincia p2=new Provincia(11, 478, 1892, "Larecaja");
        Provincia p3=new Provincia(11, 543, 2497, "Muñecas");
        Provincia p4=new Provincia(22, 794, 1892, "Cercado");
        Provincia p5=new Provincia(22, 189, 1259, "provincia1");
        Provincia p6=new Provincia(33, 897, 1850, "provincia2");
        Provincia p7=new Provincia(44, 146, 1718, "provincia3");
        Provincia p8=new Provincia(88, 648, 1798, "provincia4");
        Provincia p9=new Provincia(88, 489, 2740, "provincia5");
        B.adicionar(p1);
        B.adicionar(p5);
        B.adicionar(p9);
        B.adicionar(p7);
        B.adicionar(p5);
        B.adicionar(p2);
        B.adicionar(p3);
        B.adicionar(p8);
        B.adicionar(p4);
        B.adicionar(p6);
        
        //2.
        B.mostrar();
        
        //3. Mostrar las provincias de cada departamento
        juntarDepartamentos(A, B);
        
        //4. Mostrar el departamento al que pertenece la provincia de nombre x
        
        //5. Llevar el departamento de nombre x y sus provincias al principio de las colas
        System.out.println("\n");
        llevarAdelante(A, B, "Potosi");
        A.mostrar();
        B.mostrar();
        System.out.println();
        
        Queue<Departamento> C = new LinkedList<Departamento>();
        C.add(d1);
        C.add(d2);
        C.add(d3);
        C.add(d4);
        C.add(d5);
    }
    
}
