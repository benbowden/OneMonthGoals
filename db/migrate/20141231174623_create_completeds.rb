class CreateCompleteds < ActiveRecord::Migration
  def change
    create_table :completeds do |t|
      t.integer :completed

      t.timestamps
    end
  end
end
