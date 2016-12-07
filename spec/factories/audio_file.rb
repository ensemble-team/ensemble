FactoryGirl.define do
  factory :audio_file do
    title "Lovely track"
    text "This is a lovely track"
    avatar Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,"/spec/fixtures/files/mpthreetest.mp3")))
    project_id 1
  end
end
