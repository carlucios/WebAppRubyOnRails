class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Sends CSRF Token in the header of any GET resquest
  before_action :set_csrf_token

  private

  def set_csrf_token
    response.headers['X-CSRF-Token'] = form_authenticity_token
  end
end
