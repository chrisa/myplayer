class FixProgrammes < ActiveRecord::Migration
  def up
    remove_column :programmes, :feed_id
    add_column :programmes, :uri, :text
    add_column :programmes, :feed_id, :integer
  end

  def down
    add_column :programmes, :feed_id, :text
    remove_column :programmes, :uri
    remove_column :programmes, :feed_id
  end
end
