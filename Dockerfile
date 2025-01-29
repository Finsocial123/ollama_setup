FROM ollama/ollama

ARG MODEL_NAME=gemma2:2b
ARG ADDITIONAL_MODELS="athene-v2 nemotron-mini llama3.2-vision"

ENV OLLAMA_HOST 0.0.0.0:8000
ENV OLLAMA_KEEP_ALIVE -1

RUN ollama serve & sleep 5 && \
    ollama pull $MODEL_NAME && \
    for model in $ADDITIONAL_MODELS; do ollama pull $model; done

ENTRYPOINT ["ollama", "serve"]
