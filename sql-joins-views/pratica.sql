-- Traga todos os dados da cliente Maria Silva.
SELECT * FROM clientes WHERE nome = 'Maria Silva';

-- Busque o ID do pedidov e o ID do cliente dos pedidos onde o status esteja como entregue.
SELECT id, idcliente, status 
FROM pedidos
WHERE status = 'Entregue';

-- Retorne todos os produtos onde o preço seja maior que 10 e menor que 15.
SELECT * FROM produtos
WHERE preco > 10 
AND preco < 15;

-- Busque o nome e cargo dos colaboradores que foram contratados entre 2022-01-01 e 2022-06-31.
SELECT nome, cargo
FROM colaboradores
WHERE datacontratacao > '2022-01-01'
AND datacontratacao < '2022-06-31';

-- Recupere o nome do cliente que fez o primeiro pedido.
SELECT nome
FROM clientes c 
INNER JOIN pedidos p 
ON c.id = p.idcliente
ORDER BY p.id
LIMIT 1;

-- Liste os produtos que nunca foram pedidos.
SELECT nome
FROM produtos
WHERE id NOT IN (
	SELECT idProduto
	FROM itenspedidos);

-- Liste os nomes dos clientes que fizeram pedidos entre 2023-01-01 e 2023-12-31.
SELECT nome
FROM clientes c
INNER JOIN pedidos p
ON c.id = p.idcliente
WHERE p.datahorapedido
BETWEEN '2023-01-01' AND '2023-01-31';

-- Recupere os nomes dos produtos que estão em menos de 15 pedidos.
SELECT nome
FROM produtos p 
INNER JOIN itenspedidos ip 
ON p.id = ip.idproduto
GROUP BY p.nome
HAVING COUNT(ip.idpedido) < 15;

-- Liste os produtos e o ID do pedido que foram realizados pelo cliente "Pedro Alves" ou pela cliente "Ana Rodrigues".
SELECT p.nome, ip.idpedido
FROM produtos p 
INNER JOIN itenspedidos ip
ON p.id = ip.idproduto
INNER JOIN pedidos pd 
ON ip.idpedido = pd.id
INNER JOIN clientes c 
ON pd.idcliente = c.id
WHERE c.nome IN ('Pedro Alves', 'Ana Rodrigues');

-- Recupere o nome e o ID do cliente que mais comprou(valor) no Serenatto.
SELECT p.idcliente, c.nome, (ip.quantidade * ip.precounitario) AS valor
FROM clientes c 
INNER JOIN pedidos p 
ON c.id = p.idcliente
INNER JOIN itenspedidos ip
ON p.id = ip.idpedido
GROUP BY p.idcliente
ORDER BY valor DESC 
LIMIT 1;