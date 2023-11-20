class ArtistResource < JSONAPI::Resource
  attributes :nickname, :full_name, :birthday, :country
  attribute :created, delegate: :created_at
  attribute :modified, delegate: :updated_at

  has_many :albums
  has_many :musics
end