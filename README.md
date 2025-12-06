# sistema de atendimento medico - neo4j

descricao
sistema simples de consultorio medico usando neo4j (banco de grafos).
contem medicos, especialidades, hospitais, planos de saude, pacientes e consultas.

modelo de dados

nos
- medico       (nome, crm)
- especialidade(nome)                -> pediatra, oftalmologista, cardiologista
- hospital     (nome, endereco)
- planosaude   (nome, tipo)
- paciente     (nome, cpf, nascimento)

relacionamentos
- medico -[:tem_especialidade]-> especialidade
- medico -[:atende_em]-> hospital
- medico -[:aceita_plano]-> planosaude
- paciente -[:tem_plano]-> planosaude
- paciente -[:fez_consulta {data, motivo}]-> medico

como executar

1. subir neo4j com docker
docker run -d --name neo4j -p 7474:7474 -p 7687:7687 -e NEO4J_AUTH=neo4j/senha123 neo4j:5

2. acessar interface
http://localhost:7474
usuario: neo4j
senha: senha123

3. criar o banco
abrir o neo4j browser, copiar todo o conteudo do arquivo script_completo.cypher e executar.

4. ver o grafo
match (n) return n;

5. rodar as consultas
usar o arquivo consultas.cypher (contem as 7 consultas pedidas).

consultas incluidas
1. medicos de uma especialidade
2. medicos que aceitam determinado plano
3. hospitais e seus medicos
4. consultas de um paciente
5. especialidades disponiveis em um hospital
6. medicos compativeis com o plano de um paciente
7. total de consultas por medico

estrutura do projeto
exercicio_neo4j_atendimento_medico/
├── readme.txt
├── script_completo.cypher     # cria todos os nos e relacionamentos
├── consultas.cypher         # 7 consultas do exercicio
└── .gitignore

dados inseridos
- 3 especialidades
- 6 medicos
- 5 hospitais
- 3 planos de saude
- 5 pacientes
- 10 consultas com data e motivo