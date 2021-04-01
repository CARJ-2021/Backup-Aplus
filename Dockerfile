FROM mongo

# Install cron
RUN apt-get update && apt-get install -y cron

RUN apt-get install -y awscli

# Add files
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /run.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh