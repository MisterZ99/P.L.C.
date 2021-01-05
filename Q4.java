import java.io.*;
import java.util.*;
//Zenio Angelo Oliveira Neves(ZAON)
class Senha{
    protected Senha(String composta, int numerica){
        this.composta = composta;
        this.numerica = numerica;
    }
    protected String composta;
    protected int numerica;
    protected void setComposta(String composta){
        this.composta = composta;
    }
    protected void setNumerica(int numerica){
        this.numerica = numerica;
    }
    protected String getComposta(){
        return this.composta;
    }
    protected int getNumerica(){
        return this.numerica;
    }
}

class Conta{
    protected int n_identificacao;
    protected String agencia;
    protected Senha s;
    protected Conta(int n_identificacao, String agencia, Senha s){
        this.n_identificacao = n_identificacao;
        this.agencia = agencia;
        this.s = s;
    }
    protected void setN_Identificacao(int n_identificacao){
        this.n_identificacao = n_identificacao;
    }
    protected void setAgencia(String agencia){
        this.agencia = agencia;
    }
    protected int getN_Identificacao(){
        return this.n_identificacao;
    }
    protected String getAgencia(){
        return this.agencia;
    }
}

public class Q4{
    public static void main(String[] args){
        Conta c = new Conta(26, "B.B.", new Senha("A1B2C3", 123456));
        System.out.printf("Senha Composta: %s, Senha Numerica: %d\n", c.s.composta, c.s.numerica);
        c.s.setComposta("Z1Y5X7");
        System.out.printf("Senha Composta: %s, Senha Numerica: %d\n", c.s.composta, c.s.numerica);
    }
}