import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Flight>> fetchFlights(String from, String to) async {
  final url = Uri.parse('https://travel-advisor.p.rapidapi.com/flights/create-session');
  
  final response = await http.get(url, headers: {
    'X-RapidAPI-Host': 'travel-advisor.p.rapidapi.com',
    'X-RapidAPI-Key': 'b0cf2c65c5mshcd64057c5dfd15cp1ae034jsn6918ae4fc72d', // Buraya RapidAPI anahtarınızı girin
  });

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    // API cevabını işleyin
    List flightsData = data['flights'];
    return flightsData.map((flight) => Flight.fromJson(flight)).toList();
  } else {
    print('Request failed with status: ${response.statusCode}');
    return [];
  }
}

class Flight {
  final String airline;
  final double price;

  Flight({required this.airline, required this.price});

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      airline: json['airline'],
      price: json['price'].toDouble(),
    );
  }
}
