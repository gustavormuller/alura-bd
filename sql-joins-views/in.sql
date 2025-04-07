SELECT nome 
FROM clientes
WHERE id IN (
	SELECT idcliente 
  	FROM pedidos 
  	WHERE strftime('%m', datahorapedido) = '01');