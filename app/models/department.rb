class Department < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy

  has_many :users, :through => :reviews
  has_many :hospitals, :through => :reviews

  validates :name, :presence => true, :uniqueness => true
end
