import java.io.*;
import java.util.*;

class passagem{
    private int numero, idade, poltrona;
    private String data, origem, destino, horario, nome;
    public passagem(int numero){
        this.numero = numero;
    }
    public void setIdade(int idade){
        this.idade = idade;
    }
    public void setPoltrona(int poltrona){
        this.poltrona = poltrona;
    }
    public void setData(String data){
        this.data = data;
    }
    public void setOrigem(String origem){
        this.origem = origem;
    }
    public void setDestino(String destino){
        this.destino = destino;
    }
    public void setHorario(String horario){
        this.horario = horario;
    }
    public void setNome(String nome){
        this.nome = nome;
    }
    public int getNumero(){
        return this.numero;
    }
    public int getIDade(){
        return this.idade;
    }
    public int getPoltrona(){
        return this.poltrona;
    }
    public String getData(){
        return this.data;
    }
    public String getOrigem(){
        return this.origem;
    }
    public String getDestino(){
        return this.destino;
    }
    public String getHorario(){
        return this.horario;
    }
    public String getNome(){
        return this.nome;
    }
}

public class Bus_Company{
    public static void main(String args[]){
        int soma = 0;
        int numero, idade, poltrona;
        String data, origem, destino, horario, nome;
        passagem p;
        passagem[] passagens = new passagem[44];
        Scanner entrada = new Scanner(System.in);
        int i = 0;
        for(; i<44; i++){
            numero = entrada.nextInt();
            entrada.nextLine(); // Limpar Buffer
            if(numero == -1){
                break;
            }
            else{
                p = new passagem(numero);
                data = entrada.nextLine();
                p.setData(data);
                origem = entrada.nextLine();
                p.setOrigem(origem);
                destino = entrada.nextLine();
                p.setDestino(destino);
                horario = entrada.nextLine();
                p.setHorario(horario);
                poltrona = entrada.nextInt();
                p.setPoltrona(poltrona);
                idade = entrada.nextInt();
                entrada.nextLine();
                soma = soma + idade;
                p.setIdade(idade);
                nome = entrada.nextLine();
                p.setNome(nome);
                passagens[i] = p;
            }
        }
        int tamanho = i;
        float media = soma/i;
        for(i=0; i<tamanho; i++){
            if(passagens[i].getIDade()>media && passagens[i].getPoltrona()%2==0){
                System.out.printf("%s\n", passagens[i].getNome());
            }
        }
    }    
}
