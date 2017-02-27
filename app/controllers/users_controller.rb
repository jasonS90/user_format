class UsersController < ApplicationController

  #건드려야 하는 부분 : users_controller, home_controller, view/users, application.html.erb, routes.rb

  def new
    @user = User.new
  end

  def create
    #만드는 건 포스트랑 같음
    @user = User.create(user_param)
    #저장되면 바로 로그인 되도록 함
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else #저장 안되면 경고 메시지
      flash[:alert] = "아이디 또는 패스워드의 형식이 잘못되었습니다"
      redirect_to new_user_path
    end
  end

  def login
  end

  def login_process
    #login form에서 받은 메일과 패스워드로 User모델에서 일치하는 데이터를 찾아 user에 저장
    user = User.where(mail: params[:mail], password: params[:password]).take
    unless user.nil? #user가 있으면 세션id에 user변수의 id를 입력
      session[:user_id] = user.id
      redirect_to root_path
    else #user가 없으면 경고 메시지
      flash[:alert] = "아이디 또는 패스워드가 일치하지 않습니다"
      redirect_to users_login_path
    end
  end

  def logout #세션에 저장된 user의 id를 리셋
    reset_session
    redirect_to root_path
  end

  private
  def user_param
    params.require(:user).permit(:mail, :password)
  end
end
