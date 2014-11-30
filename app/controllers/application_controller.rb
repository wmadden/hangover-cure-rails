class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def braintree_client_token
    Braintree::ClientToken.generate
  end
  helper_method :braintree_client_token
end
