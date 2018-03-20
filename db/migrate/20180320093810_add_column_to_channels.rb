class AddColumnToChannels < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :title, :string
    add_column :channels, :description, :string
  end
end
