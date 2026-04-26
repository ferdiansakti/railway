FROM tensorflow/serving

# copy model (FIX PATH)
COPY model/cc-model /models/cc-model

# set nama model
ENV MODEL_NAME=cc-model

# Railway
ENV PORT=8080

# run TF Serving
CMD tensorflow_model_server \
  --rest_api_port=$PORT \
  --model_name=cc-model \
  --model_base_path=/models/cc-model