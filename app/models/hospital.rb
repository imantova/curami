class Hospital < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy

  has_many :users, :through => :reviews
  has_many :departments, :through => :reviews

  validates :name, :presence => true, :uniqueness => { :scope => :address}
  validates :city, :presence => true
  validates :address, :presence => true
end
