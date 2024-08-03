class CreateMedicos < ActiveRecord::Migration[7.2]
  def change
    create_table :medicos do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :phone
      t.string :photo

      t.timestamps
    end
    
    add_index :medicos, :email, unique: true
  end
end
