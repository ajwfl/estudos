<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%pagina=request("pagina")
  codigo=request("codigo")
  cod_imovel=request("cod_imovel")
  codigo2=request("codigo2")
  set contrato = conn.execute("select * from contrato where codigo="&codigo)
if request("flag") <> 1 then
  set recisao=conn.execute("select * from recisao where cod_contrato="&codigo)
  tipo_motivo=recisao("cod_motivo")  
  descricao=replace(trim(ucase(recisao("descricao"))),"'","")
else
  tipo_motivo=request("tipo_motivo")
  descricao=replace(trim(ucase(request("descricao"))),"'","")
  if tipo_motivo = "" then
     msg = msg & "Motivo.<br>"
  end if
   if descricao = "" then
      msg=msg&" Descricao.<br>"
   end if
  if msg="" then
    conn.execute("update recisao set cod_motivo="&tipo_motivo&", descricao='"&descricao&"' where cod_contrato="&codigo)%>
     <script>
        alert('Altera��o efetuada com sucesso!');
        location.href="<%=pagina%>.asp?codigo=<%=codigo2%>";
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
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#FFFFFF" text="#333333" link="#333333" vlink="#333333" alink="#333333" onload="document.form1.tipo_motivo.focus()">
<form method=post action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&codigo=<%=codigo%>&cod_imovel=<%=cod_imovel%>&codigo2=<%=codigo2%>" name="form1">
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
            <span span class="estilo">&nbsp;&nbsp;<b>Para altera uma nova rescisao siga os passos descrito abaixo.<br><br></b>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspPreencha todos os campos corretamente.<br>
            &nbsp;&nbsp;<img src="../img/b_bullet.gif">&nbspAten��o no preenchimento dos campos obrigat�rios.&nbsp;<img src="../img/obrigacao.gif">&nbsp;<br>
            &nbsp;&nbsp;<img src="../img/helpicon.gif" border=0>&nbsp;&nbsp;Campo com ajuda &nbsp;&nbsp;<br>
          </td>
        </tr>
        <tr>
          <td>
            <%if msg<>""then%>
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
            &nbsp;&nbsp;<a href="<%=pagina%>.asp?codigo=<%=codigo2%>"><img src="../img/bot_voltar.gif" title="Voltar" border=0></a>
          </td>
        </tr>
      </table>   
      <table border="0" width=376 align=right>
       <tr>
          <td span class="estilo" width=100%>
            <img src="../img/r_14.gif">&nbsp;ALTERAR RESCIS�O
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
           <%set imov = conn.execute("select * from imoveis where codigo="&contrato("cod_imovel"))%>
           <input type="hidden" name="cod_imovel" value="<%=imov("codigo")%>">
           <span class="estilo"><b><%=imov("descricao")%></b>
         </td>
       </tr>
       <tr>
           <td>
             <span class="estilo">Cliente:
           </td>
       </tr>
       <tr>
         <td>
           <%set cliente = conn.execute("select * from clientes where codigo="&contrato("cod_cliente"))%>
           <input type="hidden" name="cliente" value="<%=cliente2%>">
           <span class="estilo"><b><%=cliente("nome")%></b>
         </td>
       </tr>
       <tr>
         <td>
           <table cellspacing=0 cellpadding=0>
            <tr>
             <td>
               <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Tipo da Rescisao:
             </td>
           </tr>    
           <tr>
            <td>
              <select name="tipo_motivo" style="width:200;background=#E8E8E8;">
                  <%set cbai=conn.execute("select * from tipo_motivo where status=0 ORDER BY descricao")%>
                  <%do while not cbai.eof %>
                  <%if cstr(cbai("codigo"))=cstr(tipo_motivo) then%>
                    <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                  <%else%>
                    <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                  <%end if%>
                <%cbai.movenext%>
               <%loop%>
              </select>
            </td>
         </tr>
         <tr>
           <td>
             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Descri��o:
           </td>
         </tr>
         <tr>
           <td>
             <input type="text" name="descricao" value="<%=descricao%>" maxlength=50 label="descricao" style="width:290; height:17; background=#E8E8E8;">
           </td>
        </tr>
        </tr>
      </table>
    </td>
  </tr>
   </table>  
     <tr> 
       <td align=center>
         <br><input type="image" src="../img/ok.gif" value="submit" border=0>
       </td>
     </tr>   
  </table>
</td>
</tr>
</table><br><br><br><br><br><br><br><br><br><br>
<table width=100% background="../img/rod_2.gif"><tr><td><br><br></td></tr></table>
</body>
</html>