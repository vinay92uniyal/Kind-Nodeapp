FROM ubuntu:latest

# Install openssl
RUN apt-get update && apt-get install -y openssl

# Copy the encrypted credentials and the decryption key into the container
COPY credentials.enc /home/mnagaraju/actions-runner/Testproject-inno/
COPY encryption_key.txt /home/mnagaraju/actions-runner/Testproject-inno/
COPY decrypt.sh /home/mnagaraju/actions-runner/Testproject-inno/decrypt.sh

# Make the decryption script executable
RUN chmod +x /home/mnagaraju/actions-runner/Testproject-inno/decrypt.sh

# Set the entrypoint to the decryption script
ENTRYPOINT ["/home/mnagaraju/actions-runner/Testproject-inno/decrypt.sh"]

# Start the shell to keep the container running
CMD ["tail", "-f", "/dev/null"]
