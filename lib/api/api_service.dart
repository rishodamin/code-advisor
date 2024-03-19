import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final gpturl = "http://192.168.204.75:5000/answer";
  final compilerApiUrl = 'https://onecompiler-apis.p.rapidapi.com/api/v1/run';

  Future<String> answer(String query) async {
    final payload = {
      'query': query,
    };

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse(gpturl),
      headers: headers,
      body: json.encode(payload),
    );
    return jsonDecode(response.body)['message'];
  }

  Future<String> compile(
    String code,
    String input,
  ) async {
    final payload = {
      "stdin": input,
      "language": "python",
      "files": [
        {
          "name": "index.py",
          "content": code,
        }
      ]
    };

    final headers = {
      "content-type": "application/json",
      "X-RapidAPI-Key": "3fcd1f98abmshf9e4f853424d9dep1f0690jsnfdfdce4debe4",
      "X-RapidAPI-Host": "onecompiler-apis.p.rapidapi.com",
    };

    final response = await http.post(
      Uri.parse(compilerApiUrl),
      headers: headers,
      body: json.encode(payload),
    );
    final resp = jsonDecode(response.body);
    String result;
    if (resp['stdout'] != null) {
      result = resp['stdout'] + '\n' + (resp['exception'] ?? '');
    } else {
      result = resp['exception'] ?? '';
    }
    result += "\n ${(resp['stderr'] ?? '')}";
    return result;
  }
}
