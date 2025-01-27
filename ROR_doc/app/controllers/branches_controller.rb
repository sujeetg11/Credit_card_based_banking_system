class BranchesController < ApplicationController
    before_action :set_branch, only: %i[show update destroy]

    def index
        @branches = Branch.all
    end

    def show
        @branch = Branch.find(params[:id])
    end

    def new
        @branch = Branch.new
    end

    def create
        @branch = Branch.new(branch_params) 
        if @branch.save
            redirect_to @branch
        else
            render :new, status: :unprocessable_entity
        end
    end


    def edit
       @branch = Branch.find(params[:id]) 
    end

    def update
        if @branch.update(branch_params)
            redirect_to @branch
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @branch.destroy
        redirect_to branches_path, status: :see_other
    end
    
    private
    def set_branch
        @branch = Branch.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        flash[:alert] = "Branch not found."
        redirect_to branches_path and return
    end

    def branch_params
        params.require(:branch).permit(:branch_id, :branch_name, :branch_address, :branch_manager, :branch_phone, :branch_email)
    end
end
