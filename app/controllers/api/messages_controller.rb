module Api
    class MessagesController < ApplicationController
        def index
            messages = Message.find_by_sql("SELECT * FROM messages 
            WHERE user_id ='#{current_user.id}' ")
            render json: {status: 'SUCCESS', data: messages}, status: :ok
        end

        def show
            message = Message.find_by_sql("SELECT * FROM messages 
            WHERE user_id ='#{current_user.id}' AND id = '#{params[:id]}'")
            render json: {status: 'SUCCESS', data: message}, status: :ok
        end
    end
end