# Getting Started

## How to deploy on development server:

### First set variables in .env file:
```sh
ENV=DEVELOPMENT

DB_USER=<your_username>
DB_PASSWORD=<your_password>

DOCKER_GATEWAY=172.22.0.1
```

### Run the development server with docker:
```sh
docker-compose up --build
```
Enter in interactive prompt inside the container:
```sh
docker-compose exec web sh
```
Now, run commands to make migrations and create Django admin user:
```sh
python manage.py migrate 
python manage.py createsuperuser
```

Open http://localhost:8000 with your browser to see the result.

## How to deploy on Heroku:
```sh
heroku create <your_app_name>
```
```sh
heroku config:set APP_NAME=<your_app_name>
heroku config:set ENV=PRODUCTION 
heroku config:set SECRET_KEY=<your_secret_key>
```
Then push the app to heroku:
```sh
git push heroku master
```

Run commands to make migrations and create Django admin user:
```sh
heroku run python manage.py migrate 
heroku run python manage.py createsuperuser
```

Open http://your_app_name.herokuapp.com> with your browser to see the result.