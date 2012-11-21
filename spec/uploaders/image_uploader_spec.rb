require 'spec_helper'
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    @flyer = Flyer.new
    ImageUploader.enable_processing = true
    @uploader = ImageUploader.new(@flyer, :image)
    @uploader.store!(File.open(Rails.root.join('spec/factories/test.jpg')))
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 200 by 200 pixels" do
      @uploader.thumb.should be_no_larger_than(200, 200)
    end
  end

  context 'the medium version' do
    it "should scale down a landscape image to fit within 450 by 450 pixels" do
      @uploader.medium.should be_no_larger_than(450, 450)
    end
  end
end