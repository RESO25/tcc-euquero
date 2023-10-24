use euquero;

-- USUARIO
call CadastrarUsuarioFisico("andersonSilva1294@gmail.com", "37400050842", "Anderson Silva dos Anjos", "nUNUancAOU");
call CadastrarUsuarioFisico("gusta2932@hotmail.com", "91442834820", "Gustavo Pereira dos Campos", "xZbKXjiILH");
call CadastrarUsuarioFisico("vanessa.Andrade221@etec.sp.gov.br", "85606696800", "Vanessa de Andrade", "QfrlasQpSs");
call CadastrarUsuarioFisico("raiOli05@gmail.com", "73680241879", "Raissa Oliveira dos Santos", "ni7sOj7TgD");
call CadastrarUsuarioFisico("jãoAlmeida@hotmail.com", "38625551866", "João Almeida da Silva", "qthyHNMofn");

call CadastrarUsuarioFisico("raphaelresende10@gmail.com", "55502213269", "Raphael Resende", "amominhamulher");
call CriarCartao("raphaelresende10@gmail.com", 1111222233334444, "Raphael Resende", "12/27", 265);
call AdicionarSaldo("raphaelresende10@gmail.com", 100000);
select vl_saldo from usuario where nm_email_usuario = "raphaelresende10@gmail.com";

call CadastrarUsuarioFisico("fabimnhomaia@gmail.com", "22233344455", "Fábio Maia", "pepino123");
call AdicionarSaldo("fabimnhomaia@gmail.com", 100000);

call CadastrarUsuarioFisico("kaikeleimig@gmail.com", "11122233344", "Kaike Leimig", "giulia<3");
call AdicionarSaldo("kaikeleimig@gmail.com", 100000);

call CadastrarUsuarioFisico("jeffersonsantos@outlook.com", "11122233344", "Jefferson Santos", "torta");
call AdicionarSaldo("jeffersonsantos@outlook.com", 10000);

call CadastrarUsuarioFisico("anajj@gmail.com", "11122233344", "Ana Júlia", "lgtv");
call AdicionarSaldo("anajj@gmail.com", 100000);

call CadastrarUsuarioFisico("afonsoaa@outlook.com", "11122233344", "Afonso Anjos", "nicx");
call AdicionarSaldo("afonsoaa@outlook.com", 10000);

call CadastrarUsuarioJuridico("estoque@antonellaeluciamarcenarialtda.com.br", "92007661000167", "Antonella e Lúcia Marcenaria Ltda", "2soOCN169G");
call CadastrarUsuarioJuridico("desenvolvimento@cesareigorlocacoesdeautomoveisme.com.br", "09325630000100", "César e Igor Locações de Automóveis ME", "iUXLaAPdXC");
call CadastrarUsuarioJuridico("juridico@ceciliaevitoradegaltda.com.br", "248434243377", "Cecília e Vitor Adega Ltda", "wJpxC2fpWq");
call CadastrarUsuarioJuridico("faleconosco@agathaeantonioconstrucoesme.com.br", "950574620829", "Agatha e Antonio Construções ME", "DuEo02XoPl");
call CadastrarUsuarioJuridico("juridico@nathaneantoniaferragensme.com.br", "327007532599", "Nathan e Antônia Ferragens ME", "RPO0wq86gn");


