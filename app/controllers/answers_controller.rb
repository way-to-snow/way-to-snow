class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @resort = @question.resort
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    # if @answer.user != @question.user
    if @answer.save
      respond_to do |format|
        format.html { redirect_to resort_path(@resort) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'resorts/show' }
        format.js
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
