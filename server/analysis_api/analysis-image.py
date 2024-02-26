import functions_framework
import base64
import vertexai
from vertexai.preview.generative_models import GenerativeModel, Part
import vertexai.preview.generative_models as generative_models
from flask import jsonify
import re

@functions_framework.http
def http_start(request):
    try:
        request_json = request.get_json(silent=True)
        request_args = request.args

        vertexai.init(project="eandi-414008", location="asia-northeast3")
        model = GenerativeModel("gemini-pro-vision")

        if request_json and 'input_data' in request_json:
            input_data = request_json['input_data']
            if 'type' in input_data and 'image' in input_data:
                type_value = input_data['type']
                image_file = input_data['image']

                q_text = ""
                if type_value == "1":
                    q_text = "Please answer true or false if there is an eco-friendly product in the image."
                elif type_value == "2":
                    q_text = "Please answer true or false if the email box in the image is empty."
                elif type_value == "3":
                    q_text = "Please answer true or false whether the image is vegetarian or not."
                else:
                    q_text = "Please answer true or false if the image shows a washing machine or part of a washing machine."

                check_image = Part.from_data(data=base64.b64decode(image_file), mime_type="image/png")

                responses = model.generate_content(
                    [check_image, q_text],
                    generation_config={
                        "max_output_tokens": 2048,
                        "temperature": 0.4,
                        "top_p": 1,
                        "top_k": 32
                    },
                    safety_settings={
                        generative_models.HarmCategory.HARM_CATEGORY_HATE_SPEECH: generative_models.HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
                        generative_models.HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT: generative_models.HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
                        generative_models.HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT: generative_models.HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
                        generative_models.HarmCategory.HARM_CATEGORY_HARASSMENT: generative_models.HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE,
                    },
                    stream=False,
                )

                #fin_res = ""
                #for response in responses:
                #    fin_res += response

                check_text = responses.candidates[0].content.parts[0].text

                re_text = ""

                true_matches = re.findall(r'\bTrue\b', check_text, re.IGNORECASE)

                if len(true_matches) >= 1:
                    re_text = "True"
                else : 
                    re_text = "False"

                return jsonify({"data": {"type": type_value, "res": re_text }}), 200

            else:
                # Handle the case when one or more of the keys are missing
                return jsonify({"error": "Invalid input_data format"}), 400
        else:
            # Handle the case when 'input_data' is not present in the JSON data
            return jsonify({"error": "Missing 'input_data' in the request JSON."}), 400
    except Exception as e:
        return jsonify({"error": str(e)}), 500