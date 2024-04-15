#Golang image
FROM golang:latest as builder
# at this stage the image size was 831MB

#metadata 
LABEL maintainer="Ramjan Ali"
LABEL version="1.0"
LABEL description="This is a Go application builder stage"

#working directory
WORKDIR /app

# Copy the Go application source code into the builder stage
COPY . .

# Building the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o myapp .

# Start with a minimal base image for the final stage
FROM scratch


# Set the working directory in the final stage
WORKDIR /app

# Copy the compiled binary from the builder stage to the final stage
COPY --from=builder /app/myapp .

# Command to run the Go application
CMD ["/app/myapp"]