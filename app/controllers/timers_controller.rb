# frozen_string_literal: false

# Controller of timers
class TimersController < ApplicationController
  before_action :set_task, only: %i[index create stop edit update destroy]
  before_action :set_timer, only: %i[stop edit update destroy]

  def index
    @timers = @task.timers
  end

  def create
    @timer = @task.timers.build(started_at: Time.current)

    if @timer.save
      flash[:notice] = 'Таймер успешно создан'
    else
      flash[:alert] = 'Не удалось создать таймер'
    end
    redirect_to @task
  end

  def stop
    if @timer.update(stoped_at: Time.current, total_time: (Time.current - @timer.started_at).to_i)
      flash[:notice] = 'Таймер успешно обновлен'
    else
      flash[:alert] = 'Не удалось обновить таймер'
    end
    redirect_to @task
  end

  def edit; end

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
    time_params = params[:timer]
    hours = time_params[:hours].to_i
    minutes = time_params[:minutes].to_i
    seconds = time_params[:seconds].to_i

    (hours * 3600 + minutes * 60 + seconds).to_i
  end

  def timer_params
    params.require(:timer).permit(:hours, :minutes, :seconds)
  end
end
