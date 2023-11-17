# == Schema Information
#
# Table name: albums
#
#  id           :bigint           not null, primary key
#  release_date :date
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  artist_id    :bigint           not null
#
# Indexes
#
#  index_albums_on_artist_id  (artist_id)
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => artists.id)
#
class Album < ApplicationRecord
  belongs_to :artist
  has_many :musics, dependent: :destroy

  validates :title, presence: true
  validates :release_date, presence: true

  accepts_nested_attributes_for :artist, :musics

  def to_json(_options  = {})
    attributes.except('artist_id').merge(
      artist: artist.attributes,
      musics: musics.map(&:attributes)
    ).to_json
  end
end
