-- Antes: o JOIN replica o valor do pedido para cada item.
SELECT
    COUNT(*) AS linhas_contadas_como_pedidos,
    SUM(p.valor_total) AS valor_inflado
FROM dbo.Pedido AS p
INNER JOIN dbo.ItemPedido AS i ON i.pedido_id = p.pedido_id
WHERE p.situacao = 'Concluido';

-- Depois: a origem do indicador é o cabeçalho, com uma linha por pedido.
SELECT
    COUNT(*) AS pedidos_concluidos,
    SUM(valor_total) AS valor_compras,
    CAST(AVG(valor_total) AS decimal(14, 2)) AS ticket_medio
FROM dbo.Pedido
WHERE situacao = 'Concluido';

-- Diagnóstico: lista os pedidos cujo valor apareceria mais de uma vez no JOIN.
SELECT
    p.pedido_id,
    COUNT(*) AS linhas_de_item,
    p.valor_total AS valor_pedido,
    SUM(p.valor_total) AS valor_apos_join
FROM dbo.Pedido AS p
INNER JOIN dbo.ItemPedido AS i ON i.pedido_id = p.pedido_id
WHERE p.situacao = 'Concluido'
GROUP BY p.pedido_id, p.valor_total
HAVING COUNT(*) > 1
ORDER BY p.pedido_id;
