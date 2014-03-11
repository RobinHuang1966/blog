class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attributes
  #继承的Active Record 讓你的 Model 有非常多功能，包括基本的資料庫CRUD操作，
  #資料驗證(data validation)、厲害的搜尋以及可以和其他 Models 關聯在一起。
  #Rails 提供各種驗證的方法，包括必填、唯一性、格式或是需要有關聯物件。
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }

  #comments与post关联宣告,并且级联删除
  has_many :comments,:dependent => :destroy

  has_many :tags
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
