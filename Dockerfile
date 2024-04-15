# Golang image for the builder stage
FROM golang:latest as builder

# Set default build arguments

ARG APP_VERSION=1.0

# Metadata labels
LABEL maintainer="Ramjan Ali"
LABEL version=${APP_VERSION}
LABEL description="This is a Go application builder stage"

# Working directory
WORKDIR /app
exit
# Copy the Go application source code into the builder stage
COPY . .

# Building the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o myapp .

# Start with a minimal base image for the final stage
FROM alpine

# Set environment variables

ENV APP_VERSION=${APP_VERSION}

# Set the working directory in the final stage
WORKDIR /app

# Copy the compiled binary from the builder stage to the final stage
COPY --from=builder /app/myapp .

# Command to run the Go application
CMD ["/app/myapp"]