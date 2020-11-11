class LeaguesController < ApplicationController
  before_action :find_league, only: [:show, :update, :destroy]
  before_action :find_nearby_leagues, only: [:leagues_in_budget]

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
    league = League.create!(league_params)
    render json: league
  end

  def destroy
    @league.destroy!
    render json: {success: true}
  end

  def leagues_in_budget
    budget = params[:budget].to_i
    nearby_leagues_in_budget = []
    accum_budget = 0

    # TODO: Use reduce with accumulator
    # TODO: ActiveRecord sorting not working correctly (tried reorder), falling back to sort_by
    # TODO: If we have 2 leagues with same sponsorship price, prefer the closer one

    @nearby_leagues.to_a.sort_by { |league| league.price }.each do |league|
      accum_budget += league.price
      if accum_budget <= budget
        nearby_leagues_in_budget.push(league)
      else
        break
      end
    end

    render json: nearby_leagues_in_budget
  end

  private

  def all_leagues
    League.all.order(:name)
  end

  def find_nearby_leagues
    @nearby_leagues = League.nearby_leagues_within_radius(params[:latitude],
                                                          params[:longitude],
                                                          params[:radius])
  end

  def find_league
    @league = League.find(params[:id])
  end

  def league_params
    params.permit(:name, :latitude, :longitude, :price, :budget, :radius)
  end

end
