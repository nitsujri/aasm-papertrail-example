class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit

  private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || posts_path
  end
end
