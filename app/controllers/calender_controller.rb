class CalenderController < ApplicationController
  def index
    @even = Event.all
  end
end
