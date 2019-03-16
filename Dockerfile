# beginning of first phase: building the binaries
FROM node:11.10.1 as builder

WORKDIR '/app'
COPY package.json .
RUN ["npm", "install"]
COPY . .
RUN ["npm", "run", "build"]

# the second FROM statement finishes the phase and starts the second one
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
# base image already takes care of starting nginx server for us

