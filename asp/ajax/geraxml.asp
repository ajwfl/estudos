<%
Dim xmlDoc, rootEl, child1, child2, p
Set xmlDoc = Server.CreateObject("Microsoft.XMLDOM")
Set rootEl = xmlDoc.createElement("root")
xmlDoc.appendChild rootEl

Set xmlTo = xmlDoc.createElement("to")
Set xmlFrom = xmlDoc.createElement("from")
Set xmlBody = xmlDoc.createElement("body")

rootEl.appendChild xmlTo
rootEl.appendChild xmlFrom
rootEl.appendChild xmlBody

xmlTo.Text = xmlTo.Text & " <OBJECT classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0' WIDTH=780 HEIGHT=90>"
xmlTo.Text = xmlTo.Text & "    <PARAM NAME=movie VALUE='http://www.bigsolutions.com.br/home/imagens/imagens/topo_din5d.swf'>"
xmlTo.Text = xmlTo.Text & "    <PARAM NAME=loop VALUE=false>"
xmlTo.Text = xmlTo.Text & "    <PARAM NAME=menu VALUE=false>"
xmlTo.Text = xmlTo.Text & "    <PARAM NAME=quality VALUE=high>"
xmlTo.Text = xmlTo.Text & "    <EMBED src='http://www.bigsolutions.com.br/home/imagens/topo_din5d.swf' loop=false menu=false quality=high WIDTH=780 HEIGHT=90 TYPE='application/x-shockwave-flash' PLUGINSPAGE='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash'>"
xmlTo.Text = xmlTo.Text & "    </EMBED> "
xmlTo.Text = xmlTo.Text & "</OBJECT> "

xmlFrom.Text = xmlFrom.Text & "	 HOME <br>"
xmlFrom.Text = xmlFrom.Text & "     <a href=# onclick=javascript:loadXMLDoc('geraxml.asp?troca=ok');> PRODUTOS SBS </a> <br>"
xmlFrom.Text = xmlFrom.Text & "     SOLU��ES PARA WEB <br>"
xmlFrom.Text = xmlFrom.Text & "     VENDA DE SOFTWARE  <br>"
xmlFrom.Text = xmlFrom.Text & "     <a href=# onclick=javascript:loadXMLDoc('geraxml.asp');>DIVULGUE SEU SITE</a>   <br>"
xmlFrom.Text = xmlFrom.Text & "     CLIENTES  <br>"
xmlFrom.Text = xmlFrom.Text & "     PARCEIROS  <br>"
xmlFrom.Text = xmlFrom.Text & "     SUPORTE AO CLIENTE  <br>"
xmlFrom.Text = xmlFrom.Text & "     CONTATO  <br>"

 
if  Request("troca") = "ok" then 
	xmlBody.Text = xmlBody.Text & "Presidente durante visita � periferia de Manaus<br>"
	 
	xmlBody.Text = xmlBody.Text & "O presidente Luiz In�cio Lula da Silva (PT) seria reeleito no primeiro turno se as elei��es fossem realizadas hoje em qualquer cen�rio, segundo pesquisa do Ibope divulgada nesta quinta-feira (1/6). O presidente atinge entre 62% e 63% dos votos v�lidos no primeiro turno, o que lhe garantiria, em tese, uma vota��o superior a que ele obteve no segundo turno em 2002, quando ficou com 61,3% dos votos v�lidos.<br>"

	xmlBody.Text = xmlBody.Text & "De acordo com a pesquisa, Lula tem 48% dos votos e supera a soma das inten��es de voto de todos os advers�rios, que chega a 29% no cen�rio sem candidato do PMDB, considerado o mais prov�vel. Brancos e nulos somam 14% do eleitorado. Indecisos s�o 9%. Os 48% de Lula, neste caso, equivalem a 63% dos votos v�lidos.<br>"

	xmlBody.Text = xmlBody.Text & "Atr�s de Lula, pela ordem, aparecem o pr�-candidato do PSDB, Geraldo Alckmin, com 19%, Helo�sa Helena (PSOL), com 6%, En�as (Prona), 2%, Cristovam Buarque (PDT), com 1%, e Jos� Maria Eymael (PSDC), com 1%. <br>"

	xmlBody.Text = xmlBody.Text & "Na hip�tese em que o PMDB lan�a o senador ga�cho Pedro Simon, Lula tamb�m fica com 48% dos votos. Neste caso, o �ndice do presidente equivale a 62% dos votos v�lidos. <br>"

	xmlBody.Text = xmlBody.Text & "A seguir, aparecem Alckmin com 18%, Helo�sa Helena com 5%, En�as e Simon, com 2% cada. Neste cen�rio, o Ibope incluiu o nome de Roberto Freire (PPS), que ficou com 1%. Cristovam Buarque e Jos� Maria Eymael tiveram menos de 1% da prefer�ncia. Brancos e nulos perfazem 13% do eleitorado. Indecisos chegam a 10%.<br>"

	xmlBody.Text = xmlBody.Text & "Lula tamb�m vence Alckmin em um eventual segundo turno. O presidente aparece com 53% da inten��o de votos, e o ex-governador de S�o Paulo, com 31%.<br>"

	xmlBody.Text = xmlBody.Text & "O Ibope tamb�m mediu a avalia��o do governo federal. 58% aprovam a gest�o de Lula, enquanto 36% a rejeitam, e 7% n�o souberam responder. O governo � considerado �timo por 7% dos entrevistados e bom por 31%. Segundo a pesquisa, 41% julgam o governo regular, 8% julgam ruim e 11%, p�ssimo. 1% n�o soube qualific�-lo.<br>"

	xmlBody.Text = xmlBody.Text & "Este � o primeiro levantamento do Ibope sem Anthony Garotinho ou Germano Rigotto como candidato do PMDB. Na pe�ltima pesquisa do instituto, que foi realizada nos dias 3 e 4 de mar�o e tinha Garotinho como candidato, Lula aparecia com 43%, Alckmin com 19% e o ex-governador fluminense com 14%.<br>"

	xmlBody.Text = xmlBody.Text & "Encomendada pela Rede Globo, a pesquisa tem margem de erro de dois pontos percentuais para mais ou para menos. Foi realizada entre o �ltimo domingo e a �ltima quarta-feira (de 28 a 31 de maio) e registrada no Tribunal Superior Eleitoral com o protocolo 7728/2006. Foram entrevistados 2.002 eleitores em todo o Brasil.<br>"

	xmlBody.Text = xmlBody.Text & "Na semana passada, pesquisas do Datafolha e do Instituto Sensus tamb�m apontaram a vit�ria de Lula no primeiro turno. O placar no Datafolha foi 45% para Lula e 22% para Alckmin. No Sensus, o presidente vence Alckmin por 42,7% a 20,3% (no cen�<br>"
