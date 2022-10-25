namespace ejer1
{
    public class Curso
    {
        private int id, nroEstudiantes, ciProfesor;
        private string nomDirector, nroDistrito, ciudad, nomProfesor;
        
        private string [,]estudiantes = new string[3,50];
        // 1. Nombre, 2. CI, y 3. Edad
        public Curso(int id, int nroEstudiantes, int ciProfesor, string nomDirector, string nroDistrito, string ciudad, string nomProfesor)
        {
            this.id = id;
            this.nroEstudiantes = nroEstudiantes;
            this.ciProfesor = ciProfesor;
            this.nomDirector = nomDirector;
            this.nroDistrito = nroDistrito;
            this.ciudad = ciudad;
            this.nomProfesor = nomProfesor;
            for (int i = 0; i < nroEstudiantes; i++)
            {
                System.Console.Write("Leer nombre de estudiante: ");
                estudiantes[0, i] = Console.ReadLine();
                System.Console.Write("Leer ci de estudiante: ");
                estudiantes[1, i] = Console.ReadLine();
                System.Console.Write("Leer edad de estudiante: ");
                estudiantes[2, i] = Console.ReadLine();
                System.Console.WriteLine();
            }
        }
        new public void mostrar()
        {
            System.Console.WriteLine("Curso: " + id + ", " + nroEstudiantes + ", " + ciProfesor  + ", " + nomDirector + ", " + nroDistrito + ", " + ciudad + ", " + nomProfesor);
            for (int i = 0; i < 49; i++)
            {
                System.Console.WriteLine("Estudiante: " + estudiantes[0, i] + ", " + estudiantes[1, i] + ", " + estudiantes[2, i]);
            }
        }
        public void mostrar(Curso cs)
        {
            int ma = 0, mb = 0;
            for (int i = 0; i < nroEstudiantes; i++)
            {
                if (int.Parse(estudiantes[2, i]) >= 18)
                {
                    ma++;
                }
            }
            for (int i = 0; i < cs.nroEstudiantes; i++)
            {
                if (int.Parse(cs.estudiantes[2, i]) >= 18)
                {
                    mb++;
                }
            }
            if (ma > mb)
            {
                System.Console.WriteLine("CPreparatoria tiene mas estudiantes mayores de 18 años");
            }
            else
            {
                if (mb > ma)
                {
                    System.Console.WriteLine("CSecundaria tiene mas estudiantes mayores de 18 años");
                }
                else
                {
                    System.Console.WriteLine("Ningun curso tiene mas estudiantes mayores de 18 años");
                }
            }
        }
        public void mostrar(int x)
        {
            for (int i = 0; i < nroEstudiantes; i++)
            {
                if (int.Parse(estudiantes[1, i]) == x && ciudad == "Santa Cruz de la Sierra")
                {
                    System.Console.WriteLine("El estudiante si esta cursando en Santa Cruz de la Sierra");
                }
            }
        }
        public void eliminar()
        {
            int aux2 = nroEstudiantes;
            /*do
            {
                
            } while (true);*/
            for (int i = 0; i < nroEstudiantes; i++)
            {
                string aux = "";
                if (capicua(estudiantes[1, i]) == true)
                {
                    System.Console.WriteLine(estudiantes[1, i] + " es capicua");
                    estudiantes[0, i] = ""; estudiantes[1, i] = ""; estudiantes[2, i] = "";
                    aux2--;
                    for (int y = i; y < aux2; y++) //indices bien
                    {
                        for (int j = i; j < aux2 - 1; j++)
                        {
                            aux = estudiantes[1, j];
                            estudiantes[1, j] = estudiantes [1, j + 1];
                            estudiantes[1, j + 1] = aux;
    
                            aux = estudiantes[0, j + 1];
                            estudiantes[0, j + 1] = estudiantes [0, j];
                            estudiantes[0, j] = aux;
    
                            aux = estudiantes[2, j + 1];
                            estudiantes[2, j + 1] = estudiantes [2, j];
                            estudiantes[2, j] = aux;
                        }
                    }
                }
            }
            nroEstudiantes = aux2;
        }
        public bool capicua(string ci)
        {
            string sp = "";
            int l = ci.Length;
            for (int i = 0; i < l; i++)
            {
                sp = sp + ci.Substring(l - i - 1, 1);
                //513 3 31 315
            }
            if (ci == sp)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}