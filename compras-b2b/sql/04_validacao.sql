-- Confere os resultados da amostra. Execute antes de alterar os dados.
IF (
    SELECT COUNT(*)
    FROM dbo.Pedido
    WHERE situacao = 'Concluido'
) <> 6
    THROW 50001, N'A amostra deveria ter seis pedidos concluídos.', 1;

IF COALESCE((
    SELECT SUM(valor_total)
    FROM dbo.Pedido
    WHERE situacao = 'Concluido'
), 0) <> 10200.00
    THROW 50002, N'O total correto da amostra deveria ser 10200.', 1;

IF COALESCE((
    SELECT SUM(p.valor_total)
    FROM dbo.Pedido AS p
    JOIN dbo.ItemPedido AS i ON i.pedido_id = p.pedido_id
    WHERE p.situacao = 'Concluido'
), 0) <> 18000.00
    THROW 50003, N'O total inflado da amostra deveria ser 18000.', 1;

IF EXISTS (
    SELECT p.pedido_id
    FROM dbo.Pedido AS p
    LEFT JOIN dbo.ItemPedido AS i ON i.pedido_id = p.pedido_id
    GROUP BY p.pedido_id, p.valor_total
    HAVING p.valor_total <> COALESCE(SUM(i.quantidade * i.preco_unitario), 0)
)
    THROW 50004, N'Um pedido não confere com a soma de seus itens.', 1;

SELECT N'Amostra validada' AS resultado;
