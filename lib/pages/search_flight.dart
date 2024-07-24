import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    const minSize = 150.0;
    final p1Diff = ((minSize - size.height) * 0.5).truncate().abs();
    path.lineTo(0.0, size.height - p1Diff);

    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, minSize);

    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}

class SearchFlight extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchFlight> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  DateTime? _selectedDate;
  List<dynamic> _flights = [];
  String? _accessToken;

  @override
  void initState() {
    super.initState();
    _fetchAccessToken();
  }

  Future<void> _fetchAccessToken() async {
    final clientId = dotenv.env['AMADEUS_CLIENT_ID'];
    final clientSecret = dotenv.env['AMADEUS_CLIENT_SECRET'];
    final url = Uri.parse('https://test.api.amadeus.com/v1/security/oauth2/token');
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final body = {
      'grant_type': 'client_credentials',
      'client_id': clientId,
      'client_secret': clientSecret
    };

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _accessToken = data['access_token'];
        });
      } else {
        throw Exception('Failed to fetch access token');
      }
    } catch (e) {
      print('Failed to fetch access token: $e');
    }
  }

  Future<void> _searchFlights() async {
    if (_accessToken == null) {
      print('Access token is not available');
      return;
    }

    final from = _fromController.text.trim().toUpperCase();
    final to = _toController.text.trim().toUpperCase();
    final date = _selectedDate?.toIso8601String().split('T')[0];

    if (from.isNotEmpty && to.isNotEmpty && date != null) {
      if (from.length != 3 || to.length != 3) {
        _showErrorDialog('Please enter valid 3-letter IATA codes for both origin and destination.');
        return;
      }

      final url = Uri.parse(
          'https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$from&destinationLocationCode=$to&departureDate=$date&adults=1&nonStop=false&max=250');
      final headers = {'Authorization': 'Bearer $_accessToken'};

      try {
        final response = await http.get(url, headers: headers);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          setState(() {
            _flights = data['data'];
          });
        } else {
          print('Error response code: ${response.statusCode}');
          print('Error response body: ${response.body}');
          _showErrorDialog('Failed to load flights. Please check the input and try again.');
        }
      } catch (e) {
        print('Failed to load flights: $e');
        _showErrorDialog('Failed to load flights. Please try again later.');
      }
    } else {
      _showErrorDialog('Please enter both origin and destination codes and select a date.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _fromController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: 'From',
                      prefixIcon: const Icon(Icons.flight_takeoff),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _toController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: 'To',
                      prefixIcon: const Icon(Icons.flight_land),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.date_range),
                    title: Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : _selectedDate!.toLocal().toString().split(' ')[0],
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_down),
                    onTap: _selectDate,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _searchFlights,
                    child: const Text('Search Flights'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _flights.length,
                    itemBuilder: (context, index) {
                      final flight = _flights[index];
                      final offer = flight['price']['total'];
                      final itineraries = flight['itineraries'][0];
                      final segments = itineraries['segments'];
                      final departure = segments[0]['departure']['iataCode'];
                      final arrival = segments[segments.length - 1]['arrival']['iataCode'];
                      final departureTime = segments[0]['departure']['at'];
                      final arrivalTime = segments[segments.length - 1]['arrival']['at'];

                      return Card(
                        child: ListTile(
                          title: Text('$departure to $arrival'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Departure: $departureTime'),
                              Text('Arrival: $arrivalTime'),
                              Text('Price: \$${offer}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
