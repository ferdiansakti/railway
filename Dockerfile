FROM tensorflow/serving:2.13.0

# copy model
COPY model/cc-model /models/cc-model

# env
ENV MODEL_NAME=cc-model

# 🔥 Railway port
ENV PORT=8080

# 🔥 FIX: gunakan JSON array (bukan shell form)
CMD ["tensorflow_model_server",
     "--rest_api_port=8080",
     "--model_name=cc-model",
     "--model_base_path=/models/cc-model"]