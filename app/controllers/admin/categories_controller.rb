class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    if current_user.is_admin == nil || current_user.is_admin != true    #adminに設定されていない場合に、admin categoriesにアクセスしようとしたらrootにリダイレクトする設定
      redirect_to root_path
    end
  end

  def new
    @category = Category.new
    if current_user.is_admin == nil || current_user.is_admin != true    #adminに設定されていない場合に、admin categoriesにアクセスしようとしたらrootにリダイレクトする設定
      redirect_to root_path
    end
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully created"
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
    if current_user.is_admin == nil || current_user.is_admin != true    #adminに設定されていない場合に、admin categoriesにアクセスしようとしたらrootにリダイレクトする設定
      redirect_to root_path
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Successfully updated"
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = "Successfully deleted"
      redirect_to request.referer
    else
      render "index"
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
