FactoryGirl.define do
  factory :request do
    title             "request title"
    user             
    username          "username for 3rd party apps"
    start_datetime    "2013-03-11 08:26:45"
    end_datetime      "2013-03-13 08:26:45"
    deadline_datetime "2013-03-01 08:26:45"
  end
end
