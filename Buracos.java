import java.io.*;
import java.util.*;

class palavra{
    private String p;
    public palavra(String p){
        this.p = p;
    }
    public int quant_buraco(){
        int tamanho = this.p.length();
        int qb = 0;
        for(int i = 0; i<tamanho; i++){
            if(p.charAt(i) == 'A' || p.charAt(i) == 'D' || p.charAt(i) == 'O' || p.charAt(i) == 'P' || p.charAt(i) == 'Q' || p.charAt(i) == 'R'){
                qb += 1;
            }
            else if(p.charAt(i) == 'B'){
                qb += 2;
            }
        }
        return qb;
    }
}

public class Buracos{
    public static void main(String args[]){
        int palavras;
        String texto;
        palavra p;
        Scanner entrada = new Scanner(System.in);
        palavras = entrada.nextInt();
        entrada.nextLine();
        for(int i = 0; i<palavras; i++){
            texto = entrada.nextLine();
            p = new palavra(texto);
            System.out.printf("%d\n", p.quant_buraco());
        }
    }
}