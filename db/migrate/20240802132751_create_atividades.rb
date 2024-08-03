class CreateAtividades < ActiveRecord::Migration[7.2]
  def change
    create_table :atividades do |t|
      t.string :name
      t.integer :series
      t.integer :reps

      t.timestamps
    end
  end
end
