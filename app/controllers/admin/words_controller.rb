class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @words = @category.words
    if current_user.is_admin == nil || current_user.is_admin != true    #adminに設定されていない場合に、admin categoriesにアクセスしようとしたらrootにリダイレクトする設定
      redirect_to root_path
    end
  end

  def new
    @category = Category.find(params[:category_id])
    @word = Word.new
    2.times{ @word.choices.new }
    if current_user.is_admin == nil || current_user.is_admin != true    #adminに設定されていない場合に、admin categoriesにアクセスしようとしたらrootにリダイレクトする設定
      redirect_to root_path
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.new(word_params)
    if @word.save
      flash[:success] = "Successfully saved"
      redirect_to admin_category_words_path
    else
      render "new"
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    if current_user.is_admin == nil || current_user.is_admin != true    #adminに設定されていない場合に、admin categoriesにアクセスしようとしたらrootにリダイレクトする設定
      redirect_to root_path
    end
  end

  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    if @word.update(word_params)
      flash[:success] = "Updated category information!"
      redirect_to admin_category_words_path
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    @word.destroy
    flash[:success] = "successfully deleted!"
    redirect_to request.referer
  end

  private
  def word_params
    params.require(:word).permit(:content, choices_attributes:[:content, :is_correct, :id])
  end
end
