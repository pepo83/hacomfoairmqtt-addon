ARG BUILD_FROM
FROM $BUILD_FROM

# System tools
RUN apk add --no-cache \
    python3 \
    py3-virtualenv \
    py3-pyserial \
    socat \
    jq

WORKDIR /app

# virtual env.
RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# Python-depend.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# App
COPY src/ /app/
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD ["/app/run.sh"]