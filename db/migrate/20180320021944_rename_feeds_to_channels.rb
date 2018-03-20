class RenameFeedsToChannels < ActiveRecord::Migration[5.2]
  def change
    rename_table :channels, :items
    rename_table :feeds, :channels
  end
end
