class CreateFeeds < ActiveRecord::Migration
  def up
    create_table :feeds do |t|
      t.text :name
      t.text :url
    end
  end

  def down
    drop_table :feeds
  end
end
