class AnswersController < ApplicationController
    def create      
      @question = Question.find(params[:question_id])
      @resort = @question.resort
      @answer = Answer.new(answer_params)
      @answer.question = @question
      @answer.user = current_user
      if @answer.save!
        redirect_to resort_path(@resort)
      else
        render 'resorts/show'
      end
    end
    
    private
  
    def answer_params
      params.require(:answer).permit(:answer)
    end

end
