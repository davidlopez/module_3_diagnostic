class SearchController < ApplicationController
  def index
    render locals: {house_facade: HouseFacade.new(params['house'])}
  end
end
