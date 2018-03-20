class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :title
      t.string :link
      t.datetime :pubdate
      t.references :channel, foreign_key: true, null: false

      t.timestamps
    end
  end
end
