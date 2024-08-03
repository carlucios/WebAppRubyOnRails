class CreateAgendamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :agendamentos do |t|
      t.belongs_to :medico
      t.belongs_to :paciente

      t.date :start_date
      t.time :start_hour
      t.time :end_hour

      t.timestamps
    end
  end
end
