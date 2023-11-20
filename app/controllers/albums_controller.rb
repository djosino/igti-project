class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show update destroy ]

  # GET /albums
  def index
    @albums = Album.filter(filter_params)

    render json: @albums
  end

  # GET /albums/1
  def show
    render json: @album
  end

  # POST /albums
  def create
    @album = Album.new(album_params)

    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  def update
    if @album.update(album_params)
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy!
  end

  def coming_soon
    @albums = Album.where(release_date: Date.tomorrow..1.week.from_now)

    render json: @albums
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_album
    @album = Album.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def album_params
    params
      .require(:album)
      .permit(
        :title, :release_date, :artist_id,
        artist_attributes: [:nickname, :full_name, :birthday, :country],
        musics_attributes: [:title, :release_date, feat: []]
      )
  end

  def filter_params
    params.permit(:release_date)
  end
end
