from flask import Flask, request, jsonify
import tensorflow as tf
import numpy as np

app = Flask(__name__)

# load model
model = tf.keras.models.load_model("model")

FEATURE_KEYS = [
    "forehead_width_cm",
    "forehead_height_cm",
    "long_hair",
    "nose_wide",
    "nose_long",
    "lips_thin",
    "distance_nose_to_lip_long"
]

@app.route("/")
def home():
    return "Model Gender Classification API is running!"

@app.route("/predict", methods=["POST"])
def predict():
    data = request.json

    try:
        input_data = [float(data[key]) for key in FEATURE_KEYS]
        input_array = np.array([input_data])

        prediction = model.predict(input_array)[0][0]

        result = "Male" if prediction > 0.5 else "Female"

        return jsonify({
            "prediction": result,
            "confidence": float(prediction)
        })

    except Exception as e:
        return jsonify({"error": str(e)})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)