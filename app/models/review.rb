class Review < ActiveRecord::Base
  belongs_to :department
  belongs_to :hospital
  belongs_to :user

  validates :user, :presence => true
  validates :hospital, :presence => true
  validates :department, :presence => true

  validates :body, :presence => true
  validates :rating, :presence => true
  validates :visited_on, :presence => true
end
