<!--#INCLUDE FILE ="chamar_banco.asp"-->
<!--#INCLUDE FILE ="funcao_senha.asp"-->
<!--#INCLUDE FILE ="CPF_CNPJ.asp"-->
<!--#include file="aDOVBS.inc" -->
<%




nome 				= request("nome")
Email 				= request("Email1")
Email2 				= request("Email2")
ddd 				= request("ddd")
identidade 			= request("identidade")
cpf 				= request("cpf")
Cep 				= request("Cep")
estado 				= request("estado")
cidade 				= request("cidade")
transacao 			= request("transacao")
tipo_imovel 		= request("tipo_imovel")
Acao=Captura 		= request("Captura")
sub_tipo_imovel 	= request("sub_tipo_imovel")




pagina			=	request("pagina")
cliente			=	request("cliente")
estado			=	request("estado")
cidade			=	request("cidade")
tipo_imovel		=   request("tipo_imovel")
Sub_tipo_imovel =   request("sub_tipo_imovel")
cont			=	replace(trim(ucase(request("cont"))),"'","")
reload			=	request("reload")


if estado="" then
   estado=0
end if

if request("flag") <> "1" then

   Set objClientes = new clientes
   
   objClientes.codigo =  cliente
   
   rsBuscar = objCliente.buscar()
   if not rsBuscar.eof then
		nome    =	replace(trim(ucase(rsBuscar("nome"))),"'","")
		email   =	replace(trim(ucase(rsBuscar("email"))),"'","")
		ddd     =	replace(trim(ucase(rsBuscar("ddd_fone"))),"'","")
		fone    =	replace(trim(ucase(rsBuscar("fone"))),"'","")
   end if
   
   If clientes("identidade") <> "" then
     identidade=replace(trim(ucase(clientes("identidade"))),"'","")
   Else
     identidade=""
   End If
   cpf     =replace(trim(ucase(clientes("cpf"))),"'","")
   
