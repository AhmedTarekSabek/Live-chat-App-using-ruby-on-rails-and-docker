class HomeController < ApplicationController
  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])

    #Update Chat_counts in User Table
    conversationsSentCount = Conversation.where(:sender_id => current_user.id).count
    conversationsRecievedCount = Conversation.where(:recipient_id => current_user.id).count
    allConversationsCount = conversationsSentCount+conversationsRecievedCount
    User.find_by_sql("UPDATE users
                      SET chats_count = '#{allConversationsCount}'
                      WHERE id ='#{current_user.id}';")
    #update messages_count in Conversation Table
    Conversation.all.each do |conversation|
      messagesCount = Message.where(:conversation_id => conversation.id).count
      Conversation.find_by_sql("UPDATE conversations
                      SET messages_count = '#{messagesCount}'
                      WHERE sender_id ='#{current_user.id}';")
    end
  end
end
