require 'rails_helper'

RSpec.describe "Places", type: :system do
  before do
    @place = FactoryBot.create(:place)
    @place.image = fixture_file_upload('app/assets/images/default_place.png')
  end
  

end
