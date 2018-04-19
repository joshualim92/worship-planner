FROM node:9 as dev
RUN apt-get update && apt-get install -y \
	    git \
	    vim
ENV HOST 0.0.0.0
WORKDIR /home/node/app
COPY package.json package-lock.json ./
RUN npm install --only=production && \
	cp -r node_modules prod_node_modules && \
	npm install
COPY . .
RUN npm test

FROM dev as build
WORKDIR /home/node/app
COPY package.json ./
RUN npm run build

FROM node:9-alpine
ENV HOST 0.0.0.0
WORKDIR /home/node/app
COPY --from=dev /home/node/app/package.json .
COPY --from=dev /home/node/app/prod_node_modules node_modules
COPY --from=build /home/node/app/.nuxt .nuxt
USER node
CMD ["npm", "start"]
