# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  nickname   :string
#  full_name  :string
#  birthday   :date
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
