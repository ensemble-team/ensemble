FactoryGirl.define do
  factory :track do
    title "Lovely track"
    text "This is a lovely track"
    avatar Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,"/spec/fixtures/files/mpthreetest.mp3")))
    owner_id 1
    owner_type ""
  end
end
