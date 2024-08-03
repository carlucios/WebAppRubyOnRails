class Atividade < ApplicationRecord
  has_and_belongs_to_many :sessaos
end
