class funrec {
    public static int factorial (int n) {
	if (n == 0)
	    return 1;
	else
	    return (factorial (n - 1) * n);
    }

    public static int sumatoria (int n) {
	if (n == 0)
	    return 0;
	else
	    return (sumatoria (n - 1) + n);
    }

    public static int nrodig (int a) {
	if (a == 0)
	    return 0;
	else
	    return (nrodig (a / 10) + 1);
    }

    public static int sumpar (int n) {
	if (n == 0)
	    return 0;
	else
	    return (sumpar (n - 1) + n * 2);
    }

    public static void pares (int n) {
	if (n != 0) {
	    System.out.print (n * 2 + ",");
	    pares (n - 1);
	}
    }

    public static void impares (int n) {
	if (n != 0) {
	    impares (n - 1);
	    System.out.print (n * 2 - 1 + ",");
	}
    }

    // MANEJO DE VECTORES
    public static void llenar (int v [], int n) {
	if (n != 0) {
	    llenar (v, n - 1);
	    v [n] = (int) (Math.random () * 10);
	}
    }

    public static void mostrar (int v [], int n) {
	if (n != 0) {
	    mostrar (v, n - 1);
	    System.out.print (v [n] + "  ");
	}
    }

    public static int sumar (int v [], int n) {
	if (n == 0)
	    return 0;
	else
	    return (sumar (v, n - 1) + v [n]);
    }

    public static int contar (int v [], int n, int x) {
	int r;
	if (n == 0)
	    return 0;
        else {
	    r = contar (v, n - 1, x);
	    if (v [n] % x == 0)
		return (r + 1);
	    else
		return (r);
	}
    }

    public static int mayor (int v [], int n) {
	int r;
	if (n == 1)
	    return v [1];
        else {
	    r = mayor (v, n - 1);
	    if (r < v [n])
		return (v [n]);
	    else
		return r;
	}
    }

    public static void llenaFS (int v [], int n) {
	if (n != 0) {
	    llenaFS (v, n - 1);
	    if (n % 2 != 0)
		v [n] = funrec.factorial (n);
	    else
		v [n] = funrec.sumatoria (n);
	}
    }

    //MANEJO DE MATRICES
    public static void llenar (int a [] [], int n, int m, int c) {
	if (n != 0) {
	    if (m != 0) {
		llenar (a, n, m - 1, c);
		a [n] [m] = (int) (Math.random () * 10);
		//System.out.println (n + " " + m + " " + a [n] [m] + "  ");
	    }
            else {
		m = c;
		llenar (a, n - 1, m, c);
	    }
	}
    }

    public static void mostrar (int a [] [], int n, int m, int c) {
	if (n != 0) {
	    if (m != 0) {
		mostrar (a, n, m - 1, c);
		System.out.print (a [n] [m] + "  ");
	    }
            else {
		m = c;
		mostrar (a, n - 1, m, c);
		System.out.println ();
	    }
	}
    }

    public static int sumita (int a [] [], int n, int m, int c) {
	if (n != 0) {
	    if (m != 0) {
		return (sumita (a, n, m - 1, c) + a [n] [m]);

	    }
            else {
		m = c;
		return (sumita (a, n - 1, m, c));

	    }
	}
	else
	    return 0;
    }

    public static void llenaF (int a [] [], int n, int m, int c, int i) {
	if (n != 0)
	{
	    if (m != 0) {
                i = i - 1;
		llenaF (a, n, m - 1, c, i);
		a [n] [m] = funrec.factorial (i);
	    }
            else {
		m = c;
		llenaF (a, n - 1, m, c, i);
	    }
	} 
    }
}
