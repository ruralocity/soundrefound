class Flyer < ActiveRecord::Base
  belongs_to :venue
  attr_accessible :happened_on, :venue_id, :lineup, :notes,
    :new_venue_name, :new_venue_city, :new_venue_state

  attr_accessor :lineup
  attr_accessor :new_venue_name
  attr_accessor :new_venue_city
  attr_accessor :new_venue_state

  has_and_belongs_to_many :bands
  belongs_to :venue

  delegate :full_name, to: :venue, prefix: true

  validates :happened_on, presence: true

  before_save :create_bands
  before_save :create_venue

  def band_list
    bands.pluck(:name).join(', ')
  end

  private

  def create_bands
    bands.clear
    lineup.to_s.split(',').each do |band|
      band = Band.find_or_create_by_name(band.strip)
      bands << band unless bands.include? band
    end
  end

  def create_venue
    unless new_venue_name.blank?
      self.venue = Venue.create(
        name: new_venue_name,
        city: new_venue_city,
        state: new_venue_state)
    end
  end
end
