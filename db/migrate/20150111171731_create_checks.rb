class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :pin_id
      t.boolean :check

      t.timestamps
    end
  end
end
