class HomeController < ApplicationController
  def index
    @usermail = ""
    #로그인이 되어 있고, User모델에 데이터가 0이 아니면 session으로 user를 찾아 그 메일을 @usermail에 저장
    unless session[:user_id].nil? || User.count == 0
      @usermail = User.find(session[:user_id]).mail
    end
  end
end