else
	xmlBody.Text = xmlBody.Text & "Presidente durante visita � periferia de Manaus<br>"
	 
	xmlBody.Text = xmlBody.Text & "O presidente Luiz In�cio Lula da Silva (PT) seria reeleito no primeiro turno se as elei��es fossem realizadas hoje em qualquer cen�rio, segundo pesquisa do Ibope divulgada nesta quinta-feira (1/6). O presidente atinge entre 62% e 63% dos votos v�lidos no primeiro turno, o que lhe garantiria, em tese, uma vota��o superior a que ele obteve no segundo turno em 2002, quando ficou com 61,3% dos votos v�lidos.<br>"

	xmlBody.Text = xmlBody.Text & "De acordo com a pesquisa, Lula tem 48% dos votos e supera a soma das inten��es de voto de todos os advers�rios, que chega a 29% no cen�rio sem candidato do PMDB, considerado o mais prov�vel. Brancos e nulos somam 14% do eleitorado. Indecisos s�o 9%. Os 48% de Lula, neste caso, equivalem a 63% dos votos v�lidos.<br>"

	xmlBody.Text = xmlBody.Text & "Atr�s de Lula, pela ordem, aparecem o pr�-candidato do PSDB, Geraldo Alckmin, com 19%, Helo�sa Helena (PSOL), com 6%, En�as (Prona), 2%, Cristovam Buarque (PDT), com 1%, e Jos� Maria Eymael (PSDC), com 1%. <br>"

	xmlBody.Text = xmlBody.Text & "Na hip�tese em que o PMDB lan�a o senador ga�cho Pedro Simon, Lula tamb�m fica com 48% dos votos. Neste caso, o �ndice do presidente equivale a 62% dos votos v�lidos. <br>"

	xmlBody.Text = xmlBody.Text & "A seguir, aparecem Alckmin com 18%, Helo�sa Helena com 5%, En�as e Simon, com 2% cada. Neste cen�rio, o Ibope incluiu o nome de Roberto Freire (PPS), que ficou com 1%. Cristovam Buarque e Jos� Maria Eymael tiveram menos de 1% da prefer�ncia. Brancos e nulos perfazem 13% do eleitorado. Indecisos chegam a 10%.<br>"
end if

'Set referencia = XMLDoc.createAttribute("referencia")
'referencia.Text = "teste"
'xmlTo.attributes.setNamedItem(referencia)

Set p=xmlDoc.createProcessingInstruction("xml","version='1.0'")
xmlDoc.insertBefore p,xmlDoc.childNodes(0)
'response.Write server.mappath("test.xml")
xmlDoc.Save server.mappath("test.xml")
%>