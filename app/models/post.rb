class Post < ActiveRecord::Base
	belongs_to :user

  has_attached_file :image, :styles => { :original => "900x900>", :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default_image.png", :url => "/images/:style/:basename.:extension"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
