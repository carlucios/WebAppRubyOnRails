class CreateAtividadesSessaos < ActiveRecord::Migration[7.2]
  def change
    create_table :atividades_sessaos, id: false do |t|
      t.belongs_to :atividade
      t.belongs_to :sessao
    end
  end
end
