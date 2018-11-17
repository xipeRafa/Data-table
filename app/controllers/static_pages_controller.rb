class StaticPagesController < ApplicationController
  def home
  	@plans = Plan.all
  end
end
