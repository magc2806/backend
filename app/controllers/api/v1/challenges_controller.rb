class Api::V1::ChallengesController < ApplicationController
  before_action :set_challenge, except: :index

  # GET /api/v1/challenges
  def index
    @challenges = Challenge.all
    render json: @challenges
  end
  # GET /api/v1/challenges/:id
  def show
  end
  # POST /api/v1/challenges
  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      render json: { message: 'challenge added', data: @challenge }
    else
      render json: { message: 'Failed to add challenge', data: @challenge.errors }
    end
  end
  # PATCH /api/v1/challenges/:id
  def update

    if @challenge.update(challenge_params)
      render json: { message: 'challenge updated', data: @challenge }
    else
      render json: { message: 'Failed to update challenge', data: @challenge.errors }
    end
  end

  # DELETE /api/v1/challenges/:id
  def destroy
    if @challenge.destroy
      render json: { message: 'challenge destroyed', data: @challenge }
    else
      render json: { message: 'Failed to destroy challenge', data: @challenge }
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :description, :start_date, :end_date)
  end

  def set_challenge
    @challenge = Challenge.find params[:id]
  end
end
