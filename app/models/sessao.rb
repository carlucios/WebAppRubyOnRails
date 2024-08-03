class Sessao < ApplicationRecord
  has_one :medico
  has_one :paciente
  has_and_belongs_to_many :atividades
end
