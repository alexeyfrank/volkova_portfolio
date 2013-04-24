class Biography::Review < ActiveRecord::Base
  attr_accessible :author, :biography_id, :content, :position

  belongs_to :biography

  translates :content, :author, :position
end
