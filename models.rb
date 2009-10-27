class Entry < ActiveRecord::Base
  has_many :comments  
  has_and_belongs_to_many :tags
end

class Comment < ActiveRecord::Base
  belongs_to :entry
end

