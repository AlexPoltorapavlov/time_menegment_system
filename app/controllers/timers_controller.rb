class TimersController < ApplicationController

  def index
    @task = Task.find(params[:id])
    @timers = @task.timers
  end

  def create
    @task = Task.find(params[:task_id])
    @timer = @task.timers.build(started_at: Time.now)

    if @timer.save
      flash[:notice] = "Таймер успешно создан"
    else
      flash[:alert] = "Не удалось создать таймер"
    end
    redirect_to @task
  end

end
