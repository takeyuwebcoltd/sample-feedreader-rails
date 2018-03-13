class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.string :url, null: false, default: '', comment: 'RSSフィードのURL'
      t.timestamps
    end
  end
end
