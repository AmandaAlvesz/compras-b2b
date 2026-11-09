# Montagem do painel no Power BI Desktop

1. Importe [pedidos.csv](../dados/pedidos.csv) como Texto/CSV. Use UTF-8 e vírgula como delimitador. Renomeie a tabela para `Pedidos`.
2. Confirme os tipos no Power Query. Use número inteiro para `pedido_id`, data para `data_pedido`, texto para `fornecedor` e `situacao`, e número decimal fixo para `valor_total`. Se o ponto decimal for interpretado incorretamente, converta a coluna de valor com a localidade **Inglês (Estados Unidos)**.
3. Crie as três medidas de [medidas.dax](medidas.dax), uma de cada vez. Formate **Total de compras** e **Ticket médio** como moeda em reais.
4. Adicione três cartões, um por medida. Para o gráfico mensal, use a hierarquia de data até mês com o ano de 2026 selecionado. Para o gráfico de fornecedores, use `fornecedor` no eixo e **Total de compras** como valor.
5. Adicione filtros de data e fornecedor e confira os resultados abaixo. Depois de montar e verificar o painel, salve seu arquivo `.pbix`.

| Recorte | Total de compras | Pedidos concluídos | Ticket médio |
|---|---:|---:|---:|
| Trimestre completo | R$ 10.200,00 | 6 | R$ 1.700,00 |
| Janeiro | R$ 2.400,00 | 2 | R$ 1.200,00 |
| Fevereiro | R$ 3.000,00 | 2 | R$ 1.500,00 |
| Março | R$ 4.800,00 | 2 | R$ 2.400,00 |
| Beta Industrial | R$ 3.000,00 | 2 | R$ 1.500,00 |

A [prévia do relatório](../dados/previa.png) foi gerada a partir da amostra e serve de referência visual para montar o painel.
