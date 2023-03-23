class TasksController < ApplicationController
   
    def index
      @tasks = current_user.tasks
    end
  
    def show
      @task = current_user.tasks.find_by(params[:id])
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = current_user.tasks.new(task_params)
      if @task.save
        redirect_to(user_tasks_path, :notice => 'Task is created')
      else
        render :new
      end
    end
  
    def edit
      @task = current_user.tasks.find_by(params[:id])
    end
  
    def update
      @task = current_user.tasks.find_by(params[:id])
      if @task.update(task_params)
        flash[:notice] = "You have successfully updated the task."
        redirect_to user_task_path(current_user,@task)
      else
        render :edit
      end
    end
  
    def destroy
      @task = current_user.tasks.find_by(params[:id])
      @task.destroy
  
      redirect_to root_path
    end
  
    private
      def task_params
        params.require(:task).permit(:title, :description, :deadline, :status)
      end
end