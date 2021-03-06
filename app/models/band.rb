class Band < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: true
  
  has_and_belongs_to_many :flyers
  
  default_scope order(:name)

  extend FriendlyId
  friendly_id :name, use: :slugged
end
