class NumberController < ApplicationController

  def index
      @no = params[:no]
      return @no
  end
end
