FROM python:3.10-slim

# Install curl and clean apt cache
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Deno
RUN curl -fsSL https://deno.land/install.sh | sh \
    && ln -s /root/.deno/bin/deno /usr/local/bin/deno

# Fix: upgrade pip separately
RUN python3 -m pip install --upgrade pip setuptools wheel

# Start command
CMD ["bash", "start"]
