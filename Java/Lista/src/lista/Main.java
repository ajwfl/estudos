
package lista;

import javax.crypto.interfaces.PBEKey;
import javax.swing.JOptionPane;

public class Main {
     public Main() {
     }   
     public static void main(String[] args) {
         Lista objL = new Lista();
         Lista L = new Lista();
         JOptionPane.showMessageDialog(null,"Objetivo do programa � excluir \ntodas as ocorrencias encontrados \nem uma lista");
         if ( JOptionPane.showConfirmDialog(null,"Confirma Gerar a lista rand�mica","Randomica",JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION )
            L.GeraListaR();          
         else{
             JOptionPane.showMessageDialog(null, "Para Preencher a lista digite 10 n�meros:");
             for( int i=1; i <= 10; i++ )
                 L.Incluir( Integer.parseInt( JOptionPane.showInputDialog("Digite o "+ i +" (o,a) N�mero:") ) );
         }
             
         L.MostrarLista();
         
         while ( JOptionPane.showConfirmDialog(null,"Sim Excluir valor, N�o Sai do programa","Excluir",JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION && !L.ListaVazia() ){
             L.ExcluirOcorenciasListaR(Integer.parseInt( JOptionPane.showInputDialog("Digite o Valor que deseja excluir")));
             L.MostrarLista();
         }
     }
    
}
