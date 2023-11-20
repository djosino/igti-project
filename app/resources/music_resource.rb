class MusicResource < JSONAPI::Resource
  attributes :title, :release_date, :feat
  attribute :created, delegate: :created_at
  attribute :modified, delegate: :updated_at

  has_one :album
  has_one :artist
end