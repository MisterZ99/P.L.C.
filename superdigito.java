import java.io.*;
import java.util.*;

class Digito{
    public Digito(){
        
    }
    public int soma_dig(int numero){
        if(numero<10){
            return numero;
        }
        else{
            return (numero%10) + soma_dig(numero/10);
        }
    }
    public int SD(int numero){
        if(numero<10){
            return numero;
        }
        else{
            return SD(soma_dig(numero));
        }
    }
}

public class superdigito{
    public static void main(String args[]){
        String n;
        int numero;
        int k;
        int soma = 0;
        int tamanho;
        Scanner entrada = new Scanner(System.in);
        n = entrada.next();
        tamanho = n.length();
        k = entrada.nextInt();
        for(int i = 0; i<tamanho; i++){
            soma = soma + ((int)n.charAt(i)-48);
        }
        numero = soma*k;
        Digito d = new Digito();
        int super_digito = d.SD(numero);
        System.out.printf("%d\n", super_digito);
    }
}