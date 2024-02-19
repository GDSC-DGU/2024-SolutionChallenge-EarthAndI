import functions_framework
import vertexai
from vertexai.language_models import TextGenerationModel
from flask import jsonify

@functions_framework.http
def start(request):
    """HTTP Cloud Function.
    Args:
        request (flask.Request): The request object.
        <https://flask.palletsprojects.com/en/1.1.x/api/#incoming-request-data>
    Returns:
        The response text, or any set of values that can be turned into a
        Response object using `make_response`
        <https://flask.palletsprojects.com/en/1.1.x/api/#flask.make_response>.
    """

    request_json = request.get_json(silent=True)
    request_args = request.args

    vertexai.init(project="eandi-414008", location="asia-northeast3")
    parameters = {
        "candidate_count": 1,
        "max_output_tokens": 1024,
        "temperature": 0.6,
        "top_p": 1
    }

    model = TextGenerationModel.from_pretrained("text-bison")

    if request_json and 'input_text' in request_json:
        input_text = request_json['input_text']
        if 'type' in input_text and 'question' in input_text and 'answer' in input_text:
            type_value = input_text['type']
            question_value = input_text['question']
            answer_value = input_text['answer']

            response = model.predict(
            f"""
            // 프롬프트

            // 들어가는 자리
            
            input: {type_value}
            input: {question_value}
            input: {answer_value}
            output:
            """,
                **parameters
            )

            split_values = response.text.split(',')

            return jsonify(
                {
                    "data" : 
                    {
                        "carbon" : 
                        {
                            "reduce" : split_values[0], 
                            "output":split_values[1]
                        }, 
                        "character" : 
                        {
                            "health" : split_values[0]
                        },  
                        "answer" : split_values[2]
                    },
                }
            ), 200
            
        else:
            # Handle the case when one or more of the keys are missing
            return jsonify({"error": "Invalid input_text format. 'type', 'question', and 'answer' are required."}), 400
    else:
        # Handle the case when 'input_text' is not present in the JSON data
        return jsonify({"error": "Missing 'input_text' in the request JSON."}), 400

