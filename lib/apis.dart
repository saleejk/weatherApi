import 'package:http/http.dart' as http;

Future<void> getNumberFact({required int number}) async {
  final responce = http.get(Uri.parse('http://numbersapi.com/19?json'));
  print(responce);
}
