##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.0]
- Rails [6.0.2]

##### 1. Check out the repository

```bash
git clone https://github.com/mabuelkhair/telegram-bot.git
```

##### 2. Setup environment

Run the following commands to create and setup the database.

```ruby
bundle
rails db:create
rails db:migrate
```
##### 3. Add credentials
Set rails credentials of project **before running it**

please remove files inside config/credintials to create your own credintials
use below command to edit credentials
please replace **subl** with whatever editor you prefer I prefer sublime that's why I use subl 
```bash
EDITOR="subl --wait" rails credentials:edit --environment development
```
add secrets like below
```
telegram:
  bot_token: your_bot_token
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```bash
rails s
```

#### 5. Start listener
to listen for new received messages
```bash
rails r lib/bot.rb
```

And now you can access the app using this URL http://localhost:3000

##### 4. To Run Test

Just run this command to check run tests

```ruby
rails test
```


#### TODO 
1- use webhook (currently it uses long polling to be able to run app locally without the need of ngrok or any similar app)

2- update UI when message received (currently: it's save to database but not reflected to UI you have to refresh)

3- Add more tests 
