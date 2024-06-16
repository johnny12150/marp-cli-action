FROM marpteam/marp-cli:v3.4.0

USER root
WORKDIR /github/workspace

COPY fontconfig.xml /home/marp/.cli-action/
COPY package.json /home/marp/.cli-action/
RUN cd /home/marp/.cli-action/ && npm i
COPY entrypoint.js /home/marp/.cli-action/

# Custom engine
RUN npm i @marp-team/marp-core markdown-it-highlight-lines --save-dev
COPY engine.js /home/marp/.cli-action/

RUN npm list --depth=0

ENTRYPOINT ["/home/marp/.cli-action/entrypoint.js"]
CMD []
