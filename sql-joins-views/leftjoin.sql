SELECT c.nome, p.id
FROM clientes c 
FULL JOIN pedidos p 
ON c.id = p.idcliente
WHERE strftime('%m', p.datahorapedido) = '10';