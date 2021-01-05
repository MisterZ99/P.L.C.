import java.io.*;
import java.util.*;

public class Corrida {
    public static void main(String args[]){
        long soma = 0, soma_menor = 2000000000;
        int N, M, vencedor = 0, tempo;
        Scanner entrada = new Scanner(System.in);
        N = entrada.nextInt();
        M = entrada.nextInt();
        for(int i = 0; i<N; i++){
            for(int j = 0; j<M; j++){
                tempo = entrada.nextInt();
                soma += tempo;
            }
            if(soma < soma_menor){
                vencedor = i+1;
                soma_menor = soma;
            }
        }
        System.out.printf("%d\n", vencedor);
    }
}
