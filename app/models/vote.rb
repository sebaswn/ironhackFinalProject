class Vote < ActiveRecord::Base
	belongs_to :post
	belongs_to :contest
end
