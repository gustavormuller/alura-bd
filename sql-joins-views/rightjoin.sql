SELECT pr.nome, x.idproduto, x.idpedido 
from (
  	SELECT ip.idpedido, ip.idproduto
  	FROM pedidos p 
  	JOIN itenspedidos ip 
  	ON p.id = ip.idpedido
  	WHERE strftime('%m', p.datahorapedido) = '10') x
right JOIN produtos pr
ON pr.id = x.idproduto;