else

   nome    =replace(trim(ucase(request("nome"))),"'","")
   email   =replace(trim(ucase(request("email"))),"'","")
   email2  =replace(trim(ucase(request("email2"))),"'","")
   ddd     =replace(trim(ucase(request("ddd"))),"'","")
   fone    =replace(trim(ucase(request("fone"))),"'","")
   identidade=replace(trim(ucase(request("identidade"))),"'","")
   cpf     =replace(trim(ucase(request("cpf"))),"'","")
   cep     =replace(trim(ucase(request("cep"))),"'","")
   transacao=replace(trim(ucase(request("transacao"))),"'","")
   tipo_imovel    =request("tipo_imovel")
   sub_tipo_imovel    =request("sub_tipo_imovel")
   categoria    =request("categoria")
   area    =replace(trim(ucase(request("area"))),"'","")
   estado    =request("estado")
   cidade    =request("cidade")


   if cont="" then
      cont=0
   end if
   
   if nome="" then
      msg=msg& "&nbsp; Nome.<br>"
   end if
   if not IsValidEmail(Email) then
      msg=msg& "&nbsp; Email.<br>"
   end if
   if email2 = "" then
      msg=msg& "&nbsp; Confirmar Email.<br>"
   end if
   if not IsValidEmail(Email) <> not IsValidEmail(Email2) then
      msg=msg& "&nbsp; Confirmar Email.<br>"
   end if
   if ddd="" then
     msg=msg& "&nbsp; DDD.<br>"
   end if
   if fone="" then
      msg=msg& "&nbsp; Fone.<br>"
   end if
   'if identidade="" then
   '   msg=msg& "&nbsp; Identidade.<br>"
   'end if   
   if cpf<>"" then
      cpf=replace(cpf,".","")
      cpf=replace(cpf,"-","")
      if not CalculaCPF(cpf) then
         msg=msg&" CPF Inv�lido<br>"
      end if
    end if
   if cep="" then
      msg=msg& "&nbsp; CEP do Im�vel.<br>"
   end if   
   if transacao="" then
      msg=msg& "&nbsp; Transa��o.<br>"
   end if
   if tipo_imovel="" then
      msg=msg& "&nbsp; Tipo.<br>"
   end if
   if estado="" or estado="0" then
      msg=msg& "&nbsp; Estado.<br>"
   end if
   if cidade="" or cidade = "0" then
      msg=msg& "&nbsp; Cidade.<br>"
   end if
   if area="" then
      msg=msg& "&nbsp; �rea �til.<br>"
   end if

   if msg="" then
      sqlins = "insert into registro_cliente_imovel (nome, email, ddd, fone, identidade, cpf, cep_imovel,transacao, tipo, subtipo, estado, cidade, area,contato, data_inclusao) values ('"&nome&"', '"&email&"', '"&ddd&"', '"&fone&"', '"&identidade&"', '"&cpf&"', '"&cep&"',"&transacao&", "&tipo_imovel&", "&sub_tipo_imovel&", "&estado&", "&cidade&", "&area&", "&cont&", convert(datetime,'"&date()&"',103))"
     ' response.write sqlins
     ' response.end
      conn.execute(sqlins)
      set cod_registro=conn.execute("select * from registro_cliente_imovel where nome='"&nome&"' and  email='"&email&"' and  ddd='"&ddd&"' and  fone='"&fone&"' and  identidade='"&identidade&"' and  cpf='"&cpf&"' and  cep_imovel='"&cep&"' and transacao="&transacao&" and  tipo="&tipo_imovel&" and cidade="&cidade&" and estado="&estado&" and area="&area&" and contato="&cont)%>
        <script>
           alert('Cadastrado efetuado com sucesso!');
           location.href="Main_Imoveis_Net2.asp?codigo=<%=cod_registro("codigo")%>&cod_estado=<%=estado%>&cod_cidade=<%=cidade%>&cep_imovel=<%=cep%>&cod_cliente=<%=cliente%>&tipo_imovel=<%=tipo_imovel%>&subtipo_imovel=<%=subtipo_imovel%>&categoria=<%=categoria%><%if request("str") = "cad" then%>&str=cad<%end if%>";
        </script>  
   <%end if%>
<%end if%>
<html>
<head> 

<title>:::::www.plenanet.com.br:::::</title>
<script language="javascript" src="formatacao.js"></script>
<link rel="stylesheet" href="estilo.css" type="text/css">
<meta name="description" content="BIG SOLUTIONS TECNOLOGIA DA INFORMA��O LTDA">

