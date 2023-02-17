console.log("hola")
function piramide() {
  var n = document.ejer1.cantidad.value;
  var array = [];
  for (var i = 1; i <= n; i++) {
    array[i] = new Array(n);
    for (var j = 1; j <= i; j++) {
      array[i][j] = (i,j);
    }
  }
  var texto = "";
  for (i = 1; i <= n; i++) {
    for (j = 1; j <= i; j++) {
      texto += array[i][j];
      texto += " ";
    }
    texto += "\n";
  }
  document.ejer1.solucion.value = texto;
}
function primos() {
	var n=document.ejer2.cantidad.value;
	var num,c,x;
	num=0;
	cadena=""
	while(n>0) {
		num++;
		x=1;
		c=0;
		while(x<=num){
			if (num%x==0) {
				c++;
			}
			x++;
			}
			if (c==2) {
			cadena=cadena+num+", ";
			n=n-1;
		}
	}
	document.ejer2.solucion.value=cadena;
}
function rotar(numero) {
	var n=String(document.ejer3.cantidad.value),k=0,x=0,y=0,p=0;
	arr=n.split('');
	cad="";
	var l=arr.length;
	if (l<6) {
		cad="El numero debe tener seis digitos o más";
		document.ejer3.solucion.value=cad;
	}
	else {
		for (var i = 0; i < l; i++) {
		if (arr[i]%2==0) {
			if (k==0) {
				x=arr[i];
				p=i;
				k=1;
			}
			else{
				y=arr[i];
				arr[i]=x;
				x=y;
			}
		}
	}
	arr[p]=x;
  	document.ejer3.solucion.value=arr;
	}
}
function capicua() {
	var n=document.ejer4.cantidad.value;
	var a=n,i=0,c;
	cad="";
	while(a>=1) {
		c=a%10;
		i=i*10+c;
		a=a/10;
		a=Math.floor(a);
	}
	if (n==i) {
		cad="Es capicua";
	}
	else{
		cad="No es capicua";
	}
	document.ejer4.solucion.value=cad;
}
function serie() {
	var n=document.ejer5.cantidad.value;
	var a,vc=n*2-2,s=0,f=0;
	cad="";
	if (n==1) {cad="Ingrese un N mas grande"}
	else{
		if (vc==2) {cad=2}
		else{
			for (var i = 1; i < vc-1; i++) {
				a=i*2;
				f=fact(a);
				s=s+f;
			}
			cad=s;
		}
	}
	document.ejer5.solucion.value=cad;
}
function fact(h) {
  var f = 1;
  if (h !== 0) {
    for (k = 1; k <= h; k++) {
      f *= k;
    }
  }
  return f;
}
