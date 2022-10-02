module Api
    class CategoriesController < ApplicationController
        def show
            if params[:id]
                categories = Category.find(params[:id])
            else
                categories = Category.order('created_at ASC')
            end
            render json: {
                status: 'success', 
                code: '200', 
                message: 'Categoryes Data',
                data: categories
            },
            status: :ok
        end
    end    
end