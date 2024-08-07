FROM ubuntu:latest

# Install openssl
RUN apt-get update && apt-get install -y openssl

# Copy the encrypted credentials into the container
COPY credentials.enc /app/credentials.enc

# Copy the decryption password file (ensure this is securely handled)
COPY decrypt_password.txt /app/decrypt_password.txt

# Decrypt the credentials
RUN openssl enc -d -aes-256-cbc -in /app/credentials.enc -out /app/credentials.txt -pass file:/app/decrypt_password.txt

# Run a shell to inspect the decrypted credentials
CMD ["/bin/bash"]
