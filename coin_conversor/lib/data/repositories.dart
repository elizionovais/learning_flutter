import 'dart:convert';

import 'package:http/http.dart' as http;

const request = "https://api.hgbrasil.com/finance?format=json&key=fc0ef627";

class GetData {
  Future<Map> getConversor() async {
    http.Response response = await http.get(Uri.parse(request));
    return json.decode(response.body);
  }
}
