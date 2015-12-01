class Contest < ActiveRecord::Base
	has_and_belongs_to_many :posts
	has_and_belongs_to_many :users
	has_many :votes

	has_attached_file :cover, styles: { original: "1300x1300>", long: "1300x400#"}, default_url: "/images/:style/missing.png", :url => "/covers/:style/:basename.:extension"
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
