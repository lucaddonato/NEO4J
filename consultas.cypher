// ==========================================
// CONSULTAS SOLICITADAS NO EXERCÍCIO
// ==========================================

// ==========================================
// CONSULTA 1: Listar médicos de uma especialidade específica
// ==========================================
// Exemplo: Listar todos os médicos Pediatras
MATCH (m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade {nome: "Pediatra"})
RETURN m.nome AS Medico, m.crm AS CRM, e.nome AS Especialidade;

// Exemplo: Listar todos os médicos Oftalmologistas
MATCH (m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade {nome: "Oftalmologista"})
RETURN m.nome AS Medico, m.crm AS CRM, e.nome AS Especialidade;

// Exemplo: Listar todos os médicos Cardiologistas
MATCH (m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade {nome: "Cardiologista"})
RETURN m.nome AS Medico, m.crm AS CRM, e.nome AS Especialidade;

// ==========================================
// CONSULTA 2: Encontrar médicos que aceitam um determinado plano de saúde
// ==========================================
// Exemplo: Médicos que aceitam Unimed
MATCH (m:Medico)-[:ACEITA_PLANO]->(p:PlanoSaude {nome: "Unimed"})
RETURN m.nome AS Medico, m.crm AS CRM, p.nome AS PlanoSaude
ORDER BY m.nome;

// Exemplo: Médicos que aceitam Bradesco Saúde
MATCH (m:Medico)-[:ACEITA_PLANO]->(p:PlanoSaude {nome: "Bradesco Saúde"})
RETURN m.nome AS Medico, m.crm AS CRM, p.nome AS PlanoSaude
ORDER BY m.nome;

// Exemplo: Médicos que aceitam SulAmérica
MATCH (m:Medico)-[:ACEITA_PLANO]->(p:PlanoSaude {nome: "SulAmérica"})
RETURN m.nome AS Medico, m.crm AS CRM, p.nome AS PlanoSaude
ORDER BY m.nome;

// ==========================================
// CONSULTA 3: Listar hospitais e os médicos que atendem neles
// ==========================================
// Todos os hospitais com seus médicos
MATCH (h:Hospital)<-[:ATENDE_EM]-(m:Medico)
RETURN h.nome AS Hospital, 
       h.endereco AS Endereco, 
       COLLECT(m.nome) AS Medicos
ORDER BY h.nome;

// Exemplo: Médicos que atendem no Hospital São Lucas
MATCH (h:Hospital {nome: "Hospital São Lucas"})<-[:ATENDE_EM]-(m:Medico)
RETURN h.nome AS Hospital, m.nome AS Medico, m.crm AS CRM;

// Visualização gráfica de um hospital específico
MATCH (h:Hospital {nome: "Hospital Central"})<-[:ATENDE_EM]-(m:Medico)
RETURN h, m;

// ==========================================
// CONSULTA 4: Obter todas as consultas de um paciente
// ==========================================
// Exemplo: Consultas de Lucas Ferreira
MATCH (p:Paciente {nome: "Lucas Ferreira"})-[c:FEZ_CONSULTA]->(m:Medico)
RETURN p.nome AS Paciente, 
       m.nome AS Medico, 
       c.data AS Data, 
       c.motivo AS Motivo
ORDER BY c.data;

// Exemplo: Consultas de Juliana Souza
MATCH (p:Paciente {nome: "Juliana Souza"})-[c:FEZ_CONSULTA]->(m:Medico)
RETURN p.nome AS Paciente, 
       m.nome AS Medico, 
       c.data AS Data, 
       c.motivo AS Motivo
ORDER BY c.data;

// Exemplo: Consultas de Marcos Pereira com especialidades dos médicos
MATCH (p:Paciente {nome: "Marcos Pereira"})-[c:FEZ_CONSULTA]->(m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade)
RETURN p.nome AS Paciente, 
       m.nome AS Medico, 
       e.nome AS Especialidade,
       c.data AS Data, 
       c.motivo AS Motivo
ORDER BY c.data;

// ==========================================
// CONSULTA 5: Listar especialidades disponíveis em determinado hospital
// ==========================================
// Exemplo: Especialidades disponíveis no Hospital Central
MATCH (h:Hospital {nome: "Hospital Central"})<-[:ATENDE_EM]-(m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade)
RETURN h.nome AS Hospital, 
       COLLECT(DISTINCT e.nome) AS Especialidades;

// Exemplo: Especialidades no Hospital São Lucas com médicos
MATCH (h:Hospital {nome: "Hospital São Lucas"})<-[:ATENDE_EM]-(m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade)
RETURN h.nome AS Hospital, 
       e.nome AS Especialidade, 
       COLLECT(m.nome) AS Medicos
