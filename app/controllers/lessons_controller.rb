class LessonsController < ApplicationController
  def create
    @lesson = Lesson.new(category_id: params[:category_id])
    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
    end
  end
  
  def show
    @lesson = Lesson.find(params[:id])
  end
end
