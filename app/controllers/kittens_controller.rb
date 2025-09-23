class KittensController < ApplicationController
    def index
        @kittens = Kitten.all
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def create
        @kitten = Kitten.new(kitten_params)
        if @kitten.save
            redirect_to @kitten, notice: "Kitten was successfully created - meow"
        else
            render :new, alert: "Failed to create Kitten"
        end
    end

    def update
        @kitten = Kitten.find(params[:id])
        if @kitten.update(kitten_params)
            redirect_to @kitten, notice: "Kitten updated successfully"
        else
            render :edit, alert: "Failed to update Kitten."
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy
        redirect_to kittens_path, notice: "Kitten was successfully destroyed, you monster"
    end

    private

    def kitten_params
        # params.expect(kitten: [:name, :age, :cuteness, :softness])
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end