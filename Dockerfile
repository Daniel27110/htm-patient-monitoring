# Use an official Python image as base
FROM python:3.13


# Set working directory
WORKDIR /app


# Install dependencies for building HTM.core
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    cmake \
    build-essential \
    wget \
    && rm -rf /var/lib/apt/lists/*


# Clone the HTM.core repository
RUN git clone https://github.com/htm-community/htm.core


# Create and activate a virtual environment and build HTM.core
RUN python3 -m venv .venv && \
    . .venv/bin/activate && \
    cd htm.core && \
    python htm_install.py


# Install all additional dependencies
RUN . .venv/bin/activate && \
    pip install jupyter && \
    pip install pandas && \
    pip install matplotlib && \
    pip install numpy && \
    pip install scipy && \
    pip install scikit-learn

    
# Add virtualenv bin to PATH
ENV PATH="/app/.venv/bin:$PATH"


# Default command
CMD ["python"]
