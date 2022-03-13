class AnswersController < ApplicationController
  def new
    @category = Category.find_by(params[:category_id])
    @lesson = Lesson.find(params[:lesson_id])
    if @lesson.next_word.nil?
      # @lesson.update(score: @lesson.result)
      # @lesson.create_activity(user_id: current_user.id)
      redirect_to lesson_url(@lesson)
    else
      @word = @lesson.next_word
      @answer = Answer.new
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.new(answer_params)
    if @answer.save
      redirect_to new_lesson_answer_url
    end
  end

  def answer_params
    params.require(:answer).permit(:word_id, :choice_id)
  end
end