-- ENDEREÇO
call CriarEndereço("andersonSilva1294@gmail.com", 59149303, "Rua Aeroporto de Imperatriz, Parnamirim - RN", 48, null, true);
call CriarEndereço("gusta2932@hotmail.com", 69917756, "Rua do Bené, Rio Branco - AC", 125, null, true);
call CriarEndereço("vanessa.Andrade221@etec.sp.gov.br", 11443640, "Loteamento João Batista Julião, Guarujá - SP", 21, null, true);
call CriarEndereço("raiOli05@gmail.com", 07832250, "Rua Evereste, Franco da Rocha - SP", 94, null, true);
call CriarEndereço("jãoAlmeida@hotmail.com", 59030490, "Rua Doutor Pedro Amorim, Natal - RN", 24, null, true);
call CriarEndereço("estoque@antonellaeluciamarcenarialtda.com.br", 89211680, "Rua Genebaldo Vieira, Joinville - SC", 87, null, true);
call CriarEndereço("desenvolvimento@cesareigorlocacoesdeautomoveisme.com.br", 89164516, "Rua Leandro Murara, Rio do Sul - SC", 68, "apt 142", true);
call CriarEndereço("juridico@ceciliaevitoradegaltda.com.br", 04430112, "Viela Aquino, São Paulo - SP", 40, "apt 21", true);
call CriarEndereço("faleconosco@agathaeantonioconstrucoesme.com.br", 76914824, "Rua Plácido de Castro, Ji-Paraná - RO", 34, null, true);
call CriarEndereço("juridico@nathaneantoniaferragensme.com.br", 59065100, "Rua Princesa Leopoldina, Natal - RN", 65, null, true);


-- CATEGORIA
INSERT INTO categoria VALUES(01, "IMÓVEIS");
INSERT INTO categoria VALUES(02, "ARTE E DECORAÇÃO");
INSERT INTO categoria VALUES(03, "VEÍCULOS");
INSERT INTO categoria VALUES(04, "CAMINHÕES E ÔNIBUS");
INSERT INTO categoria VALUES(05, "EMBARCAÇÕES");
INSERT INTO categoria VALUES(06, "ELETRO");
INSERT INTO categoria VALUES(07, "MÁQUINAS AGRÍCOLAS");
INSERT INTO categoria VALUES(08, "TECNOLOGIA");
INSERT INTO categoria VALUES(09, "RECICLAGEM");
INSERT INTO categoria VALUES(10, "INDUSTRIAL");
INSERT INTO categoria VALUES(11, "EXTRAS");

-- SUBCATEGORIA
INSERT INTO subcategoria VALUES(01, "Terrenos e Lotes", 01);
INSERT INTO subcategoria VALUES(02, "Imóveis Industriais", 01);
INSERT INTO subcategoria VALUES(03, "Imóveis Rurais", 01);
INSERT INTO subcategoria VALUES(04, "Imóveis Comerciais", 01);
INSERT INTO subcategoria VALUES(05, "Imóveis Residencias", 01);

INSERT INTO subcategoria VALUES(01, "Escritório", 02);
INSERT INTO subcategoria VALUES(02, "Residencial", 02);

INSERT INTO subcategoria VALUES(01, "Carros", 03);
INSERT INTO subcategoria VALUES(02, "Motos", 03);
INSERT INTO subcategoria VALUES(03, "Partes e Peças - Carros e motos", 03);
INSERT INTO subcategoria VALUES(04, "Área de Revenda", 03);

INSERT INTO subcategoria VALUES(01, "Ônibus", 04);
INSERT INTO subcategoria VALUES(02, "Caminhões", 04);
INSERT INTO subcategoria VALUES(03, "Partes e Peças - Ônibus e caminhões", 04);

INSERT INTO subcategoria VALUES(01, "Embarcações e navios", 05);
INSERT INTO subcategoria VALUES(02, "Peças e Acessórios", 05);
INSERT INTO subcategoria VALUES(03, "Lanchas e barcos", 05);

INSERT INTO subcategoria VALUES(01, "Colecionáveis", 11);


