class QuestionsController < ApplicationController
    before_action :validate_user

    def validate_user
      @user = current_user
    end

    def create
        @resort = Resort.find(params[:resort_id])
        @question = Question.new(question_params)
        @question.resort = @resort
        @question.user = current_user
        if @question.save!
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

    def question_params
        params.require(:question).permit(:question)
    end

end
