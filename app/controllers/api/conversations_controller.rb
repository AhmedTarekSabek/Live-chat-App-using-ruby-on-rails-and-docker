module Api
    class ConversationsController < ApplicationController
        def index
            conversations = Conversation.find_by_sql("SELECT * FROM conversations 
            WHERE sender_id ='#{current_user.id}'")
            render json: {status: 'SUCCESS', data: conversations}, status: :ok
        end

        def show
            messages = Message.find_by_sql("SELECT * FROM messages 
            WHERE user_id ='#{current_user.id}'AND conversation_id = '#{params[:id]}' ")
            render json: {status: 'SUCCESS', data: messages}, status: :ok
        end
    end
end