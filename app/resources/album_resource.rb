class AlbumResource < JSONAPI::Resource
  attributes :title, :release_date
  attribute :created, delegate: :created_at
  attribute :modified, delegate: :updated_at

  has_one :artist
  has_many :musics
end