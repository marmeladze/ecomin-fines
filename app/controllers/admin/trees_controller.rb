module Admin
  class TreesController < BaseController
    before_action :set_tree, only: [:show, :edit, :update, :destroy]

    def index
      @trees = Tree.all
    end

    def show
    end

    def new
      @tree = Tree.new
    end

    def edit
    end

    def create
      @tree = Tree.new(tree_params)

      if @tree.save
        redirect_to admin_trees_path notice: 'Tree was successfully created.'
      else
        render :new
      end

    end


    def update
      if @tree.update(tree_params)
        redirect_to admin_trees_path, notice: 'Tree was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @tree.destroy
      redirect_to admin_trees_url, notice: 'Tree was successfully destroyed.'
    end

    private

    def set_tree
      @tree = Tree.find(params[:id])
    end

    def tree_params
      params.require(:tree).permit(:name, :description)
    end

  end
end