include Pagy::Backend
module Api
    module V1
        class RecipesController < ApplicationController
            def index
                pagy, recipes = pagy(Recipe.all, items:3);
                # recipes = Recipe.index;
                render json: {status: 'SUCCESS', message: 'Loaded recipes', data:recipes},status: :ok
                # render json: @recipes
            end

            def display
                recipes = Recipe.display(params[:user_id])
                render json: {status: 'SUCCESS', message: 'Loaded recipes of User', data:recipes},status: :ok
            end

            def show
                recipe = Recipe.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded recipes', data:recipe},status: :ok
            end

            def create
                recipe = Recipe.new(title: params[:title], description: params[:description] ,user_id: params[:user_id])
                if recipe.save
                    render json: {status: 'SUCCESS', message: 'Saved recipe', data:recipe},status: :ok
                else
                    render json: {status: 'Error', message: 'Recipe not saved', data:recipe},status: :unprocessable_entity
                end
            end

            def update
                recipe = Recipe.find(params[:id])
                if recipe.update_attributes(recipe_params)
                    render json: {status: 'SUCCESS', message: 'Updated recipe', data: recipe},status: :ok
                else
                    render json: {status: 'Error', message: 'Recipe not updated', data:recipes},status: :unprocessable_entity
                end
            end

            def destroy
                recipe = Recipe.find(params[:id])
                recipe.destroy
                render json: {status: 'SUCCESS', message: 'Deleted recipe', data:recipe},status: :ok
            end

            private

            def recipe_params
                params.permit(:title, :description, :user_id)
            end

        end
    end
end
