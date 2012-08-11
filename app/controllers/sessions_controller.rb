class SessionsController < ApplicationController
  before_filter :login_required, only: [:fb_friends]

  def create
    user = ( User.find_by_uid(auth_hash[:uid]) ||
              User.create_from_oauth(auth_hash) )
    login(user)
    flash[:notice] = "You have successfully logged in."
    redirect_to :root
  end

  def destroy
    logout
    flash[:notice] = "You have successfully logged out."
    redirect_to :root
  end

  def fb_friends
    fb_user = FbGraph::User.me(current_user.token)
    render json: { friends: fb_user.friends.map {|f| [f.name, f.identifier] } }
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
