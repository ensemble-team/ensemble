# require 'spec_helper'
require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe Project do
  include CarrierWave::Test::Matchers

  let(:user) { double('user') }
  let(:uploader) { Project.new(user, :avatar) }

  before do
    Project.enable_processing = true
    File.open(path_to_file) { |f| uploader.store!(f) }
  end

  after do
    Project.enable_processing = false
    uploader.remove!
  end

  context "it uploads a mp3 file" do
    it "has the correct format" do
      expect(uploader).to be_format('mp3')
    end
  end
end