</head>
<body marginheight="0" marginwidth="0" leftmargin=0 topmargin=0 bgcolor="#F4F2EA" text="#333333" link="#333333" vlink="#333333" alink="#333333">
<table border="0" width="777" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td>
        <!--#INCLUDE FILE ="Main_Topo.asp"-->      
          <table width="99%"  border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td><table width=99% align="center" class="tabela001">
                <form method="post" action="<%=request.servervariables("SCRIPT_NAME")%>?flag=1&pagina=<%=pagina%>&currentPage=<%=currentPage%>&cliente=<%=cliente%><%if request("str") = "cad" then%>&str=cad<%end if%>" name="formins">
                  <input type=hidden name="reload">
                  <tr>
                    <td></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td><table width=99% border=0 align="center" cellpadding="0" cellspacing="0" class="tabela002">
                <tr>
                  <td width=20><img src="../img/r_8.gif"></td>
                  <td class="tb"><B>CADASTRAR IM&Oacute;VEL</B>&nbsp;</td>
                </tr>
              </table></td>
            </tr>
          </table>          
          <br>
          <br>
          <br>
          <%If request("str") = "cad" then%>
          <%End If%>
        <table border="0" width=100% align=LEFT border=0 cellpadding="4">
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Nome:
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" name="Nome" value="<%=Nome%>" maxlength=50 label="Nome" style="width:290; height:17; ">
          </td>
        </tr>
        <tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Email:&nbsp;&nbsp;
        </tr>
        <tr>
          <td>
            <%=Email%>
            <input type="hidden" name="Email" value="<%=Email%>">
          </td>
        </tr>
        <!--tr>
          <td>
            <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Confirma��o de Email:
          </td>
        </tr>
        <tr>
          <td-->
            <input type="hidden" name="Email2" value="<%=Email%>">
          <!--/td>
        </tr-->
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0 border=0>
              <tr>
                <td>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">DDD:
                </td>
                <td width=140>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Fone:
                </td>
              </tr>
              </tr>
            </table>
          </td>
         </tr>
         <tr>
          <td>
            <table cellspacing=0 cellpadding=0 border=0>
              <tr>
                <td>
                  <input type="text" name="ddd" value="<%=ddd%>" maxlength=2 label="Identidade" style="width:45; height:17; " onKeyPress="Numero()">
                </td>
                <td width=140>
                  <input type="text" name="fone" value="<%=fone%>" maxlength=8 label="Identidade" style="width:90; height:17; " onKeyPress="Numero()">
                </td>
            </table>
          </td>
        <tr>
          <td>
            <table width="100%" cellpadding=1 cellspacing=1>
         <tr>
           <td>
             &nbsp;&nbsp;<span class="estilo">&nbsp;Identidade:
          </td>
         </tr>
         <tr>
          <td>
		          <input type="text" name="identidade" value="<%if request("identidade")<>"" then response.write(trim(request("identidade")))else response.write trim(identidade)end if%>" maxlength=15 label="Identidade" style="width:145; height:17; " onKeyPress="Numero()">
          </td>
         </tr>
      <tr>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;CPF:
       </td>
      </tr>
      <tr>
          <td>
            <%=cpf%>
            <input type="hidden" name="cpf" value="<%=cpf%>" label="Identidade">
          </td>
      </tr>
      <tr>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;CEP do Im�vel:
       </td>
      </tr>
      <tr>
        <td>
          <input type="text" name="cep" value="<%=cep%>" maxlength=10 label="suites" style="width:70; height:17; " onKeyPress="Numero();CEP(this)">&nbsp;&nbsp;<a HREF="javascript:chamar_cep()"><span span class="estilo"><img src="../img/correios.gif" alt="Consultar correios" border=0></a>
        </td>
      </tr>        <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td width=140>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Estado:
                </td>
                <td width=140>
                  <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">Cidade:
                </td>
              </tr>
              </tr>
            </table>
          </td>
         </tr><tr>
          <td>
            <table cellspacing=0 cellpadding=0>
              <tr>
                <td>
                  <select name="estado" style="width:140;" onChange="document.formins.reload.value='3';document.formins.cidade.value='0';document.formins.submit()" >
                    <option value = "0">(Selecione)</option>
                    <%set cbai=conn.execute("select * from estado where status=0 ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))= estado then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
                <td>
                  <select name="cidade" style="width:140;">
                    <option value = "0">(Selecione)</option>
                    <%set cbai=conn.execute("select * from cidade where status=0 and cod_estado="&estado&" ORDER BY descricao")%>
                    <%do while not cbai.eof %>
                      <%if cstr(cbai("codigo"))=cidade then%>
                         <option value="<%=cbai("codigo")%>" selected><%=cbai("descricao")%>
                      <%else%>
                         <option value="<%=cbai("codigo")%>"><%=cbai("descricao")%>
                      <%end if%>
                      <%cbai.movenext%>
                    <%loop%>
                  </select>
                </td>
              </tr>
            </table>
          </td>
      </tr>
      <tr>
       <td>
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Transa��o:
       </td>
      </tr>
      <tr>
        <td>
<%
' Para transa��o regra de negocio:
'Venda 
'Loca��o
'Loca��o Temporada
%>          
		  
		  <select name="transacao" style="width:140;">
            <option value = "">(Selecione)</option>
              <%set cbai=conn.execute("select * from servico where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(transacao) then%>
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
        <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Tipo Imovel:
       </td>
      </tr>
      <tr>
        <td>
 <%
		   'Selecione o tipo de imovel regra de neg�cio 
		   'Apartamento
		   'Casa
		   'Terreno
		   'Rural
		   'Flat
		   'Comercial/Industrial
%>
          <select name="tipo_imovel" style="width:140;" onChange="PassaTipo();">

			<option value = "">(Selecione)</option>
              <%set cbai=conn.execute("select * from tipo_imovel where status=0 ORDER BY descricao")%>
              <%do while not cbai.eof %>
                <%if cstr(cbai("codigo"))=cstr(tipo_imovel) then%>
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
            <table cellspacing=0 cellpadding=0>
         <tr>
           <td>	
             <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Subtipo de Imovel:
          </td>
         </tr>
         <tr>
          <td>
   <%
		  'Para Subtipo Imovel temos a regra de neg�cio
		   'Apartamento
	                'Apartamento Padr�o
					'Kitchenette
					'Studio
					'Loft
		   'Casa
		   			'Casa Padr�o
					'Casa Condom�nio
					'Casa Vila
		   'Terreno
		   			'Terreno Padr�o
					'Terreno Condom�nio
		   'Rural
		   			'Ch�cara
					'Fazenda
					'Haras
					'S�tio
		   'Flat
		   			'Flat Pad�o

		   'Comercial/Industrial
		   			'Casa Comercial
					'Conj. Comercial
					'Box
					'Sala
					'Loja
					'Loja Shopping
					'Loja Centro Comercial
					'Sal�o
					'Dep�sito
					'Galp�o
					'Garagem
					'Armaz�m
					'Pr�dio Inteiro
					'Hotel
					'Motel
					'Pousada
					'Chal�
					'St�dio
					'Industria
					
					'Seleciona din�micamente o subtipo de imovel de acordo com o tipo de imovel selecionado ocorrendo isso no onchande do campo tipo do imovel
					if request("tipo_imovel")<>"" then 
				    StrSubTipo ="Select * from tipo_subtipo_imovel where tipo_imovel = " & tipo_imovel
                    set SubTipo = conn.execute(StrSubTipo)
%>          
		    <select name="sub_tipo_imovel" style="width:140;" onChange="PassaSubTipo()">
              <option value = "">(Selecione)</option>
              <%do while not SubTipo.eof %>                
                  <option value="<%=SubTipo("codigo")%>" <%if trim(request("sub_tipo_imovel"))=trim(SubTipo("codigo"))then%>Selected<%end if%>><%=SubTipo("descricao")%></option>				                 
                <%SubTipo.movenext%>
               <%loop%>            
            </select>
          </td>
         </tr>
		 <%
		 end if
		 %>
        </table>
        </td>
      </tr>
      <tr>
        <td>
          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;Categoria:
        </td>
      </tr>
      <tr>
        <td>       
		<%
		if request("tipo_imovel")<>"" then 
				    StrSubTipo ="Select * from tipo_categoria where tipo_imovel = " & request("tipo_imovel")
                     set SubTipo = conn.execute(StrSubTipo)
					 
					
		  %>          
		    <select name="categoria" style="width:140;">
              <option value = "">(Selecione)</option>
              <%do while not SubTipo.eof %>                
                  <option value="<%=SubTipo("codigo")%>" <%if trim(request("sub_tipo_imovel"))=trim(SubTipo("codigo"))then%>Selected<%end if%>><%=SubTipo("descricao")%></option>				                 
                <%SubTipo.movenext%>
               <%loop%>            
            </select>
		<%end if%>	
        </td>
      </tr>
      <tr>
        <td>
          <img src="../img/obrigacao.gif">&nbsp;<span class="estilo">&nbsp;�rea �til:
        </td>
      </tr>
      <tr>
        <td>
          <input type="text" name="area" value="<%=area%>" maxlength=8 label="suites" style="width:60; height:17;" onKeyPress="Numero()"> m�
        </td>
      </tr>
      <tr>
        <td>
           <%if cont = "0" then%>
             <input type="checkbox" name="cont" value="1"  label="suites" ><span class="estilo">Desejo ser contatado por telefone.</span>
           <%else%>
             <input type="checkbox" name="cont" value="0"  checked label="suites" ><span class="estilo">Desejo ser contatado por telefone.</span>
           <%end if%>
        </td>
      </tr>
      <tr>
        <td>
         <table border=0>
          <tr>
          <td>
            <table cellspacing=0 cellpadding=0>
        <tr>
           <td align=center>
             <br>
             <input name="image" type="image" value="submit" src="../../imagens/botoes/GRAVAR1.gif" width="86" height="26" border=0>
            </td>
        </tr>
    </table>
    </td>
   </tr>
    </table>
    </td>
   </tr>
    
    </td>
  </tr>
</table>

</form>
<script>


function PassaTipo()
	{
		//Dados etapa 1 cadastro de im�veis Plenanet 
		

		
		var nome  			= document.formins.Nome.value;
		var Email  			= document.formins.Email.value;
		var Email2			= document.formins.Email2.value;
		var ddd				= document.formins.ddd.value;
		var fone 			= document.formins.fone.value;
		var identidade		= document.formins.identidade.value;
		var cpf 			= document.formins.cpf.value;
		var Cep				= document.formins.cep.value;
		var estado			= document.formins.estado.value;
		var cidade			= document.formins.cidade.value;
		var transacao      	= document.formins.transacao.value;
		var tipo_imovel    	= document.formins.tipo_imovel.value;		
		// passa os parametros nos eventos din�micos de sele��o Tipo, Subtipo e Categoria de Imoveis
		window.location.href='Main_Imoveis_Net.asp?cliente=<%=request("cliente")%>&pagina=<%=request("pagina")%>&nome='+nome+"&Email="+Email+"&Email2="+Email2+"&ddd="+ddd+"&identidade="+identidade+"&cpf="+cpf+"&Cep="+Cep+"&estado="+estado+"&cidade="+cidade+"&transacao="+transacao+"&tipo_imovel="+tipo_imovel+"&Acao=Captura";
		
		
	}
	
	
	function PassaSubTipo()
	{
		//Dados etapa 1 cadastro de im�veis Plenanet 
		
		var nome  			= document.formins.Nome.value;
		var Email  			= document.formins.Email.value;
		var Email2			= document.formins.Email2.value;
		var ddd				= document.formins.ddd.value;
		var fone 			= document.formins.fone.value;
		var identidade		= document.formins.identidade.value;
		var cpf 			= document.formins.cpf.value;
		var Cep				= document.formins.cep.value;
		var estado			= document.formins.estado.value;
		var cidade			= document.formins.cidade.value;
		var transacao      	= document.formins.transacao.value;
		var tipo_imovel    	= document.formins.tipo_imovel.value;
		var sub_tipo_imovel = document.formins.sub_tipo_imovel.value;
		
		
		// passa os parametros nos eventos din�micos de sele��o Tipo, Subtipo e Categoria de Imoveis
		window.location.href='Main_Imoveis_Net.asp?cliente=<%=request("cliente")%>&pagina=<%=request("pagina")%>&nome='+nome+"&Email="+Email+"&Email2="+Email2+"&ddd="+ddd+"&identidade="+identidade+"&cpf="+cpf+"&Cep="+Cep+"&estado="+estado+"&cidade="+cidade+"&transacao="+transacao+"&tipo_imovel="+tipo_imovel+"&sub_tipo_imovel="+sub_tipo_imovel+"&Acao=Captura";
		//&sub_tipo_imovel="+sub_tipo_imovel+"&Categoria="+Categoria+"
		
	}


</script>
</body>
</html>

