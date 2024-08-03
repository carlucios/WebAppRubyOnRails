class CreateRelatorios < ActiveRecord::Migration[7.2]
  def change
    create_table :relatorios do |t|
      t.belongs_to :sessao
      
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
