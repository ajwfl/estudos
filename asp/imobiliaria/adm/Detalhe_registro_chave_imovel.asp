<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
codigo=request("codigo")
quadro=request("quadro")

set itens = conn.execute("select * from registro_chave_imovel where status=0 and cod_imovel="&codigo)
%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMA��O LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%>&quadro=<%=quadro%>" name="form1">
<table border="0" width="777" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <table width="778" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td bgcolor="#6C7692"><img src="../denilson/dot_transparent.gif" width="1" height="2"></td>
        </tr>
        <tr> 
          <td></td>
        </tr>
        <tr> 
          <td bgcolor="#999999"><img src="../denilson/dot_transparent.gif" width="1" height="1"></td>
        </tr>
        <tr>
          <td bgcolor="#CCCCCC"><img src="../denilson/dot_transparent.gif" width="1" height="2"></td>
        </tr>
      </table>
      <br>
      <table border="0" align=left width=380 cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <br>
            <span span class="estilo">&nbsp;&nbsp;<b>Para cadastrar um nova aus�ncia chave siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbsp;A chave deve est� na imobiliaria.<br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
          </td>
        </tr>
        <tr>
          <td>
            <%if msg<>"" then%>
               <table cellpadding="0" cellspacing="0" border="0" height=100 width="170">
                 <tr>
                   <td height=1><img src="../img/img_S_E.gif" border="0"></td>
                   <td height=1 width="100%" background="../img/img_S.gif">&nbsp;&nbsp;<font color="#FFFFFF"><b>Erros Encontrados</b></font></td>
                   <td height=1><img src="../img/img_S_D.gif" border="0"></td>
                 </tr>
                 <tr>
                   <td height=1 background="../img/img_E.gif">&nbsp;</td>
                   <td valign="top" height=100% width="100%">
                     <font color="#CC0000"><%=msg%></font>
                   </td>
                   <td height=1 background="../img/img_D.gif">&nbsp;</td>
                 </tr>
                 <tr>
                   <td height=1>
                     <img src="../img/img_I_E.gif" border="0">
                   </td>
                   <td height=1 width="100%" background="../img/img_I.gif">&nbsp;</td>
                   <td height=1>
                     <img src="../img/img_I_D.gif" border="0">
                   </td>
                 </tr>
               </table>
            <%end if%>
          </td>
        </tr>
        <tr>
          <td><br></td>
        </tr>
        <tr>
          <td>
            &nbsp;&nbsp;<a href="<%=pagina%>.asp?codigo=<%=codigo%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_14.gif">&nbsp;DETALHE AUS�NCIA DE CHAVE<br><br>
          </td>
          <td bgcolor="#FFFFFF">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td>
            <span class="estilo">Im�vel:
          </td>
        </tr>
        <tr>
          <td>
            <%set imoveis = conn.execute("select * from imoveis where status=0 and codigo="&codigo)%>
            <%=imoveis("descricao")%>
          </td>
        </tr>
        <tr>
          <td>
            <span class="estilo">Posi��o no quadro de chaves:&nbsp;<b><%=quadro%></b>
          </td>
        </tr>
        <tr>
          <td>
            <span class="estilo">Corretor:
          </td>
        </tr>
        <tr>
           <td colspan=2>
                 <%set corretores=conn.execute("select * from corretor where codigo="&itens("cod_corretor"))%>
                 <%=corretores("nome")%>
           </td>
         </tr>
         <tr>
           <td>
             <table cellpadding="0" cellspacing="0" border="0" width=220>
	         <tr>
	          <td>
	            <span class="estilo">Data de sa�da:
	          </td>
	          <td>
	            <span class="estilo">Data de chegada:
	          </td>
	        </tr>
	        <tr>
	           <td>
	             <%=itens("data_saida")%>
	           </td>
	           <td>
	             <%=itens("data_chegada")%>
	           </td>
	         </tr>
	     </table>
	   </td>
	 </tr> 
	 <tr>
           <td>
             <table cellpadding="0" cellspacing="0" border="0" width=220>
	         <tr>
	          <td>
	            <span class="estilo">Hora de sa�da:
	          </td>
	          <td>
	            <span class="estilo">Hora de chegada:
	          </td>
	        </tr>
	        <tr>
	           <td>
	              <%=itens("hora_saida")%>
	           </td>
	           <td>
	              <%=itens("data_chegada")%>
	           </td>
	         </tr>
	     </table>
	   </td>
	 </tr>           
         <tr>
          <td>
            <span class="estilo">Coment�rios:
          </td>
        </tr>
        <tr>
          <td width=250>
            <%=itens("descricao")%>
          </td>
        </tr>          
      </table>
    </td>
  </tr>
</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

