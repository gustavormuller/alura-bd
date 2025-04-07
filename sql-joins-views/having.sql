SELECT nome, preco
FROM produtos
GROUP BY nome, preco
having preco > (
  	SELECT AVG(preco)
  	FROM produtos);