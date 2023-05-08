import 'dart:convert';
import 'package:http/http.dart' as http;

class getGiphy {
  String? search;
  int offset = 0;

  Future<Map> getGifs() async {
    http.Response response;
    if (search == null || search!.isEmpty) {
      response = await http.get(Uri.parse(
          "https://api.giphy.com/v1/gifs/trending?api_key=FV1WzqGyEFsfYvjvdlJZ2jui6oCcZ9OY&limit=19&rating=g"));
    } else {
      response = await http.get(Uri.parse(
          "https://api.giphy.com/v1/gifs/search?api_key=FV1WzqGyEFsfYvjvdlJZ2jui6oCcZ9OY&q=$search&limit=19&offset=$offset&rating=g&lang=en"));
    }
    return json.decode(response.body);
  }
}
