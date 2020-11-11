class LeaguesController < ApplicationController
  before_action :find_league, only: [:show, :update]

  def index
    render json: all_leagues
  end

  def show
    render json: @league
  end

  def update
    @league.update!(league_params)
    render json: @league
  end

  def create
    league = League.create(league_params)
    render json: league
  end

  def leagues_in_budget
    budget = params[:budget]
    starting_budget = 0

    nearby_leagues = League.nearby_leagues_within_radius(params[:latitude], params[:longitude], params[:radius])

    nearby_leagues.find_each do |league|

    end
  end

  private

  def all_leagues
    League.all
  end

  def find_league
    @league = League.find(params[:id])
  end

  def league_params
    params.permit(:name, :latitude, :longitude, :price, :budget)
  end

end
