FROM tensorflow/serving:2.13.0

COPY model/cc-model /models/cc-model

ENV MODEL_NAME=cc-model
ENV PORT=8080

CMD ["tensorflow_model_server","--rest_api_port=8080","--model_name=cc-model","--model_base_path=/models/cc-model"]