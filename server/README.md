# E&I Cloud Functions(FaaS) And VertexAI
This README provides instructions on how to set up and execute the pipeline for E&I's Vertex AI, along with configuring and deploying REST API Cloud Functions.

## Vertex AI Pipeline
- [Vertex-AI Set Up](https://cloud.google.com/vertex-ai/docs/featurestore/setup?hl=ko)
### Text
<img width="555" alt="vertex-ai-text" src="https://github.com/GDSC-DGU/2024-SolutionChallenge-EarthAndI/assets/62001944/c86b427a-a569-49aa-baf5-91f3b9f5188e">

The figure shows a pipeline for fine-tuning Google's Pathways Language Model2 (PaLM2) language model using Vertex AI on Google Cloud.

1. validate_pipeline: This step validates the pipeline to ensure that all required components are set up correctly.
2. tuning_graph: This represents the process of tuning the model to a specific task or dataset. This process typically involves tuning hyperparameters to optimize the performance of the model.
3. export_managed_dataset: This is the step to export the tuned dataset as a managed dataset. This dataset is used for training or evaluation.
4. dataset_encoder: Encodes the dataset and converts it into a format that the model can understand.
5. evaluation-dataset-encoder: This is the process of encoding an evaluation dataset, which is used to evaluate how well the model performs.
6. vertex-pipelines-prompt: Sets the pipeline prompts for Vertex AI. This can be a step to specify components or parameters for pipeline execution.
7. compose-params-for-model: This is the step to configure parameters for the model, determining what settings or hyperparameters the model needs before it can start training.
8. large_language_model_tuning: This is the actual tuning of the large language model. In this step, the model is trained for a specific task.
9. tensorboard-uploader: Upload the data generated during the training process to TensorBoard to visualize and monitor the training process.
10. deployment_graph: A pipeline for deploying the model. In this step, models are deployed to endpoints that users can access.
11. Upload-LLM-Model: The process of uploading a large, aligned language model to Vertex AI.
12. create-endpoint-and-deploy: Creates an endpoint where the model is available and deploys the model.


### Image
<img width="996" alt="vertex-ai-image" src="https://github.com/GDSC-DGU/2024-SolutionChallenge-EarthAndI/assets/62001944/2417c1a9-b413-4018-93c8-cfc651106f7e">

This figure schematizes the process of training and deploying Google's Vertex AI and PaLM 2 large language models (LLMs). It shows the process of starting with training data in JSONL format, training a large language model with Vertex AI, and finally integrating the trained model into a real-world software application.

1. JSONL Training Data: This represents the training data. The JSONL format is a text file where each line is a JSON object. Each object contains an input_text and output_text field, providing data for the model to train on.
2. Vertex AI: Part of the Google Cloud Platform, this is a service that builds, deploys, and manages large-scale machine learning models. This service is used to train and optimize models using training data you provide.
3. PaLM 2 LLM: This refers to Google's large language model, which is used as the base model for "adapter-based fine-tuning". Adapter-based fine-tuning is a technique for fine-tuning a model for a specific task by inserting small additional networks into an existing model.
4. Software Component: This represents the software component where the AI model built using Vertex AI and PaLM 2 LLM will actually be implemented. This component can be an AI application, service, client, or subsystem of a system.

## Prerequisites

Before running this function, make sure you have the following:

- [Node.js 18 installed](https://nodejs.org/en/about/previous-releases) 
- [Firebase CLI installed](https://firebase.google.com/docs/cli?hl=ko) 
- [Firebase project set up](https://firebase.google.com/?_gl=1*1wpq7mv*_up*MQ..*_ga*NzEyODE4MDQ5LjE3MDg4OTM3MDE.*_ga_CW55HF8NVT*MTcwODg5MzcwMC4xLjAuMTcwODg5MzcwMC4wLjAuMA..&hl=ko)
- [Firestore Set Up](https://firebase.google.com/docs/firestore/quickstart?hl=ko)
    - Create Document `users`, `follows`, `notification_logs`
    - [Change Policy](https://firebase.google.com/docs/firestore/security/get-started?hl=ko)
```
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.uid == userId;
    }
    
    match /follows/{userId} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.uid == userId;
    }
    
    match /notification_logs/** {
    	allow read, write: if false;
    }
  }
}
```

## Run And Deploy Trigger And Notificatoin API Cloud Functions
1. Clone this repository
```bash
git clone https://github.com/GDSC-DGU/2024-SolutionChallenge-EarthAndI.git server
```

2. npm dependences install
```bash
# Move to the `functions` subdirectory of quickstart-android
cd functions

# Install all of the dependencies of the cloud functions
cd functions
npm install

# Move to the `Parent Folder` subdirectory of quickstart-android
cd ../
```

3. Select the Firebase project you have created.
```bash
firebase use -add
```

### To run the sample app locally during development

4. Execute Emulators
```bash
firebase emulators:start --only functions
```

### To deploy the application

4. Deploy Project
```bash
firebase deploy
```

## References && Support
- [Firebase Support](https://firebase.google.com/support/)
