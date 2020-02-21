class AnswersController < ApplicationController
    def create
        @question = Question.find(params[:question_id])
        @answer = Review.new(answer_params)
        @answer.question = @question
        if @answer.save
          redirect_to question_path(@question)
        else
          render 'resorts/show'
        end
      end
    
      private
    
      def answer_params
        params.require(:answer).permit(:content)
      end

end
