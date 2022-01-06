class CreateTimers < ActiveRecord::Migration[5.2]
  def change
    create_table :timers do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :duration
      t.string :substance
      t.string :dosage
      t.text :entry_instructions
      t.text :notes
    end
  end
end
