import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> generateImages(String prompt) async {
  String apiKey = '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';

  // Define the request body
  Map<String, dynamic> requestBody = {
    "model": "dall-e-3",
    "prompt": "Simple 3D cartoon depiction of a $prompt ",
    "n": 1,
    "size": "1024x1024"
  };

  // Define the headers
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $apiKey"
  };

  // Send the POST request
  http.Response response = await http.post(
    Uri.parse('https://api.openai.com/v1/images/generations'),
    headers: headers,
    body: json.encode(requestBody),
  );

  // Parse the response
  if (response.statusCode == 200) {
    // Extract the URLs from the response
    List<dynamic> data = json.decode(response.body)['data'];
    List<String> imageUrls =
        data.map((item) => item['url'].toString()).toList();
    return imageUrls;
  } else {
    // If the request fails, throw an error
    throw Exception('Failed to generate images: ${response.statusCode}');
  }
}
