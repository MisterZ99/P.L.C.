import java.io.*;
import java.util.*;
//Zenio Angelo Oliveira Neves(ZAON)
class Texto{
    private String[] palavras = new String[100000]; //Limitei em 100000 palavras/pontuações.
    private int QP = 0; //Quantidade de palavras
    private int tudo = 0; //Quantidade de palavras + pontuações.
    public Texto(String t){
        int tamanho = t.length(), i=0, j=0;
        String coringa;
        while(i < tamanho){
            coringa = "";
            while(i<tamanho && ((t.charAt(i) >= 'A' && t.charAt(i) <= 'Z') || (t.charAt(i) >= 'a' && t.charAt(i) <= 'z') || (t.charAt(i) >= '0' && t.charAt(i) <= '9'))){
                coringa += Character.toString(t.charAt(i));
                i++;
            }
            if(!coringa.equals("")){
                this.palavras[j] = coringa;
                this.QP++;
                this.tudo++;
                j++;
            }
            if(i<tamanho && (t.charAt(i) == '!' || t.charAt(i) == '.' || t.charAt(i) == ';' || t.charAt(i) == '?' || t.charAt(i) == ':' || t.charAt(i) == ',')){
                this.palavras[j] = Character.toString(t.charAt(i));
                this.tudo++;
                j++;
            }
            i++;
        }
    }
    public int quant_palavras(){
        return this.QP;
    }
    public int freq_palavra(String p){
        int contador = 0;
        int tamanho = this.tudo;
        for(int i = 0; i < tamanho; i++){
            if(this.palavras[i].equals(p)){
                contador++;
                break;
            }
        }
        return contador;
    }
    public void substituir(String velho, String novo){
        int tamanho = this.tudo;
        for(int i = 0; i < tamanho; i++){
            if(this.palavras[i].equals(velho)){
                this.palavras[i] = novo;
                break;
            }
        }
    }
    public void getTexto(){//Sai como um texto padrão
        int tamanho = this.tudo;
        int i = 0;
        while(true){
            System.out.printf("%s", this.palavras[i]);
            if(i==tamanho-1){
                break;
            }
            if((!this.palavras[i+1].equals(".")) && (!this.palavras[i+1].equals("!")) && (!this.palavras[i+1].equals("?")) && (!this.palavras[i+1].equals(";")) && (!this.palavras[i+1].equals(":")) && (!this.palavras[i+1].equals(","))){
                System.out.printf(" ");
            }
            i++;
        }
        System.out.printf("\n");
    }
}

public class Q2{
    public static void main(String[] args){//aplicação
        Scanner entrada = new Scanner(System.in);
        String t = entrada.nextLine();
        Texto a = new Texto(t);
        System.out.printf("%d\n", a.quant_palavras());
        System.out.printf("%d\n", a.freq_palavra("Zenio"));
        a.substituir("Zenio", "Bruno");//troca Zenio(se houver) por Bruno.
        a.getTexto(); //Imprime texto em forma padrão(palavras separadas por espaços).
    }
}