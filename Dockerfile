FROM node:14-alpine

# create destination directory
RUN mkdir -p /usr/src/backend
WORKDIR /usr/src/backend

# copy package.json
COPY package.json /usr/src/backend/
COPY package-lock.json /usr/src/backend/

RUN npm ci

# copy the app, note .dockerignore
COPY . /usr/src/backend/

# expose 3000 on container
EXPOSE 3001 9229

# start the app
CMD [ "npm", "start" ]
