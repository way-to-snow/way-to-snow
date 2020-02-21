class QuestionsController < ApplicationController
    before_action :set_questions

    def set_questions
        @resort = Resort.find(params[:resort_id])
        @questions = @resort.questions 
    end


    def update
        @resort = Resort.find(params[:resort_id])
        @question = Question.new(question_params)
        @question.resort = @resort
        @question.user = current_user
        if @question.save!
         redirect_to resort_path(@resort)
        else
         render 'resorts/show'
        end
    end


    def show
        @question = Question.find(params[:id])
        @answer = Answer.new  # <-- You need this now.
    end

private

    def question_params
        params.require(:question).permit(:question)
    end

  

end
