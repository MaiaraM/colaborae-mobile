import 'package:http/http.dart' as http;
// import 'dart:convert';

const base_URL = 'https://api-colaborae.herokuapp.com';
const createServiceEndPoint = '/services';

class HttpRequest {
  Future createService(String title, String desc, double price) async {
    http.Response response =
        await http.post('$base_URL$createServiceEndPoint', body: {
      "title": title,
      "description": desc,
      "valor": price,
      "user": {"uuid": "joao"}
    });

    if (response.statusCode == 201) {
      return response.body;
    } else {
      return response.statusCode;
    }
  }
}
