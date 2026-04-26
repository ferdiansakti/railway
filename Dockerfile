FROM tensorflow/serving

# 🔥 FIX PATH
COPY model/cc-model /models/cc-model

ENV MODEL_NAME=cc-model
ENV PORT=8080

CMD tensorflow_model_server \
  --rest_api_port=$PORT \
  --model_name=cc-model \
  --model_base_path=/models/cc-model