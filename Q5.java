import java.io.*;
import java.util.*;
//Zenio Angelo Oliveira Neves(ZAON)
interface Colecao{
    public void inserir(Pessoa p);
    public int tamanhoColecaoNaoNull();
}
abstract class Pessoa{
    protected String nome;
    protected String cpf;
    protected Pessoa(String nome, String cpf){
        this.nome = nome;
        this.cpf = cpf;
    }
    protected String getNome(){
        return this.nome;
    }
    protected String getCPF(){
        return this.cpf;
    }
    protected abstract void setNome(String nome);
    protected abstract void setCPF(String cpf);
}
class Professor extends Pessoa{
    protected String formacao;
    protected String area;
    protected Professor(String nome, String cpf, String formacao, String area){
        super(nome, cpf);
        this.formacao = formacao;
        this.area = area;
    }
    @Override
    protected void setNome(String nome){
        super.nome = nome;
    }
    @Override
    protected void setCPF(String cpf){
        super.cpf = cpf;
    }
    protected String getFormacao(){
        return this.formacao;
    }
    protected String getArea(){
        return this.area;
    }
    protected void setFormacao(String formacao){
        this.formacao = formacao;
    }
    protected void setArea(String area){
        this.area = area;
    }
}
class Aluno extends Pessoa{
    protected String matricula;
    protected String curso;
    protected Aluno(String nome, String cpf, String matricula, String curso){
        super(nome, cpf);
        this.matricula = matricula;
        this.curso = curso;
    }
    @Override
    protected void setNome(String nome){
        super.nome = nome;
    }
    @Override
    protected void setCPF(String cpf){
        super.cpf = cpf;
    }
    protected String getMatricula(){
        return this.matricula;
    }
    protected String getCurso(){
        return this.curso;
    }
    protected void setMatricula(String matricula){
        this.matricula = matricula;
    }
    protected void setCurso(String curso){
        this.curso = curso;
    }
}
class ColecaoVetor implements Colecao{
    Pessoa[] dados = new Pessoa[5];
    private int indice = 0;
    ColecaoVetor(){

    }
    @Override
    public void inserir(Pessoa p){
        if(indice<5){
            this.dados[this.indice] = p;
            this.indice++;
        }
        else{
            System.out.println("Sem espaço.");
        }
    }
    @Override
    public int tamanhoColecaoNaoNull(){
        return (5 - this.indice);
    }
}
public class Q5{
    public static void main(String[] args){
        ColecaoVetor cv = new ColecaoVetor();
        Pessoa p = new Professor("Castor", "200369875-01", "Ciencia da Computacao", "CIn");
        cv.inserir(p);
        System.out.printf("%s inserido com sucesso.\nVagas Disponiveis: %d\n", cv.dados[0].getNome(), cv.tamanhoColecaoNaoNull());
        Pessoa p1 = new Professor("Ricardo", "005560875-99", "Engenharia Elétrica - Eletrônica", "CTG");
        cv.inserir(p1);
        System.out.printf("%s inserido com sucesso.\nVagas Disponiveis: %d\n", cv.dados[1].getNome(), cv.tamanhoColecaoNaoNull());
        Pessoa p2 = new Aluno("Zenio", "651465187-75", "651465187-75", "Engenharia da Computacao");
        cv.inserir(p2);
        System.out.printf("%s inserido com sucesso.\nVagas Disponiveis: %d\n", cv.dados[2].getNome(), cv.tamanhoColecaoNaoNull());
    }
}