class CreateTimers < ActiveRecord::Migration[5.2]
  def change
    create_table :timers do |t|
      t.integer :user_id
      t.string :name
      t.integer :duration
      t.string :substance
      t.string :dosage
      t.text :entry_instructions
      t.text :notes
    end
  end
end
