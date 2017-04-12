class HomeController < ApplicationController
  def index
  end
  def about
    render :about
  end
  def login
    render :login
  end
  def signup
    render :signup
  end
  def contact
    @status = 'contact'
    render :contact, locals: {:status => @status}
  end
end
