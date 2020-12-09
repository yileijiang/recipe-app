class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, except: :home
  after_action :verify_policy_scoped, only: :index

  
  def skip_pundit?
  end
end