-- ANÚNCIO
call CriarAnuncio("desenvolvimento@cesareigorlocacoesdeautomoveisme.com.br", "2023-10-23", "Roda do McLaren dirigido por Ayrton Senna", "Essa peça é uma raridade que esteve presente na vitória de Ayrton Senna pelo campeonato mundial de Fórmula 1.", 50000.00, null);
call CriarAnuncio("andersonSilva1294@gmail.com", "2023-12-01", "Troféu do Messi pelo PSG", "O produto se resume a um troféu conquistado pelo atleta Lionel Messi. Durante sua conquista o jogador conquistou o objetivo jogando pelo time Paris Saint German.", 500000.00, null);
call CriarAnuncio("jãoAlmeida@hotmail.com", "2023-09-04", "Carta Pokémon TCG - Charizard Ex", "A carta é de extrema raridade, sendo uma EX full art em alto relevo e extramamente boa para jogos e batalhas pokémon.", 25.00, null);
call CriarAnuncio("estoque@antonellaeluciamarcenarialtda.com.br", "2023-08-30", "Pintura 'Noite Estrelada'", "Uma bela reprodução da famosa obra de Vincent van Gogh, 'Noite Estrelada', que retrata um céu estrelado sobre uma vila tranquila.", 500.00, null);
call CriarAnuncio("vanessa.Andrade221@etec.sp.gov.br", "2023-04-16", "Relógio de Edição Limitada Rolex Submariner", "Um relógio Rolex Submariner de edição limitada com design elegante e alta precisão, perfeito para colecionadores e entusiastas de relógios.", 7000.00, null);
call CriarAnuncio("estoque@antonellaeluciamarcenarialtda.com.br", "2024-02-21", "Bicicleta de Montanha Profissional", "Uma bicicleta de montanha de alta qualidade, projetada para trilhas desafiadoras e aventuras ao ar livre. Possui suspensão de alto desempenho e componentes premium.", 1200.00, 5000.00);
call CriarAnuncio("gusta2932@hotmail.com", "2024-01-01", "Coleção de Moedas Antigas", "Uma coleção rara de moedas antigas de diferentes períodos e regiões, incluindo moedas de ouro, prata e cobre. Uma oportunidade única para colecionadores numismáticos.", 2500.00, null);
call CriarAnuncio("fabimnhomaia@gmail.com", "2023-11-15", "Pintura a Óleo: Pôr do Sol em Paris.", " Uma bela obra de arte pintada à mão retratando um deslumbrante pôr do sol sobre os telhados de Paris. A pintura é feita em tela de alta qualidade e emoldurada em madeira de lei.", 500.00, null);
call CriarAnuncio("kaikeleimig@gmail.com", "2023-12-10", "Antiguidade: Máquina de Escrever Vintage", "Uma máquina de escrever vintage em perfeito estado de funcionamento. Este item retro é uma peça de decoração única e pode ser usado por amantes de antiguidades e escritores.", 300.00, null);
call CriarAnuncio("raiOli05@gmail.com", "2023-10-20", "Drone DJI Phantom 4 Pro", "Um drone de última geração da DJI, equipado com uma câmera 4K e recursos avançados de voo. Perfeito para entusiastas de drones e cinegrafistas aéreos", 2500.00, null);
call CriarAnuncio("afonsoaa@outlook.com", "2024-01-05", "Coleção de Vinhos Finos", "Uma coleção de vinhos finos que inclui garrafas de vinho tinto e branco de regiões vinícolas renomadas. Os vinhos variam em idade e qualidade.", 1200.00, null);
call CriarAnuncio("faleconosco@agathaeantonioconstrucoesme.com.br", "2023-11-25", "Guitarra Elétrica Gibson Les Paul Custom", "Uma guitarra elétrica Gibson Les Paul Custom, conhecida por sua qualidade de som e construção excepcionais. Esta guitarra é um ícone no mundo da música e é perfeita para músicos profissionais e entusiastas.", 4500.00, null);
call CriarAnuncio("andersonSilva1294@gmail.com", "2023-11-05", "Notebook Ultraleve", "Um notebook ultrafino e leve, equipado com processador de última geração, tela de alta resolução e armazenamento SSD de grande capacidade.", 1200.00, null);
call CriarAnuncio("raiOli05@gmail.com", "2024-02-12", "Câmera DSLR Profissional", "Uma câmera DSLR de última geração, com sensor de alta resolução, diversas lentes intercambiáveis e recursos avançados para fotografia e vídeo.", 2500.00, null);
call CriarAnuncio("faleconosco@agathaeantonioconstrucoesme.com.br", "2024-03-06", "Coleção de Vinis Clássicos", "Uma coleção de vinis raros e clássicos de artistas renomados de várias décadas. Inclui álbuns icônicos em excelente estado.", 600.00, null);
call CriarAnuncio("fabimnhomaia@gmail.com", "2025-03-05", " Coleção de Miniaturas de Carros de Luxo", "Uma coleção impressionante de miniaturas detalhadas de carros de luxo de marcas famosas. Cada miniatura é feita à mão e representa carros icônicos.", 800.00, null);
call CriarAnuncio("juridico@nathaneantoniaferragensme.com.br", "2023-10-3", "Escultura de Arte Moderna", "Uma escultura contemporânea única, criada por um artista reconhecido internacionalmente. Esta peça é feita de materiais inovadores e apresenta um design abstrato e intrigante.", 2800.00, null);


