class PrepTasksController < ApplicationController
  before_action :set_prep_task, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :require_manager!, only: [:new, :create, :edit, :update, :destroy]

  def index
      @prep_tasks = current_user.staff? ? PrepTask.incomplete : PrepTask.all
      @prep_tasks = @prep_tasks.by_date(params[:prep_date]) if params[:prep_date].present?
  end

  def show
  end

  def new
    @prep_task = PrepTask.new
  end

  def edit
  end

  def create
    @prep_task = PrepTask.new(prep_task_params)
    @prep_task.user = current_user

    respond_to do |format|
      if @prep_task.save
        format.html { redirect_to @prep_task, notice: "仕込みを登録しました。" }
        format.json { render :show, status: :created, location: @prep_task }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @prep_task.errors, status: :unprocessable_content }
      end
    end
  end

  def update
    respond_to do |format|
      if @prep_task.update(prep_task_params)
        format.html { redirect_to @prep_task, notice: "更新しました。", status: :see_other }
        format.json { render :show, status: :ok, location: @prep_task }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @prep_task.errors, status: :unprocessable_content }
      end
    end
  end

  def destroy
    @prep_task.destroy!

    respond_to do |format|
      format.html { redirect_to prep_tasks_path, notice: "削除しました。", status: :see_other }
      format.json { head :no_content }
    end
  end

  def complete
    @prep_task = PrepTask.find(params[:id])
    if @prep_task.update(actual_qty: params[:actual_qty], comment: params[:comment], staff_id: current_user.id, completed: true)
      redirect_to prep_tasks_path, notice: "完了報告しました"
    else
      render :show
    end
  end

  private
  def set_prep_task
    @prep_task = PrepTask.find(params.expect(:id))
  end

  def prep_task_params
    params.expect(prep_task: [ :user_id, :title, :target_qty, :actual_qty, :prep_date, :comment, :completed ])
  end
end
