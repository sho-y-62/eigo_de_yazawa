class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    if current_user.is_admin == nil || current_user.is_admin != true    #adminに設定されていない場合に、admin categoriesにアクセスしようとしたらrootにリダイレクトする設定
      redirect_to root_path
    end
  end

  def set
    @user = User.find(params[:id])
    @user.update(is_admin: true)
    redirect_to request.referer
  end

  def remove
    @user = User.find(params[:id])
    @user.update(is_admin: false)
    redirect_to request.referer
  end
end
