FROM marpteam/marp-cli:v3.4.0

USER root
WORKDIR /github/workspace

COPY fontconfig.xml /home/marp/.cli-action/
COPY package.json package-lock.json /home/marp/.cli-action/
RUN cd /home/marp/.cli-action/ && npm ci
COPY entrypoint.js /home/marp/.cli-action/

# Custom engine
RUN cd /home/marp/.cli-action/ && npm i @marp-team/marp-core @marp-team/marpit markdown-it-highlight-lines --save-dev
COPY engine.js /home/marp/.cli-action/

RUN npm list --depth=0

ENTRYPOINT ["/home/marp/.cli-action/entrypoint.js"]
CMD []
