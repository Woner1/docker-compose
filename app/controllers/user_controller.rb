class UserController < ApplicationController
  def index
      user=User.all
      render json:{ result: :ok,data: user}
  end

  def show
  end

  def new
  end

  def destory
  end
end
