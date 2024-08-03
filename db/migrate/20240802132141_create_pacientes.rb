class CreatePacientes < ActiveRecord::Migration[7.2]
  def change
    create_table :pacientes do |t|
      t.belongs_to :medico

      t.string :cpf
      t.string :name
      t.string :photo
      t.string :address
      t.string :phone
      t.string :insurance
      t.string :hd
      t.string :email
      t.date :birth_date
      t.date :aval_date
      t.date :proc_date
      t.string :rg
      t.string :dominance

      t.timestamps
    end
    
    add_index :pacientes, :cpf, unique: true
  end
end
