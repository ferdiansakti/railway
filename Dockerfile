FROM tensorflow/serving

# copy model
COPY model /models/cc-model

# set nama model
ENV MODEL_NAME=cc-model

# 🔥 penting untuk railway
ENV PORT=8080

# 🔥 ini yang bikin jalan
CMD tensorflow_model_server \
  --rest_api_port=$PORT \
  --model_name=cc-model \
  --model_base_path=/models/cc-model