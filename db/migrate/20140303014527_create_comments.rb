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

#add_column :events, :category_id, :integer,新增一栏
#add_index :events, :category_id 增加外键
#资料表也可以自定义table名和主键
#self.table_name = "your_table_name"
#self.primary_key = "your_primary_key_name"

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