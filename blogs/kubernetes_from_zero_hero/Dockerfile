FROM ubuntu:latest

# Identify the maintainer of an image
MAINTAINER Ala Raddaoui "raddaouiala@gmail.com"

# define an environment variable for the image
ENV PORT 8888
# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y

# Install python
RUN apt-get install python -y

# Expose port 8888
EXPOSE $PORT

# Copy our python code from our local host to the image under the /app directory
ADD ./server.py /app/server.py

# run all future commands from the app directory
WORKDIR /app

# start our server on defined port
CMD python server.py $PORT

