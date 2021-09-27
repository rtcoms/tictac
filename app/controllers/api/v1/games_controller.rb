class Api::V1::GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @active_for_user = Game.active_for_user(current_user)
    @available_for_user = Game.available_for_user(current_user)

    render json: { active: @active_for_user, available: @available_for_user}, status: :ok
  end

  def show
    @game = Game.find(params[:id])
    @game_state = Game.find(params[:id]).state

    render json: {game: @game, state: @game_state }, status: :ok
  end

  def create
    @game = Game.create!(starter: current_user)

    render json: @game, status: :ok
  end
end
