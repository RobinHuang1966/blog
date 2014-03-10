#class CreatePosts < ActiveRecord::Migration
#  def change
#    create_table :posts do |t|
#      t.string :name
#      t.string :title
#      t.text :content
#
#      t.timestamps
#    end
#  end
#end

class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end