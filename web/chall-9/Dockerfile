# Use the official Golang image as a base image
FROM golang:1.20-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go app
RUN go build -o main=0755 .

# Expose port 8080 to the outside world
EXPOSE 8080


# Command to run the executable
CMD ["./main"]

