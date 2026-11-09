-- Uma linha por pedido, com todos os status para a conferência da base.
-- As medidas do Power BI aplicam a regra de considerar apenas concluídos.
SELECT
    pedido_id,
    data_pedido,
    fornecedor,
    situacao,
    valor_total
FROM dbo.Pedido
ORDER BY pedido_id;
