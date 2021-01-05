import java.io.*;
import java.util.*;
//Zenio Angelo Oliveira Neves(ZAON)
abstract class Livro{
    private String titulo;
    private String autor;
    private int capitulos;
    private int paginas;
    public Livro(String titulo){
        this.titulo = titulo;
    }
    public void setAutor(String autor){
        this.autor = autor;
    }
    public void setCapitulos(int capitulos){
        this.capitulos = capitulos;
    }
    public void setPaginas(int paginas){
        this.paginas = paginas;
    }
    public String getTitulo(){
        return this.titulo;
    }
    public String getAutor(){
        return this.autor;
    }
    public int getCapitulos(){
        return this.capitulos;
    }
    public int getPaginas(){
        return this.paginas;
    }
}

class LivroLivraria extends Livro{
    private double preco;
    private int estoque;
    public LivroLivraria(String titulo){
        super(titulo);
    }
    public void setPreco(double preco){
        this.preco = preco;
    }
    public void setEstoque(int estoque){
        this.estoque = estoque;
    }
    public double getPreco(){
        return this.preco;
    }
    public int getEstoque(){
        return this.estoque;
    }
    public void vender(){
        this.estoque--;
    }
}

class LivroBiblioteca extends Livro{
    private int disponiveis;
    private int emprestados;
    public LivroBiblioteca(String titulo){
        super(titulo);
    }
    public void setDisponiveis(int disponiveis){
        this.disponiveis = disponiveis;
    }
    public void setEmprestados(int emprestados){
        this.emprestados = emprestados;
    }
    public int getDisponiveis(){
        return this.disponiveis;
    }
    public int getEmprestados(){
        return this.emprestados;
    }
    public void emprestar(){
        if(this.disponiveis == 0){
            System.out.println("Livro indisponivel no momento.");
        }
        else{
            this.emprestados++;
            this.disponiveis--;
        }
    }
    public void devolver(){
        if(this.emprestados == 0){
            System.out.println("Livro não foi alugado aqui.");
        }
        else{
            this.emprestados--;
            this.disponiveis++;
        }
    }
}
public class Q1{
    public static void main(String[] args){
        Livro l = new LivroBiblioteca("Cronicas do Cão - Principe Beelzebub");
        l.setAutor("Monster Z");
        l.setCapitulos(20);
        l.setPaginas(400);
        ((LivroBiblioteca)l).setDisponiveis(0);//casting
        ((LivroBiblioteca)l).setEmprestados(5);
        System.out.printf("%d\n", ((LivroBiblioteca)l).getDisponiveis());
        ((LivroBiblioteca)l).emprestar();
    }
}