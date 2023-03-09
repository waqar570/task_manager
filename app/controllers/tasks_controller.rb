class TasksController < ApplicationController
  
    def index
      @taskss = Task.all
    end
  
    def show
      @task = Task.find(params[:id])
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      if @task.save
          redirect_to(@task, :notice => 'Task is created')
      else
          render :new
      end
    end
  
    def edit
      @task = Task.find(params[:id])
    end
  
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        flash[:notice] = "You have successfully updated the task."
  
        redirect_to @task
      else
        render :edit
      end
    end
  
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
  
      redirect_to root_path
    end
  
    private
      def task_params
        params.require(:task).permit(:title, :description, :deadline)
      end
end