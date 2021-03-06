class TodosController < ApplicationController
    def index
        @todos = Todo.order(due: :asc,due: :asc)
        @todo = Todo.new
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def new
        @todo = Todo.new
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def create
        @newtodo = Todo.new(todo_params)

        if @newtodo.save
            redirect_to root_url, notice: 'Creation Successfull'
          else
            redirect_to root_url, notice: 'Creation Unsuccessfull'    
          end
    end

    def update
        @todo = Todo.find(params[:id])

        if @todo.update(todo_params)
            redirect_to root_url, notice: 'Update Successfull'    
          else
            render :edit    
          end
    end

    def destroy
        @todo = Todo.find(params[:id])

        @todo.destroy

        redirect_to root_url,notice: 'Deletion Successfull'
    end

    private 
        def todo_params
            params.require(:todo).permit(:content, :status, :due, :priority)
        end
end
