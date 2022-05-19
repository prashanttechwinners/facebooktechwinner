class ApplicationRecord < ActiveRecord::Base
  has_one_attached :images 

  has_many_attached :pictures
  has_rich_text :body 
  primary_abstract_class
end
