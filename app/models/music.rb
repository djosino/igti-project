# == Schema Information
#
# Table name: musics
#
#  id           :bigint           not null, primary key
#  feat         :string           is an Array
#  release_date :date
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  album_id     :bigint           not null
#
# Indexes
#
#  index_musics_on_album_id  (album_id)
#
# Foreign Keys
#
#  fk_rails_...  (album_id => albums.id)
#
class Music < ApplicationRecord
  include Filterable

  belongs_to :album

  validates :title, presence: true
  validates :release_date, presence: true
end
