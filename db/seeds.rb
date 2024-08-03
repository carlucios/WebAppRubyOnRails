#  db/seeds.rb

# Criação de médicos
medico1 = Medico.create!(
  email: 'dr.john.doe@example.com',
  password: 'password123',
  name: 'Dr. John Doe',
  phone: '123-456-7890',
  photo: 'dr_john_doe.jpg'
)

medico2 = Medico.create!(
  email: 'dr.jane.smith@example.com',
  password: 'password123',
  name: 'Dr. Jane Smith',
  phone: '098-765-4321',
  photo: 'dr_jane_smith.jpg'
)

# Criação de pacientes
paciente1 = Paciente.create!(
  cpf: '12345678901',
  medico: medico1,
  name: 'Alice Johnson',
  photo: 'alice_johnson.jpg',
  address: '123 Elm Street',
  phone: '555-1234',
  insurance: 'Health Insurance Co.',
  hd: 'Health Details',
  email: 'alice.johnson@example.com',
  birth_date: '1990-05-14',
  aval_date: '2024-01-01',
  proc_date: '2024-01-15',
  rg: 'MG1234567',
  dominance: 'Left'
)

paciente2 = Paciente.create!(
  cpf: '10987654321',
  medico: medico2,
  name: 'Bob Brown',
  photo: 'bob_brown.jpg',
  address: '456 Oak Avenue',
  phone: '555-5678',
  insurance: 'Health Insurance Co.',
  hd: 'Health Details',
  email: 'bob.brown@example.com',
  birth_date: '1985-11-23',
  aval_date: '2024-02-01',
  proc_date: '2024-02-15',
  rg: 'MG7654321',
  dominance: 'Right'
)

# Criação de sessões
sessao1 = Sessao.create!(
  paciente_id: paciente1.id,
  medico_id: medico1.id,
  start_date: '2024-01-10',
  start_hour: '09:00:00',
  end_hour: '10:00:00'
)

sessao2 = Sessao.create!(
  paciente_id: paciente2.id,
  medico_id: medico2.id,
  start_date: '2024-02-10',
  start_hour: '11:00:00',
  end_hour: '12:00:00'
)

# Criação de relatórios
relatorio1 = Relatorio.create!(
  description: 'Report on Alice Johnson\'s treatment',
  photo: 'report_alice_johnson.jpg',
  sessao_id: sessao1.id
)

relatorio2 = Relatorio.create!(
  description: 'Report on Bob Brown\'s treatment',
  photo: 'report_bob_brown.jpg',
  sessao_id: sessao2.id
)

# Criação de atividades
atividade1 = Atividade.create!(
  name: 'Physiotherapy',
  series: 3,
  reps: 15
)

atividade2 = Atividade.create!(
  name: 'Strength Training',
  series: 4,
  reps: 12
)

# Criação de agendamentos
Agendamento.create!(
  medico_id: medico1.id,
  paciente_id: paciente1.id,
  start_date: '2024-01-05',
  start_hour: '08:00:00',
  end_hour: '09:00:00'
)

Agendamento.create!(
  medico_id: medico2.id,
  paciente_id: paciente2.id,
  start_date: '2024-02-05',
  start_hour: '10:00:00',
  end_hour: '11:00:00'
)
