# DevNest
Collaborate with Likeminded Developers

# setup_devnest.sh 
is to setup project from the scratch.

# setup project form git
git clone repo-url
python manage.py migrate
python manage.py createsuperuser --username batman --email chetan@gmail.com   // Pass - devrest
python manage.py runserver

# Docker setup 
## Development 
docker build -t devnest_api:dev --target development .
docker run -p 8000:8000 devnest_api:dev

and access with http://localhost:8000

## Production
docker build -t devnest_api:prod --target production .
docker run -p 8000:8000 devnest_api:prod

http://localhost:8000 (with gunicorn)

## Deploy Postgres
docker run --name devnest_postgres -e POSTGRES_DB=devnest -e POSTGRES_USER=devnestuser -e POSTGRES_PASSWORD=devnest -p 5434:5432 -d postgres:latest (can change port 5432)

-- change into settings.py for postgres sql
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": "devnest",
        "USER": "devnestuser",
        "PASSWORD": "devnest",
        "HOST": "127.0.0.1",
        "PORT": "5434",
    }
}

python manage.py makemigrations
python manage.py migrate

