class Agendamento < ApplicationRecord
  has_one :medico
  has_one :paciente
end
