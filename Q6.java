import java.io.*;
import java.util.*;
//Zenio Angelo Oliveira Neves(ZAON)
interface Expression{
    public String avaliar(String expr);
    public String imprimirArvore(String expr);
}
class ArvoreA{//Árvore Aritmética
    String Raiz;//operador aritmético(+||-||*||/) ou um número
    ArvoreA E = null;//ramo esquerdo é uma árvore aritmética
    ArvoreA D = null;//ramo direito é uma árvore aritmética
    public ArvoreA(String expressao){
        String[] subexp;
        int i, tamanho = expressao.length();
        for(i=tamanho-1; i>-1; i--){//Raiz poderá ser operador aritmético
            if(expressao.charAt(i) == '+'){
                this.Raiz = "+";
                subexp = expressao.split("\\+");//Vetor de Strings separados a partir do operador aritmético
                D = new ArvoreA(subexp[subexp.length-1]);//A String(expressão) mais a direita será "jogada" para o ramo direito
                int j, quant_subexps = subexp.length-1;//
                String coringa = "";
                for(j=0; j<quant_subexps; j++){//As outras Strings(expressões) serão "jogados" para o ramo esquerdo
                    coringa += subexp[j];
                    if(j<quant_subexps-1){
                        coringa += this.Raiz;//Concatenando as Strings que serão "jogadas" para o ramo esquerdo
                    }
                }
                E = new ArvoreA(coringa);
                break;//Operador encontrado, não há mais necessidade de continuar procurando
            }
        }
        if(i==-1){//Raiz poderá ser operador aritmético
            for(i=tamanho-1; i>-1; i--){
                if(expressao.charAt(i) == '-'){
                    this.Raiz = "-";
                    subexp = expressao.split("-");
                    D = new ArvoreA(subexp[subexp.length-1]);
                    int j, quant_subexps = subexp.length-1;
                    String coringa = "";
                    for(j=0; j<quant_subexps; j++){
                        coringa += subexp[j];
                        if(j<quant_subexps-1){
                            coringa += this.Raiz;
                        }
                    }
                    E = new ArvoreA(coringa);
                    break;
                }
            }
        }
        if(i==-1){//Raiz poderá ser operador aritmético
            for(i=tamanho-1; i>-1; i--){
                if(expressao.charAt(i) == '*'){
                    this.Raiz = "*";
                    subexp = expressao.split("\\*");
                    D = new ArvoreA(subexp[subexp.length-1]);
                    int j, quant_subexps = subexp.length-1;
                    String coringa = "";
                    for(j=0; j<quant_subexps; j++){
                        coringa += subexp[j];
                        if(j<quant_subexps-1){
                            coringa += this.Raiz;
                        }
                    }
                    E = new ArvoreA(coringa);
                    break;
                }
            }
        }
        if(i==-1){//Raiz poderá ser operador aritmético
            for(i=tamanho-1; i>-1; i--){
                if(expressao.charAt(i) == '/'){
                    this.Raiz = "/";
                    subexp = expressao.split("/");
                    D = new ArvoreA(subexp[subexp.length-1]);
                    int j, quant_subexps = subexp.length-1;
                    String coringa = "";
                    for(j=0; j<quant_subexps; j++){
                        coringa += subexp[j];
                        if(j<quant_subexps-1){
                            coringa += this.Raiz;
                        }
                    }
                    E = new ArvoreA(coringa);
                    break;
                }
            }
        }
        if(i==-1){//Raiz será um número
            this.Raiz = expressao;
        }
    }
    public String getArvoreA(ArvoreA a){
        if(a.E == null && a.D == null){
            return "("+a.Raiz+")";
        }
        return "("+a.E.getArvoreA(a.E)+a.Raiz+a.D.getArvoreA(a.D)+")";
    }
}
class ArvoreL{//Árvore Lógica
    String Raiz;//Sempre operador lógico
    ArvoreA E = null;//Ramo esquerdo é Árvore Aritmética
    ArvoreA D = null;//Ramo direito é Árvore Aritmética
    public ArvoreL(String expressao){
        String[] subexp;
        int i, tamanho = expressao.length();
        for(i=tamanho-1; i>-1; i--){//Raiz será um operador Lógico
            if(expressao.charAt(i) == '='){
                if(expressao.charAt(i-1) == '<'){
                    this.Raiz = "<=";
                    subexp = expressao.split("<=");//De acordo com a questão, não vai haver mais de um operador lógico(ExpArit1 OPLOGICO ExpArit2)
                    E = new ArvoreA(subexp[0]);//Expressão Aritmética a esquerda
                    D = new ArvoreA(subexp[1]);//Expressão Aritmética a direita
                    break;
                }
                else if(expressao.charAt(i-1) == '>'){
                    this.Raiz = ">=";
                    subexp = expressao.split(">=");
                    E = new ArvoreA(subexp[0]);
                    D = new ArvoreA(subexp[1]);
                    break;
                }
                else if(expressao.charAt(i-1) == '!'){
                    this.Raiz = "!=";
                    subexp = expressao.split("!=");
                    E = new ArvoreA(subexp[0]);
                    D = new ArvoreA(subexp[1]);
                    break;
                }
                else if(expressao.charAt(i-1) == '='){
                    this.Raiz = "==";
                    subexp = expressao.split("==");
                    E = new ArvoreA(subexp[0]);
                    D = new ArvoreA(subexp[1]);
                    break;
                }
            }
            else{
                if(expressao.charAt(i) == '>'){
                    this.Raiz = ">";
                    subexp = expressao.split(">");
                    E = new ArvoreA(subexp[0]);
                    D = new ArvoreA(subexp[1]);
                    break;
                }
                else if(expressao.charAt(i) == '<'){
                    this.Raiz = "<";
                    subexp = expressao.split("<");
                    E = new ArvoreA(subexp[0]);
                    D = new ArvoreA(subexp[1]);
                    break;
                }
            }
        }        
    }
    public String getArvoreL(ArvoreL a){//Retorna uma String correspondente à Árvore Lógica
        return "("+a.E.getArvoreA(a.E)+a.Raiz+a.D.getArvoreA(a.D)+")";//Chama uma função da Árvore Aritmética pra printar os ramos
    }
}
class ExprLogica implements Expression{
    public String expressao;
    private ArvoreL a;
    public ExprLogica(String expressao){
        this.expressao = expressao;
        this.a = new ArvoreL(expressao);
    }
    public String toString(boolean b){//Não está na interface porque vai receber um booleano ou um double dependendo da classe ao qual pertence no caso deste programa
        return Boolean.toString(b);
    }
    @Override
    public String avaliar(String expressao){
        int i, tamanho = expressao.length();
        ExprAritmetica a = new ExprAritmetica("1");//Objeto de ExprAritmetica para eu poder utilizar seu método avaliar
        String[] subexps;
        for(i=tamanho-1; i>-1; i--){//Encontra o operador lógico e chama avaliar, para as duas expressões, do objeto *a* para resolver as duas subexpressões aritméticas
            if(expressao.charAt(i)=='='){
                if(expressao.charAt(i-1)=='<'){
                    subexps = expressao.split("<=");
                    return this.toString(Double.parseDouble(a.avaliar(subexps[0])) <= Double.parseDouble(a.avaliar(subexps[1])));
                }
                else if(expressao.charAt(i-1)=='>'){
                    subexps = expressao.split(">=");
                    return this.toString(Double.parseDouble(a.avaliar(subexps[0])) >= Double.parseDouble(a.avaliar(subexps[1])));
                }
                else if(expressao.charAt(i-1)=='!'){
                    subexps = expressao.split("!=");
                    return this.toString(Double.parseDouble(a.avaliar(subexps[0])) != Double.parseDouble(a.avaliar(subexps[1])));
                }
                else{
                    subexps = expressao.split("==");
                    return this.toString(Double.parseDouble(a.avaliar(subexps[0])) == Double.parseDouble(a.avaliar(subexps[1])));
                }
            }
            else{
                if(expressao.charAt(i)=='<'){
                    subexps = expressao.split("<");
                    return this.toString(Double.parseDouble(a.avaliar(subexps[0])) < Double.parseDouble(a.avaliar(subexps[1])));
                }
                else if(expressao.charAt(i)=='>'){
                    subexps = expressao.split(">");
                    return this.toString(Double.parseDouble(a.avaliar(subexps[0])) > Double.parseDouble(a.avaliar(subexps[1])));
                }
            }
        }
        return "";//Pra o compilador não frescar
    }
    @Override
    public String imprimirArvore(String expressao){
        ArvoreL b = new ArvoreL(expressao);
        return b.getArvoreL(b);
    }
}
class ExprAritmetica implements Expression{
    public String expressao;
    private ArvoreA a;
    public ExprAritmetica(String expressao){
        this.expressao = expressao;
        this.a = new ArvoreA(expressao);
    }
    public String toString(double d){//Não está na interface porque vai receber um booleano ou um double dependendo da classe ao qual pertence no caso deste programa
        return Double.toString(d);
    }
    @Override
    public String avaliar(String expressao){
        int i, tamanho = expressao.length();
        double resposta;
        String[] subexps;
        for(i=tamanho-1; i>-1; i--){//Encontra o operador lógico e chama este avaliar para resolver cada subexpressão
            if(expressao.charAt(i)=='+'){
                resposta = 0;
                subexps = expressao.split("\\+");
                tamanho = subexps.length;
                for(i=0; i<tamanho; i++){
                    resposta += Double.parseDouble(avaliar(subexps[i]));
                }
                return this.toString(resposta);
            }
        }
        if(i==-1){
            for(i=tamanho-1; i>-1; i--){
                if(expressao.charAt(i)=='-'){
                    subexps = expressao.split("-");
                    tamanho = subexps.length;
                    resposta = Double.parseDouble(avaliar(subexps[0]));
                    for(i=1; i<tamanho; i++){
                        resposta -= Double.parseDouble(avaliar(subexps[i]));
                    }
                    return this.toString(resposta);
                }
            }
        }
        if(i==-1){
            for(i=tamanho-1; i>-1; i--){
                if(expressao.charAt(i)=='*'){
                    subexps = expressao.split("\\*");
                    tamanho = subexps.length;
                    resposta = 1;
                    for(i=0; i<tamanho; i++){
                        resposta *= Double.parseDouble(avaliar(subexps[i]));
                    }
                    return this.toString(resposta);
                }
            }
        }
        if(i==-1){
            for(i=tamanho-1; i>-1; i--){
                if(expressao.charAt(i)=='/'){
                    subexps = expressao.split("/");
                    tamanho = subexps.length;
                    resposta = Double.parseDouble(avaliar(subexps[0]));
                    for(i=1; i<tamanho; i++){
                        resposta /= Double.parseDouble(avaliar(subexps[i]));
                    }
                    return this.toString(resposta);
                }
            }
        }
        if(i==-1){
            return expressao;
        }
        return "";//Pra o compilador não frescar
    }
    @Override
    public String imprimirArvore(String expressao){
        ArvoreA b = new ArvoreA(expressao);
        return b.getArvoreA(b);
    }
}
public class Q6{
    public static void main(String[] args){
        Scanner entrada = new Scanner(System.in);
        String expr = entrada.nextLine();
        int tamanho = expr.length(), i;
        for(i=0; i<tamanho; i++){
            if(expr.charAt(i) == '<' || expr.charAt(i) == '>' || expr.charAt(i) == '=' || expr.charAt(i) == '!'){//Se a expressão for lógica
                ExprLogica el = new ExprLogica(expr);
                System.out.println(el.imprimirArvore(el.expressao));
                System.out.println(el.avaliar(el.expressao));
                break;
            }
        }
        if(i==tamanho){//Se a expressão for aritmética
            ExprAritmetica ea = new ExprAritmetica(expr);
            System.out.println(ea.imprimirArvore(ea.expressao));
            System.out.println(ea.avaliar(ea.expressao));
        }
    }
}