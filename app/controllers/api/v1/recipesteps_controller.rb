module Api
    module V1
        class RecipestepsController < ApplicationController
            def index
                steps = Recipe.index;
                render json: {status: 'SUCCESS', message: 'Loaded steps', data:steps},status: :ok
                # render json: @steps
            end

            def create
                step = Recipe.new(title: params[:title], description: params[:description] ,user_id: params[:user_id])
                if step.save
                    render json: {status: 'SUCCESS', message: 'Saved step', data:step},status: :ok
                else
                    render json: {status: 'Error', message: 'Recipe not saved', data:step},status: :unprocessable_entity
                end
            end

            def update
                step = Recipe.find(params[:id])
                if step.update_attributes(recipe_params)
                    render json: {status: 'SUCCESS', message: 'Updated step', data: step},status: :ok
                else
                    render json: {status: 'Error', message: 'Recipe Steps not updated', data:steps},status: :unprocessable_entity
                end
            end

            def destroy
                step = Recipe.find(params[:id])
                step.destroy
                render json: {status: 'SUCCESS', message: 'Deleted step', data:step},status: :ok
            end

        end
    end
end
