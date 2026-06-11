class PrepTasksController < ApplicationController
  before_action :set_prep_task, only: %i[ show edit update destroy ]

  # GET /prep_tasks or /prep_tasks.json
  def index
    @prep_tasks = PrepTask.all
  end

  # GET /prep_tasks/1 or /prep_tasks/1.json
  def show
  end

  # GET /prep_tasks/new
  def new
    @prep_task = PrepTask.new
  end

  # GET /prep_tasks/1/edit
  def edit
  end

  # POST /prep_tasks or /prep_tasks.json
  def create
    @prep_task = PrepTask.new(prep_task_params)

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

  # PATCH/PUT /prep_tasks/1 or /prep_tasks/1.json
  def update
    respond_to do |format|
      if @prep_task.update(prep_task_params)
        format.html { redirect_to @prep_task, notice: "Prep task was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @prep_task }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @prep_task.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /prep_tasks/1 or /prep_tasks/1.json
  def destroy
    @prep_task.destroy!

    respond_to do |format|
      format.html { redirect_to prep_tasks_path, notice: "削除しました。", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prep_task
      @prep_task = PrepTask.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def prep_task_params
      params.expect(prep_task: [ :user_id, :title, :target_qty, :actual_qty, :prep_date, :comment, :completed ])
    end
end
