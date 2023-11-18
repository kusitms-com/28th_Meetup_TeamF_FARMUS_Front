import 'package:dio/dio.dart';

Future<Map<String, dynamic>> fetchData() async {
  Dio dio = Dio();
  var url = '';

  try {
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data; // Dio automatically parses JSON data
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
