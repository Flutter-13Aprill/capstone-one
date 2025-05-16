

import 'package:dart_openai/dart_openai.dart';


Future<List<String>> generateSubtasks(String broadTask) async {
  try {
    // Set the API key directly
    OpenAI.apiKey = "";

    // Generate the subtasks using the chat endpoint
    final response = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.system,
          content: "YGenerate one word items based on input"
        ),
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.user,
          content: "Generate a list of subtasks for this task: $broadTask"
        ),
      ],
      maxTokens: 100,
      temperature: 0.7,
    );

    // Extract the generated text
    final text = response.choices.first.message.content.trim();
    return text.split('\n').map((task) => task.trim()).where((task) => task.isNotEmpty).toList();
  } catch (e) {
    print("Error generating subtasks: $e");
    return [];
  }
}




