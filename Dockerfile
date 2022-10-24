FROM python:3.9
ENV PYTHONUNBUFFERED 1
RUN apt update && apt install gettext -y && apt install cron -y 
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY . /app
RUN crontab -l | { cat; echo "45 */4 * * * /usr/local/bin/python /app/manage.py search_index --rebuild 2>&1"; } | crontab -
RUN cron
CMD python manage.py runserver 0.0.0.0:8000
