class MusicsController < ApplicationController
  before_action :set_music, only: %i[show update destroy]

  def index
    @musics = Music.all

    render json: @musics
  end

  def show
    render json: @music
  end

  def create
    @music = Music.new(music_params)

    if @music.save
      render json: @music, status: :created, location: @music
    else
      render json: @music.errors, status: :unprocessable_entity
    end
  end

  def update
    if @music.update(music_params)
      render json: @music
    else
      render json: @music.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @music.destroy!
  end

  def coming_soon
    @musics = Music.where(release_date: Date.tomorrow..1.week.from_now)

    render json: @musics
  end

  private

  def set_music
    @music = Music.find(params[:id])
  end

  def music_params
    params.require(:music).permit(:album_id, :title, :release_date, feat: [])
  end
end
