import 'package:http/http.dart' as http;  // Import the http package';


fetchData(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  // ignore: avoid_print
  print(response.body);
  return response.body;
}