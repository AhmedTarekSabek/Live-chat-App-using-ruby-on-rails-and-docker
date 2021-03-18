A chat app with Ruby on Rails and Docker
------

Getting Started
------

#### Clone The Repository
`git clone https://github.com/AhmedTarekSabek/Live-chat-App-using-ruby-on-rails-and-docker.git`

#### Change directory
`cd Live-chat-App-using-ruby-on-rails-and-docker`

#### Run Docker command
Docker-compose up

How to use
------
- You have two options:
  - SignUp with your chosen username and password, or
  - Login with one of the 5 users emails in seeds (user-id@example.com) id = {1,2,3,4 or 5}
     and password: pass123
- Then, chose any user to start chating with him.
- signout from the current user(you can signout by clicking in username that you are using in the right of the top navbar) and login to the user that you sent messages to him to continue,or
  you can open two windows and login with two different users and try

Built With
------
- RubyOnRails, Sqlite and Docker

## Features

Live Chat App is a simple web application which allows real-time messages 
sending. It uses Action Cable Rails library to easily make use of Websockets
in order to provide client-client communication. 

#### Provided features

 - User Authentication (sign up and logging)
 - Creating conversation with any user
 - Each user has number of chats he made in it's table in DB,
   Also each conversation has number of messages created in it in it's table in DB.
 - Displaying new messages in real-time
 - Simple GUI makes it easy to deal with the web app.
 - Restful API :
      - http://localhost:3000/api/conversations  -> Gets All of users conversations
      - http://localhost:3000/api/conversations/{id} -> Gets All of the messages in conversation with ID={id} 
      - http://localhost:3000/api/messages  -> Gets All the messages that the current user sent to any user
      - http://localhost:3000/api/messages/{id} -> Gets the details of the message with ID={id}
      - http://localhost:3000/api/users -> Gets All the users registered in the site
      - http://localhost:3000/api/users/{id -> Gets All the details of the user with ID={id}

## Further development

To extend app functionality following features will be added asap:
 - Add feature to share files, like photos with other app users.
 - Add feature to search inside messages using ex: Elastic Search.
 - Using MySQL/Postgres instead of sqlite 
