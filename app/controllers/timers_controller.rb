class TimersController < ApplicationController
  before_action :set_task, only: [:index, :create, :stop, :edit, :update, :destroy]
  before_action :set_timer, only: [:stop, :edit, :update, :destroy]

  def index
    @timers = @task.timers
  end

  def create
    @timer = @task.timers.build(started_at: Time.now)

    if @timer.save
      flash[:notice] = "Таймер успешно создан"
    else
      flash[:alert] = "Не удалось создать таймер"
    end
    redirect_to @task
  end

  def stop
    if @timer.update(stoped_at: Time.now, total_time: (Time.now - @timer.started_at).to_i)
      flash[:notice] = "Таймер успешно обновлен"
    else
      flash[:alert] = "Не удалось обновить таймер"
    end
    redirect_to @task
  end

  def edit
  end

  def update
    if @timer.update(total_time: new_total_time)
      flash[:notice] = 'Запись времени успешно обновлена'
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @timer.destroy
    redirect_to @task
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_timer
    @timer = @task.timers.find(params[:id])
  end

  def new_total_time
    hours = params[:timer][:hours].to_i
    minutes = params[:timer][:minutes].to_i
    seconds = params[:timer][:seconds].to_i

    (hours * 3600 + minutes * 60 + seconds).to_i
  end

  def timer_params
    params.require(:timer).permit(:hours, :minutes, :seconds)
  end
end
