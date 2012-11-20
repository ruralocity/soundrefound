class Venue < ActiveRecord::Base
  attr_accessible :city, :name, :state

  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true

  has_many :flyers
  
  def full_name
    "#{name}, #{city} #{state}"
  end
end
