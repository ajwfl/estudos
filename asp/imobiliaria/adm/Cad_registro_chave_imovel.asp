<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%
pagina=request("pagina")
imovel=request("imovel")
quadro=request("quadro")

if request("flag") = 1 then
   corretor    = replace(trim(ucase(request("corretor"))),"'","")
   descricao   = replace(trim(ucase(request("descricao"))),"'","")
   data_saida  = replace(trim(ucase(request("data_saida"))),"'","")
   data_entrada= replace(trim(ucase(request("data_entrada"))),"'","")
   hora_saida  = replace(trim(ucase(request("hora_saida"))),"'","")
   hora_chegada= replace(trim(ucase(request("hora_chegada"))),"'","")
   if imovel<>"" and data_saida<>"" and data_entrada<>"" then
      set verifica_descricao = conn.execute("select * from registro_chave_imovel where cod_imovel="&imovel&" and data_saida between convert(datetime,'"&data_saida&"',103) and convert(datetime,'"&data_entrada&"',103) and data_chegada between convert(datetime,'"&data_saida&"',103) and convert(datetime,'"&data_entrada&"',103)")
      if not verifica_descricao.eof then
         msg=msg&" Aus�ncia de Chave j� cadastrada nestas datas.<br>"
      end if      
   end if
   if msg <> " Aus�ncia de Chave j� cadastrada.<br>" then   
   if corretor="0" then
     msg = msg&" Corretor.<br>"
   end if
       
   if not data_valida(data_saida,0) then   
      msg=msg&" Data de Sa�da.<br>"
   end if
   if not data_valida(data_entrada,0) then   
      msg=msg&" Data de Chegada.<br>"
   end if
   if hora_saida="" or len(hora_saida)<5 then   
      msg = msg&" Hora de sa�da.<br>"
   end if
   if hora_chegada="" then   
      msg = msg&" Hora de chegada.<br>"
   end if
   if msg="" then
      if datevalue(data_saida)>datevalue(data_entrada) then
        msg = msg&" Data de sa�da maior que data de chegada.<br>"
      end if  
   end if
   end if
   if msg="" then
      conn.execute("insert into registro_chave_imovel (cod_imovel,cod_quadro,cod_corretor,data_saida,data_chegada,hora_saida,hora_chegada,descricao,data_inclusao) values ("&imovel&","&quadro&","&corretor&",convert(datetime,'"&data_saida&"',103),convert(datetime,'"&data_entrada&"',103),'"&hora_saida&"','"&hora_chegada&"','"&descricao&"',convert(datetime,'"&date()&"',103))")%>
      <script>
         alert('Cadastro efetuado com sucesso!');
         location.href="<%=pagina%>.asp?codigo=<%=imovel%>";
      </script>
   <%end if
end if%>
<html>
<head>
<title>:::::Imobi....:::</title>
<script language="javascript" src="formatacao.js"></script>
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMA��O LTDA">
<link rel="stylesheet" href="estilo.css" type="text/css">
</head>
<script language="javascript">
  function abilita(tipo)
    {
     if (tipo=='Comum')
        {
          document.form1.titpri.disabled=true;
          document.form1.img.disabled=true;
          
        }
     else
        {
          document.form1.titpri.disabled=false;
          document.form1.img.disabled=false;
        }
    }
</script>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&imovel=<%=imovel%>&quadro=<%=quadro%>" name="form1">
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
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha o campo corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAten��o no preenchimento do campo obrigat�rio.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
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
            &nbsp;&nbsp;<a href="<%=pagina%>.asp?codigo=<%=imovel%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
        <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_14.gif">&nbsp;CADASTRAR NOVA AUS�NCIA DE CHAVE<br><br>
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
            <%set imoveis = conn.execute("select * from imoveis where status=0 and codigo="&imovel)%>
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
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Corretor:
          </td>
        </tr>
        <tr>
           <td colspan=2>
             <select name="corretor" style="background=#E8E8E8;" >
               <option value = "0"></option>
                 <%set corretores=conn.execute("select * from corretor ORDER BY nome")%>
                 <%do while not corretores.eof %>
                 <%if cstr(corretores("codigo"))= cstr(corretor) then%>
                 <option value="<%=corretores("codigo")%>" selected><%=corretores("nome")%>
                 <%else%>
                 <option value="<%=corretores("codigo")%>"><%=corretores("nome")%>
                 <%end if%>
                 <%corretores.movenext%>
                 <%loop%>
              </select>&nbsp;&nbsp;&nbsp;
           </td>
         </tr>
         <tr>
           <td>
             <table cellpadding="0" cellspacing="0" border="0" width=220>
	         <tr>
	          <td>
	            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data de sa�da:
	          </td>
	          <td>
	            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Data de chegada:
	          </td>
	        </tr>
	        <tr>
	           <td>
	             <input type="text" name="data_saida" value="<%=data_saida%>" maxlength=10 size=10 label="data_saida" style="width:80; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this);">
	           </td>
	           <td>
	             <input type="text" name="data_entrada" value="<%=data_entrada%>" maxlength=10 size=10 label="data_entrada" style="width:80; height:17; background=#E8E8E8;" onkeypress="Numero();DATA(this);">
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
	            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Hora de sa�da:
	          </td>
	          <td>
	            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Hora de chegada:
	          </td>
	        </tr>
	        <tr>
	           <td>
	             <input type="text" name="hora_saida" value="<%=hora_saida%>" maxlength=5 size=5 label="hora_saida" style="width:50; height:17; background=#E8E8E8;" onkeypress="Numero();HORA(this);">
	           </td>
	           <td>
	             <input type="text" name="hora_chegada" value="<%=hora_chegada%>" maxlength=5 size=5 label="hora_chegada" style="width:50; height:17; background=#E8E8E8;" onkeypress="Numero();HORA(this);">
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
          <td>
            <textarea name="descricao" label="descricao"><%=descricao%></textarea>
          </td>
        </tr>
         <tr>
          <td align=center>
            <input type="image" src="../img/ok.gif" value="submit" border=0>
          </td>
        </tr>   
      </table>
    </td>
  </tr>
</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>