ORDER BY e.nome;

// Exemplo: Todos os hospitais com suas especialidades
MATCH (h:Hospital)<-[:ATENDE_EM]-(m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade)
RETURN h.nome AS Hospital, 
       COLLECT(DISTINCT e.nome) AS Especialidades
ORDER BY h.nome;

// ==========================================
// CONSULTA 6: Listar todos os médicos que podem atender ao plano de saúde de um paciente
// ==========================================
// Exemplo: Médicos disponíveis para Lucas Ferreira (Unimed)
MATCH (p:Paciente {nome: "Lucas Ferreira"})-[:TEM_PLANO]->(plano:PlanoSaude)<-[:ACEITA_PLANO]-(m:Medico)
RETURN p.nome AS Paciente, 
       plano.nome AS PlanoSaude, 
       m.nome AS Medico, 
       m.crm AS CRM
ORDER BY m.nome;

// Exemplo: Médicos disponíveis para Juliana Souza (Bradesco Saúde) com especialidades
MATCH (p:Paciente {nome: "Juliana Souza"})-[:TEM_PLANO]->(plano:PlanoSaude)<-[:ACEITA_PLANO]-(m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade)
RETURN p.nome AS Paciente, 
       plano.nome AS PlanoSaude, 
       m.nome AS Medico, 
       e.nome AS Especialidade
ORDER BY e.nome, m.nome;

// Exemplo: Médicos disponíveis para Roberto Lima (SulAmérica) com hospitais
MATCH (p:Paciente {nome: "Roberto Lima"})-[:TEM_PLANO]->(plano:PlanoSaude)<-[:ACEITA_PLANO]-(m:Medico)
MATCH (m)-[:ATENDE_EM]->(h:Hospital)
RETURN p.nome AS Paciente, 
       plano.nome AS PlanoSaude, 
       m.nome AS Medico, 
       COLLECT(h.nome) AS Hospitais
ORDER BY m.nome;

// ==========================================
// CONSULTA 7: Exibir o total de consultas realizadas por médico
// ==========================================
// Total de consultas por médico
MATCH (m:Medico)<-[c:FEZ_CONSULTA]-(p:Paciente)
RETURN m.nome AS Medico, 
       m.crm AS CRM,
       COUNT(c) AS TotalConsultas
ORDER BY TotalConsultas DESC, m.nome;

// Total de consultas por médico com especialidade
MATCH (m:Medico)<-[c:FEZ_CONSULTA]-(p:Paciente)
MATCH (m)-[:TEM_ESPECIALIDADE]->(e:Especialidade)
RETURN m.nome AS Medico, 
       e.nome AS Especialidade,
       COUNT(c) AS TotalConsultas
ORDER BY TotalConsultas DESC, m.nome;

// Total de consultas por médico incluindo médicos sem consultas
MATCH (m:Medico)
OPTIONAL MATCH (m)<-[c:FEZ_CONSULTA]-(p:Paciente)
RETURN m.nome AS Medico, 
       m.crm AS CRM,
       COUNT(c) AS TotalConsultas
ORDER BY TotalConsultas DESC, m.nome;

// ==========================================
// CONSULTAS EXTRAS (BÔNUS)
// ==========================================

// Total de consultas por especialidade
MATCH (m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade)
OPTIONAL MATCH (m)<-[c:FEZ_CONSULTA]-(p:Paciente)
RETURN e.nome AS Especialidade, 
       COUNT(c) AS TotalConsultas
ORDER BY TotalConsultas DESC;

// Pacientes com mais consultas
MATCH (p:Paciente)-[c:FEZ_CONSULTA]->(m:Medico)
RETURN p.nome AS Paciente, 
       p.cpf AS CPF,
       COUNT(c) AS TotalConsultas
ORDER BY TotalConsultas DESC;

// Hospitais mais utilizados (baseado em consultas de médicos)
MATCH (p:Paciente)-[:FEZ_CONSULTA]->(m:Medico)-[:ATENDE_EM]->(h:Hospital)
RETURN h.nome AS Hospital, 
       COUNT(*) AS TotalAtendimentos
ORDER BY TotalAtendimentos DESC;

// Planos de saúde mais utilizados
MATCH (p:Paciente)-[:TEM_PLANO]->(plano:PlanoSaude)
RETURN plano.nome AS PlanoSaude, 
       plano.tipo AS Tipo,
       COUNT(p) AS TotalPacientes
ORDER BY TotalPacientes DESC;
