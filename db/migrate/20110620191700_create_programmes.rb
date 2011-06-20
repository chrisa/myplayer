class CreateProgrammes < ActiveRecord::Migration
  def up
    create_table :programmes do |t|
      t.text :feed_id
      t.text :ep_pid
      t.text :ver_pid
      t.text :title
      t.text :summary
      t.text :channel
      t.datetime :broadcast
    end
  end

  def down
    drop_table :programmes
  end
end
