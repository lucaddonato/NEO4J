// ==========================================
// EXERCÍCIO NEO4J - SISTEMA DE ATENDIMENTO MÉDICO
// ==========================================

// ==========================================
// 1. LIMPEZA DO BANCO DE DADOS
// ==========================================
MATCH (n) DETACH DELETE n;

// ==========================================
// 2. CRIAÇÃO DAS ESPECIALIDADES
// ==========================================
CREATE (:Especialidade {nome: "Pediatra"});
CREATE (:Especialidade {nome: "Oftalmologista"});
CREATE (:Especialidade {nome: "Cardiologista"});

// ==========================================
// 3. CRIAÇÃO DOS MÉDICOS
// ==========================================
CREATE (:Medico {nome: "Dr. Carlos Silva", crm: "12345-SP"});
CREATE (:Medico {nome: "Dra. Maria Santos", crm: "23456-SP"});
CREATE (:Medico {nome: "Dr. João Oliveira", crm: "34567-SP"});
CREATE (:Medico {nome: "Dra. Ana Costa", crm: "45678-SP"});
CREATE (:Medico {nome: "Dr. Pedro Almeida", crm: "56789-SP"});
CREATE (:Medico {nome: "Dra. Beatriz Lima", crm: "67890-SP"});

// ==========================================
// 4. RELACIONAMENTO MÉDICOS -> ESPECIALIDADES
// ==========================================
// Dr. Carlos Silva e Dra. Maria Santos - Pediatras
MATCH (m:Medico {nome: "Dr. Carlos Silva"})
MATCH (e:Especialidade {nome: "Pediatra"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

MATCH (m:Medico {nome: "Dra. Maria Santos"})
MATCH (e:Especialidade {nome: "Pediatra"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

// Dr. João Oliveira e Dra. Ana Costa - Oftalmologistas
MATCH (m:Medico {nome: "Dr. João Oliveira"})
MATCH (e:Especialidade {nome: "Oftalmologista"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

MATCH (m:Medico {nome: "Dra. Ana Costa"})
MATCH (e:Especialidade {nome: "Oftalmologista"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

// Dr. Pedro Almeida e Dra. Beatriz Lima - Cardiologistas
MATCH (m:Medico {nome: "Dr. Pedro Almeida"})
MATCH (e:Especialidade {nome: "Cardiologista"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

MATCH (m:Medico {nome: "Dra. Beatriz Lima"})
MATCH (e:Especialidade {nome: "Cardiologista"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

// ==========================================
// 5. CRIAÇÃO DOS HOSPITAIS
// ==========================================
CREATE (:Hospital {nome: "Hospital São Lucas", endereco: "Av. Paulista, 1000"});
CREATE (:Hospital {nome: "Hospital Santa Maria", endereco: "Rua das Flores, 500"});
CREATE (:Hospital {nome: "Hospital Central", endereco: "Rua Central, 200"});
CREATE (:Hospital {nome: "Hospital Esperança", endereco: "Av. da Esperança, 300"});
CREATE (:Hospital {nome: "Hospital Vida", endereco: "Rua da Vida, 150"});

// ==========================================
// 6. RELACIONAMENTO MÉDICOS -> HOSPITAIS
// ==========================================
// Dr. Carlos Silva - Hospital São Lucas e Hospital Central
MATCH (m:Medico {nome: "Dr. Carlos Silva"})
MATCH (h:Hospital {nome: "Hospital São Lucas"})
CREATE (m)-[:ATENDE_EM]->(h);

MATCH (m:Medico {nome: "Dr. Carlos Silva"})
MATCH (h:Hospital {nome: "Hospital Central"})
CREATE (m)-[:ATENDE_EM]->(h);

// Dra. Maria Santos - Hospital Santa Maria e Hospital Vida
MATCH (m:Medico {nome: "Dra. Maria Santos"})
MATCH (h:Hospital {nome: "Hospital Santa Maria"})
CREATE (m)-[:ATENDE_EM]->(h);

MATCH (m:Medico {nome: "Dra. Maria Santos"})
MATCH (h:Hospital {nome: "Hospital Vida"})
CREATE (m)-[:ATENDE_EM]->(h);

// Dr. João Oliveira - Hospital Esperança e Hospital São Lucas
MATCH (m:Medico {nome: "Dr. João Oliveira"})
MATCH (h:Hospital {nome: "Hospital Esperança"})
CREATE (m)-[:ATENDE_EM]->(h);

MATCH (m:Medico {nome: "Dr. João Oliveira"})
MATCH (h:Hospital {nome: "Hospital São Lucas"})
CREATE (m)-[:ATENDE_EM]->(h);

// Dra. Ana Costa - Hospital Central e Hospital Santa Maria
MATCH (m:Medico {nome: "Dra. Ana Costa"})
MATCH (h:Hospital {nome: "Hospital Central"})
CREATE (m)-[:ATENDE_EM]->(h);

MATCH (m:Medico {nome: "Dra. Ana Costa"})
MATCH (h:Hospital {nome: "Hospital Santa Maria"})
CREATE (m)-[:ATENDE_EM]->(h);

// Dr. Pedro Almeida - Hospital Vida e Hospital Esperança
MATCH (m:Medico {nome: "Dr. Pedro Almeida"})
MATCH (h:Hospital {nome: "Hospital Vida"})
CREATE (m)-[:ATENDE_EM]->(h);

MATCH (m:Medico {nome: "Dr. Pedro Almeida"})
MATCH (h:Hospital {nome: "Hospital Esperança"})
CREATE (m)-[:ATENDE_EM]->(h);

// Dra. Beatriz Lima - Hospital Central e Hospital São Lucas
MATCH (m:Medico {nome: "Dra. Beatriz Lima"})
MATCH (h:Hospital {nome: "Hospital Central"})
CREATE (m)-[:ATENDE_EM]->(h);

MATCH (m:Medico {nome: "Dra. Beatriz Lima"})
MATCH (h:Hospital {nome: "Hospital São Lucas"})
CREATE (m)-[:ATENDE_EM]->(h);

// ==========================================
// 7. CRIAÇÃO DOS PLANOS DE SAÚDE
// ==========================================
CREATE (:PlanoSaude {nome: "Unimed", tipo: "Premium"});
CREATE (:PlanoSaude {nome: "Bradesco Saúde", tipo: "Standard"});
CREATE (:PlanoSaude {nome: "SulAmérica", tipo: "Básico"});

// ==========================================
// 8. RELACIONAMENTO MÉDICOS -> PLANOS DE SAÚDE
// ==========================================
// Dr. Carlos Silva - Unimed e Bradesco Saúde
MATCH (m:Medico {nome: "Dr. Carlos Silva"})
MATCH (p:PlanoSaude {nome: "Unimed"})
CREATE (m)-[:ACEITA_PLANO]->(p);

MATCH (m:Medico {nome: "Dr. Carlos Silva"})
MATCH (p:PlanoSaude {nome: "Bradesco Saúde"})
CREATE (m)-[:ACEITA_PLANO]->(p);

// Dra. Maria Santos - SulAmérica e Unimed
MATCH (m:Medico {nome: "Dra. Maria Santos"})
MATCH (p:PlanoSaude {nome: "SulAmérica"})
CREATE (m)-[:ACEITA_PLANO]->(p);

MATCH (m:Medico {nome: "Dra. Maria Santos"})
MATCH (p:PlanoSaude {nome: "Unimed"})
CREATE (m)-[:ACEITA_PLANO]->(p);

// Dr. João Oliveira - Bradesco Saúde
MATCH (m:Medico {nome: "Dr. João Oliveira"})
MATCH (p:PlanoSaude {nome: "Bradesco Saúde"})
CREATE (m)-[:ACEITA_PLANO]->(p);

// Dra. Ana Costa - Unimed, Bradesco Saúde e SulAmérica
MATCH (m:Medico {nome: "Dra. Ana Costa"})
MATCH (p:PlanoSaude {nome: "Unimed"})
CREATE (m)-[:ACEITA_PLANO]->(p);

MATCH (m:Medico {nome: "Dra. Ana Costa"})
MATCH (p:PlanoSaude {nome: "Bradesco Saúde"})
CREATE (m)-[:ACEITA_PLANO]->(p);

MATCH (m:Medico {nome: "Dra. Ana Costa"})
MATCH (p:PlanoSaude {nome: "SulAmérica"})
CREATE (m)-[:ACEITA_PLANO]->(p);

// Dr. Pedro Almeida - Unimed
MATCH (m:Medico {nome: "Dr. Pedro Almeida"})
MATCH (p:PlanoSaude {nome: "Unimed"})
CREATE (m)-[:ACEITA_PLANO]->(p);

// Dra. Beatriz Lima - Bradesco Saúde e SulAmérica
MATCH (m:Medico {nome: "Dra. Beatriz Lima"})
MATCH (p:PlanoSaude {nome: "Bradesco Saúde"})
CREATE (m)-[:ACEITA_PLANO]->(p);

MATCH (m:Medico {nome: "Dra. Beatriz Lima"})
MATCH (p:PlanoSaude {nome: "SulAmérica"})
CREATE (m)-[:ACEITA_PLANO]->(p);

// ==========================================
// 9. CRIAÇÃO DOS PACIENTES
// ==========================================
CREATE (:Paciente {nome: "Lucas Ferreira", cpf: "111.222.333-44", nascimento: "1990-05-15"});
CREATE (:Paciente {nome: "Juliana Souza", cpf: "222.333.444-55", nascimento: "1985-08-20"});
CREATE (:Paciente {nome: "Roberto Lima", cpf: "333.444.555-66", nascimento: "1978-12-10"});
CREATE (:Paciente {nome: "Fernanda Costa", cpf: "444.555.666-77", nascimento: "2000-03-25"});
CREATE (:Paciente {nome: "Marcos Pereira", cpf: "555.666.777-88", nascimento: "1995-07-30"});

// ==========================================
// 10. RELACIONAMENTO PACIENTES -> PLANOS DE SAÚDE
// ==========================================
MATCH (pac:Paciente {nome: "Lucas Ferreira"})
MATCH (p:PlanoSaude {nome: "Unimed"})
CREATE (pac)-[:TEM_PLANO]->(p);

MATCH (pac:Paciente {nome: "Juliana Souza"})
MATCH (p:PlanoSaude {nome: "Bradesco Saúde"})
CREATE (pac)-[:TEM_PLANO]->(p);

MATCH (pac:Paciente {nome: "Roberto Lima"})
MATCH (p:PlanoSaude {nome: "SulAmérica"})
CREATE (pac)-[:TEM_PLANO]->(p);

MATCH (pac:Paciente {nome: "Fernanda Costa"})
MATCH (p:PlanoSaude {nome: "Unimed"})
CREATE (pac)-[:TEM_PLANO]->(p);

MATCH (pac:Paciente {nome: "Marcos Pereira"})
MATCH (p:PlanoSaude {nome: "Bradesco Saúde"})
CREATE (pac)-[:TEM_PLANO]->(p);

// ==========================================
// 11. CRIAÇÃO DAS CONSULTAS (RELACIONAMENTO PACIENTE -> MÉDICO)
// ==========================================
// Consulta 1: Lucas Ferreira com Dr. Carlos Silva
MATCH (pac:Paciente {nome: "Lucas Ferreira"})
MATCH (m:Medico {nome: "Dr. Carlos Silva"})
CREATE (pac)-[:FEZ_CONSULTA {data: "2025-01-15", motivo: "Consulta de rotina pediátrica"}]->(m);

// Consulta 2: Lucas Ferreira com Dr. Pedro Almeida
MATCH (pac:Paciente {nome: "Lucas Ferreira"})
MATCH (m:Medico {nome: "Dr. Pedro Almeida"})
CREATE (pac)-[:FEZ_CONSULTA {data: "2025-02-20", motivo: "Avaliação cardiológica"}]->(m);

// Consulta 3: Juliana Souza com Dr. João Oliveira
MATCH (pac:Paciente {nome: "Juliana Souza"})
MATCH (m:Medico {nome: "Dr. João Oliveira"})
CREATE (pac)-[:FEZ_CONSULTA {data: "2025-03-10", motivo: "Exame de vista"}]->(m);

// Consulta 4: Juliana Souza com Dra. Ana Costa
MATCH (pac:Paciente {nome: "Juliana Souza"})
MATCH (m:Medico {nome: "Dra. Ana Costa"})
CREATE (pac)-[:FEZ_CONSULTA {data: "2025-04-05", motivo: "Problema de visão"}]->(m);

// Consulta 5: Roberto Lima com Dra. Maria Santos
MATCH (pac:Paciente {nome: "Roberto Lima"})
MATCH (m:Medico {nome: "Dra. Maria Santos"})
CREATE (pac)-[:FEZ_CONSULTA {data: "2025-05-12", motivo: "Consulta pediátrica para filho"}]->(m);

// Consulta 6: Roberto Lima com Dra. Beatriz Lima
MATCH (pac:Paciente {nome: "Roberto Lima"})
MATCH (m:Medico {nome: "Dra. Beatriz Lima"})
CREATE (pac)-[:FEZ_CONSULTA {data: "2025-06-18", motivo: "Check-up cardiológico"}]->(m);

// Consulta 7: Fernanda Costa com Dra. Maria Santos
MATCH (pac:Paciente {nome: "Fernanda Costa"})
MATCH (m:Medico {nome: "Dra. Maria Santos"})
CREATE (pac)-[:FEZ_CONSULTA {data: "2025-07-22", motivo: "Vacinação"}]->(m);

// Consulta 8: Fernanda Costa com Dr. Carlos Silva
MATCH (pac:Paciente {nome: "Fernanda Costa"})
MATCH (m:Medico {nome: "Dr. Carlos Silva"})
CREATE (pac)-[:FEZ_CONSULTA {data: "2025-08-14", motivo: "Acompanhamento pediátrico"}]->(m);

// Consulta 9: Marcos Pereira com Dr. João Oliveira
MATCH (pac:Paciente {nome: "Marcos Pereira"})
MATCH (m:Medico {nome: "Dr. João Oliveira"})
CREATE (pac)-[:FEZ_CONSULTA {data: "2025-09-08", motivo: "Consulta oftalmológica"}]->(m);

// Consulta 10: Marcos Pereira com Dra. Beatriz Lima
MATCH (pac:Paciente {nome: "Marcos Pereira"})
MATCH (m:Medico {nome: "Dra. Beatriz Lima"})
CREATE (pac)-[:FEZ_CONSULTA {data: "2025-10-25", motivo: "Dor no peito"}]->(m);

// ==========================================
// VERIFICAÇÃO: Visualizar todo o grafo criado
// ==========================================
MATCH (n) RETURN n;
