 class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  accepts_nested_attributes_for :posts
  has_and_belongs_to_many :contests


  
   has_attached_file :avatar, :styles => { :original => "300x300#", :thumb => "40x40#", :tiny => "20x20#" }, :default_url => "/images/:style/default_image.png", :url => "/avatars/:style/:basename.:extension" 
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
