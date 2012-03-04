class MoreProgrammeInfo < ActiveRecord::Migration
  def up
    add_column :programmes, :image_url, :text
    add_column :programmes, :duration, :integer
    add_column :programmes, :expires, :datetime
  end

  def down
    remote_column :programmes, :image_url
    remote_column :programmes, :duration
    remote_column :programmes, :expires
  end
end
