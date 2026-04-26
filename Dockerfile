FROM tensorflow/serving:latest

# copy model ke container
COPY model /models/cc-model

# set model name
ENV MODEL_NAME=cc-model

# expose port
EXPOSE 8501