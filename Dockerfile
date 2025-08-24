FROM python:3.13-slim

WORKDIR /app

# Copy dependency files
COPY pyproject.toml uv.lock ./

# Install uv and dependencies
RUN pip install uv && \
    uv pip install --system -e .

# Copy source code
COPY src/ ./src/

# Set environment variable for the RIOT API key
ENV RIOT_API_KEY=""

# Expose port if needed (for MCP server)
EXPOSE 8000

# Default command to run the server
CMD ["python", "-m", "src.server"]
