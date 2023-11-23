import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatCompletitionApi{

  static const String _API_KEY = "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";

  Future<http.Response> sendPrompt(String prompt) async {

    http.Response req = await http.post(Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: <String,String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $_API_KEY"
        },
        body: '{"model": "gpt-3.5-turbo-1106", "messages": ${prompt}}',
    );

    return req;
  }
}