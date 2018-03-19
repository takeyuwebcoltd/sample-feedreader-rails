class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :channel_title
      t.string :description
      t.string :item_title
      t.string :link
      t.datetime :pubdate
      t.integer :feed_id

      t.timestamps
    end
  end
end
