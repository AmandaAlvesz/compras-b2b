-- Execute em um banco vazio dedicado a esta demonstração.
-- As tabelas e os dados são fictícios.
SET XACT_ABORT ON;
BEGIN TRANSACTION;

CREATE TABLE dbo.Pedido (
    pedido_id int NOT NULL PRIMARY KEY,
    data_pedido date NOT NULL,
    fornecedor nvarchar(80) NOT NULL,
    situacao varchar(12) NOT NULL CHECK (situacao IN ('Concluido', 'Em aberto', 'Cancelado')),
    valor_total decimal(12, 2) NOT NULL CHECK (valor_total > 0)
);

CREATE TABLE dbo.ItemPedido (
    pedido_id int NOT NULL REFERENCES dbo.Pedido(pedido_id),
    numero_item int NOT NULL,
    produto nvarchar(80) NOT NULL,
    quantidade int NOT NULL CHECK (quantidade > 0),
    preco_unitario decimal(12, 2) NOT NULL CHECK (preco_unitario > 0),
    PRIMARY KEY (pedido_id, numero_item)
);

INSERT INTO dbo.Pedido (pedido_id, data_pedido, fornecedor, situacao, valor_total) VALUES
    (101, '20260108', N'Alfa Suprimentos', 'Concluido', 1200.00),
    (102, '20260121', N'Beta Industrial', 'Concluido', 1200.00),
    (103, '20260126', N'Gama Embalagens', 'Cancelado', 500.00),
    (104, '20260205', N'Gama Embalagens', 'Concluido', 2400.00),
    (105, '20260218', N'Alfa Suprimentos', 'Concluido', 600.00),
    (106, '20260223', N'Beta Industrial', 'Em aberto', 700.00),
    (107, '20260307', N'Beta Industrial', 'Concluido', 1800.00),
    (108, '20260320', N'Gama Embalagens', 'Concluido', 3000.00);

INSERT INTO dbo.ItemPedido (pedido_id, numero_item, produto, quantidade, preco_unitario) VALUES
    (101, 1, N'Papel A4', 20, 30.00),
    (101, 2, N'Toner', 2, 300.00),
    (102, 1, N'Luvas de proteção', 40, 30.00),
    (103, 1, N'Caixa de papelão', 100, 5.00),
    (104, 1, N'Caixa de papelão', 200, 6.00),
    (104, 2, N'Filme stretch', 20, 40.00),
    (104, 3, N'Fita para embalagem', 40, 10.00),
    (105, 1, N'Papel A4', 20, 30.00),
    (106, 1, N'Óculos de proteção', 20, 35.00),
    (107, 1, N'Capacete', 20, 60.00),
    (107, 2, N'Luvas de proteção', 20, 30.00),
    (108, 1, N'Caixa de papelão', 500, 6.00);

COMMIT TRANSACTION;