-- ANÚNCIO SUBCATEGORIA
INSERT INTO anuncio_subcategoria VALUES (1, 03, 03);

INSERT INTO anuncio_subcategoria VALUES (2, 01, 02);
INSERT INTO anuncio_subcategoria VALUES (2, 02, 02);

INSERT INTO anuncio_subcategoria VALUES (3, 01, 11);

INSERT INTO anuncio_subcategoria VALUES (4, 01, 02);
INSERT INTO anuncio_subcategoria VALUES (4, 02, 02);

INSERT INTO anuncio_subcategoria VALUES (5, 01, 11);

-- INSERT INTO anuncio_subcategoria VALUES (6, );

INSERT INTO anuncio_subcategoria VALUES (7, 01, 11);


-- DAR LANCES
call DarLance(1, "fabimnhomaia@gmail.com", 750.00);
call DarLance(1, "afonsoaa@outlook.com", 850.00);
call DarLance(1, "kaikeleimig@gmail.com", 90000.00);
call DarLance(1, "fabimnhomaia@gmail.com", 950.00);
call DarLance(1, "afonsoaa@outlook.com", 1000.00);
call DarLance(1, "anajj@gmail.com", 110000.00);

call DarLance(2, "raphaelresende10@gmail.com", 600000.00);
call DarLance(2, "kaikeleimig@gmail.com", 750000.00);
call DarLance(2, "raphaelresende10@gmail.com", 800000.00);
call DarLance(2, "jeffersonsantos@outlook.com", 900000.00);
call DarLance(2, "afonsoaa@outlook.com", 1000000.00);
call DarLance(2, "jeffersonsantos@outlook.com", 1100000.00);
call DarLance(2, "jeffersonsantos@outlook.com", 1300000.00);

call DarLance(6, "jeffersonsantos@outlook.com", 1300.00);
call DarLance(6, "raphaelresende10@gmail.com", 2000.00);
call DarLance(6, "afonsoaa@outlook.com", 1300.00);

call DarLance(7, "raphaelresende10@gmail.com", 2650.00);
call DarLance(7, "kaikeleimig@gmail.com", 2870.00);
call DarLance(7, "anajj@gmail.com", 2900.00);
call DarLance(7, "kaikeleimig@gmail.com", 3200.00);

call DarLance(8, "fabimnhomaia@gmail.com", 500.00);
call DarLance(8, "kaikeleimig@gmail.com", 600.00);
call DarLance(8, "raphaelresende10@gmail.com", 650.00);
call DarLance(8, "kaikeleimig@gmail.com", 750.00);
call DarLance(8, "fabimnhomaia@gmail.com", 900.00);

call DarLance(9, "raphaelresende10@gmail.com", 600.00);
call DarLance(9, "kaikeleimig@gmail.com", 700.00);
call DarLance(9, "raphaelresende10@gmail.com", 800.00);
call DarLance(9, "jeffersonsantos@outlook.com", 900.00);
call DarLance(9, "afonsoaa@outlook.com", 1000.00);
call DarLance(9, "raphaelresende10@gmail.com", 1100.00);

call DarLance(10, "raphaelresende10@gmail.com", 2900.00);
call DarLance(10, "kaikeleimig@gmail.com", 3200.00);
call DarLance(10, "anajj@gmail.com", 3300.00);
call DarLance(10, "kaikeleimig@gmail.com", 3500.00);
call DarLance(10, "fabimnhomaia@gmail.com", 3550.00);
call DarLance(10, "anajj@gmail.com", 3600.00);


-- ANUNCIOS ENCERRADOS
call EncerrarAnuncio(3);
call EncerrarAnuncio(4);
call EncerrarAnuncio(5);