SELECT c.nome, x.id
FROM clientes c 
LEFT JOIN 
(
    SELECT p.id, p.idcliente
    FROM pedidos p 
    WHERE strftime('%m', p.datahorapedido) = '10'
) x
ON c.id = x.idcliente
WHERE x.idcliente IS NULL;