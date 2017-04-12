class HomeController < ApplicationController
  def index
  end
  def about
    render :about
  end
  def login
    render :login, locals: {:errors => []}
  end
  def signup
    render :signup, locals: {:errors => []}
  end
  def contact
    @status = 'contact'
    render :contact, locals: {:status => @status}
  end
end
