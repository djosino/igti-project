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
class Artist < ApplicationRecord
  include Filterable

  validates :nickname, presence: true
  validates :full_name, presence: true
  validates :birthday, presence: true
  validates :country, presence: true
end
