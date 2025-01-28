class Users::SessionsController < Devise::SessionsController
  def create
    user = User.find_for_database_authentication(login: params[:user][:login])

    if user && user.valid_password?(params[:user][:password])
      sign_in(user)
      redirect_to after_sign_in_path_for(user)
    else
      @resource = User.new
      render :new
    end
  end

  def new
    @resource = User.new 
    super
  end
end