 class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts


  
   has_attached_file :avatar, :styles => { :original => "300x300#", :thumb => "100x100#", :tiny => "20x20#" }, :default_url => "/images/:style/default_image.png"
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
