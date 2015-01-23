class AddCompletedIdColumnToPins < ActiveRecord::Migration
  def change
    add_column :pins, :completed, :boolean
  end
end
