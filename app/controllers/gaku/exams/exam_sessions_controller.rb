module Gaku
  class Exams::ExamSessionsController < GakuController

    respond_to :js, except: :index

    before_action :set_exam_session, only: %i( edit update destroy )
    before_action :load_data, only: %i( new edit )
    before_action :set_count, only: :create

    def new
      @exam_session = ExamSession.new
      respond_with @exam_session
    end

    def create
      @exam_session = ExamSession.create(exam_session_params)
      set_count
      respond_with @exam_session
    end

    def edit
      respond_with @exam_session
    end

    def update
      @exam_session.update(exam_session_params)
      respond_with @exam_session, location: [:edit, @exam_session]
    end

    def destroy
      @exam_session.destroy!
      respond_with @exam_session, location: [:exams]
    end

    private

    def exam_session_params
      params.require(:exam_session).permit(attributes)
    end

    def attributes
      %i( name session_time exam_id session_start )
    end

    def set_exam_session
      @exam_session = ExamSession.find(params[:id])
    end

    def load_data
      @exams = Exam.all
    end

    def set_count
      @count = ExamSession.count
    end

  end
end
