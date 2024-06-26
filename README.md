# Go Server

A simple go server.

### Instructions to run by docker
Build the Docker image and run the container using the provided Dockerfile:

```bash
docker build --build-arg APP_VERSION=1.0 -t <app-name> .
docker run -it --rm -e PORT=33721 -p 8080:33721 <app-name>

During the builder stage, the image size was 831MB. By utilizing multi-stage building techniques, the final stage image size was reduced to 15.52MB.

Note: Replace `<app-name>` with your desired application name.




### Instructions to run locally

1. Configure GO in your system.
2. Download the dependencies using this command:
    ```bash
    go mod download
    ```
3. Set environment variable to the system for building the application:
    * `CGO_ENABLED=0`
    * `GOOS=linux`
4. Build the application:
    ```bash
    go build -o <your_desired_location>/go_server
    ```
5. Set environment variable for running:
    * `PORT=<your_desired_port>`
5. Run the built binary:
    ```bash
    <your_desired_location>/go_server
    ```

### Check if the server is running
1. Go to `http://localhost:<given_port>` and check if you see "`Hello, from Ostad! <3`".
2. Go to `http://localhost:<given_port>/healthcheck` and check if you see "`{"Status": "OK"}`".


