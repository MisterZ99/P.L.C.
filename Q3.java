import java.io.*;
import java.util.*;
//Zenio Angelo Oliveira Neves(ZAON)
enum identidade_genero{
    cisgenero, transgenero, genero_fluido, nao_binario;
}
class Pessoa{
    protected String nome;
    protected int idade;
    protected String grau_escolaridade;
    protected identidade_genero ig;
    protected String orientacao_sexual;
    protected String sexo_biologico;
    protected Pessoa(){
        
    }
    protected Pessoa(String nome, int idade, String ge, String ig, String oe, String sb){
        this.nome = nome;
        this.idade = idade;
        this.grau_escolaridade = ge;
        if(ig=="cisgenero"){
            this.ig = identidade_genero.cisgenero;
            //System.out.println(this.ig.name());
        }
        else if(ig=="transgenero"){
            this.ig = identidade_genero.transgenero;
        }
        else if(ig=="genero fluido"){
            this.ig = identidade_genero.genero_fluido;
        }
        else{
            this.ig = identidade_genero.nao_binario;
        }
        this.orientacao_sexual = oe;
        this.sexo_biologico = sb;
    }
    protected String getNome(){
        return this.nome;
    }
    protected int getIdade(){
        return this.idade;
    }
    protected String getGrau_Escolaridade(){
        return this.grau_escolaridade;
    }
    protected String getIdentidade_Genero(){
        return this.ig.name();
    }
    protected String getOritentacao_Sexual(){
        return this.orientacao_sexual;
    }
    protected String getSexo_Biologico(){
        return this.sexo_biologico;
    }
    protected void setNome(String nome){
        this.nome = nome;
    }
    protected void setIdade(int idade){
        this.idade = idade;
    }
    protected void setGrau_Escolaridade(String ge){
        this.grau_escolaridade = ge;
    }
    protected void dormir(){
        System.out.println("Dormiu.");
    }
    protected void cagar(){
        System.out.println("Cagou.");
    }
    protected void comer(){
        System.out.println("Comeu.");
    }
    protected void estudar(){
        System.out.println("Estudou.");
    }
    protected void viver(){
        System.out.println("Viveu.");
    }
    protected void sobreviver(){
        System.out.println("Sobreviveu.");
    }
    protected void trabalhar(){
        System.out.println("Trabalhou.");
    }
}

public class Q3{
    public static void main(String[] args){
        Pessoa zenio = new Pessoa();
        zenio.setNome("zenio Angelo O. Neves");
        zenio.setIdade(21);
        zenio.setGrau_Escolaridade("3º Grau Incompleto");
        System.out.printf("Nome: %s, Idade: %d anos, Escolaridade: %s\n", zenio.nome, zenio.idade, zenio.grau_escolaridade);
        zenio = new Pessoa("Zenio Angelo", 21, "3º Grau Incompleto", "cisgenero", "Heterossexual", "Masculino");
        System.out.printf("Nome: %s, Idade: %d anos, Escolaridade: %s, Identidade de Genero: %s, Orientacao Sexual: %s, Sexo Biologico: %s\n", zenio.getNome(), zenio.getIdade(), zenio.getGrau_Escolaridade(), zenio.getIdentidade_Genero(), zenio.getOritentacao_Sexual(), zenio.getSexo_Biologico());
    }
}