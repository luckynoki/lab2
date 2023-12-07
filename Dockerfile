FROM python:3.8
WORKDIR /app/moviereviewsproject
RUN apt update
RUN pip install Django==4.0
RUN pip install Pillow
ADD moviereviewsproject.tar.gz /app/
EXPOSE 8000
CMD [ "python3", "manage.py" , "runserver", "0.0.0.0:8000"]
