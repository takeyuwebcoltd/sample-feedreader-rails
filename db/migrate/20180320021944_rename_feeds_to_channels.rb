class RenameFeedsToChannels < ActiveRecord::Migration[5.2]
  def change
    rename_table :feeds, :channels
  end
end
