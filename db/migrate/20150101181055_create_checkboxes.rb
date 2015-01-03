class CreateCheckboxes < ActiveRecord::Migration
  def change
    create_table :checkboxes do |t|
      t.boolean :checkbox

      t.timestamps
    end
  end
end
