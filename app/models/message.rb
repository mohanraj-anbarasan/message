class Message < ActiveRecord::Base
	
belongs_to :users
attr_accessible :message,:user_id,:is_display

 PER_PAGE = 15
end
