module Api
    module V1
        class RecipestepsController < ApplicationController
            def index
                steps = Recipestep.index;
                render json: {status: 'SUCCESS', message: 'Loaded steps', data:steps},status: :ok
                # render json: @steps
            end

            def create
                step = Recipestep.new(title: params[:title], description: params[:description], order:params[:order], recipe_id:params[:recipe_id])
                if step.save
                    render json: {status: 'SUCCESS', message: 'Saved step', data:step},status: :ok
                else
                    render json: {status: 'Error', message: 'Recipe Step not saved', data:step},status: :unprocessable_entity
                end
            end

            def update
                step = Recipestep.query(params[:id])
                if step.update_attributes(steps_params)
                    render json: {status: 'SUCCESS', message: 'Updated step', data: step},status: :ok
                else
                    render json: {status: 'Error', message: 'Recipe Steps not updated', data:steps},status: :unprocessable_entity
                end
            end

            def destroy
                step = Recipestep.query(params[:id])
                step.destroy
                render json: {status: 'SUCCESS', message: 'Deleted step', data:step},status: :ok
            end

            private
            def steps_params
                params_permit(:recipe_id, :title, :description, :order)
            end
        end
    end
end
