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

  def update
    @task = Task.find(params[:task_id])
    @timer = @task.timers.find(params[:id])

    if @timer.update(:stoped_at => Time.now, total_time: (Time.now - @timer.started_at).to_i)
      flash[:notice] = "Таймер успешно обновлен"
    else
      flash[:alert] = "Не удалось обновить таймер"
    end
    redirect_to @task
  end

end
