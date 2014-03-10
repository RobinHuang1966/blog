#class CreateComments < ActiveRecord::Migration
#  def change
#    create_table :comments do |t|
#      t.string :commenter
#      t.text :body
#      t.references :post
#
#      t.timestamps
#    end
#    add_index :comments, :post_id
#  end
#end

class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end