class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def show
  	# raise params.inspect
  	@user = User.find(params[:id])
  end

  def create
  	@user= User.new(user_params)
   	@user.save
   	@profile = Profile.new
   	@profile.user_id = @user.id
   	@profile.usergender = params[:user][:usergender]
   	@profile.userheight = params[:user][:userheight]
   	@profile.userage = params[:user][:userage]

  	if @profile.save
  		flash[:notice]="user was submitted Succsefully"
  		redirect_to @user
  	else
  		render :new
  	end
  end


  def edit
  	@user = User.find(params[:id])
  end

  def update 
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	@user.profile.userheight = params[:user][:userheight]
  	@user.profile.usergender = params[:user][:usergender]
  	@user.profile.userage = params[:user][:userage]
    if @user.profile.save
  		redirect_to user_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.profile.destroy
  		@user.destroy

  		redirect_to @user
  	end
  end


  private
  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:username, :email, :address)
  end

  
  

end




  

