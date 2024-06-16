FROM marpteam/marp-cli:v3.4.0

USER root
WORKDIR /github/workspace

COPY fontconfig.xml /home/marp/.cli-action/
COPY package.json /home/marp/.cli-action/
RUN cd /home/marp/.cli-action/ && npm i
COPY entrypoint.js /home/marp/.cli-action/
COPY engine.mjs /home/marp/.cli-action/

ENTRYPOINT ["/home/marp/.cli-action/entrypoint.js"]
CMD []
