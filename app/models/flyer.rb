class Flyer < ActiveRecord::Base
  belongs_to :venue
  attr_accessible :happened_on, :venue_id, :image, :lineup, :notes,
    :new_venue_name, :new_venue_city, :new_venue_state

  attr_accessor :lineup
  attr_accessor :new_venue_name
  attr_accessor :new_venue_city
  attr_accessor :new_venue_state

  default_scope order(:happened_on)

  has_and_belongs_to_many :bands
  belongs_to :venue

  delegate :full_name, to: :venue, prefix: true

  validates :happened_on, presence: true

  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :band_list, use: :slugged

  before_save :create_bands
  before_save :create_venue

  def band_list
    bands.pluck(:name).join(', ')
  end

  def full_description
    [band_list, venue_full_name, happened_on.strftime('%B %d, %Y')].join(', ')
  end

  private

  def create_bands
    if lineup
      bands.clear
      lineup.to_s.split(',').each do |band|
        band = Band.find_or_create_by_name(band.strip)
        bands << band unless bands.include? band
      end
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
