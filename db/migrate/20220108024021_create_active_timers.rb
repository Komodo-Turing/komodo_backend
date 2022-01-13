class CreateActiveTimers < ActiveRecord::Migration[5.2]
  def change
    create_table :active_timers do |t|
      t.integer :user_id
      t.string :name
      t.datetime :start_time
      t.integer :duration
      t.string :substance
      t.string :dosage
      t.text :entry_instructions
      t.text :notes
      t.string :status
      t.string :address
    end
  end
end
