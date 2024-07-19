import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: BackgroundWaveClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 280,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _fromController,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(
                        
                        borderRadius:BorderRadius.circular(20.0)
                      ),
                      labelText: 'Nereden?',
                      prefixIcon: Icon(Icons.flight_takeoff),
                      
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _toController,
                    decoration: InputDecoration(
                      labelText: 'Nereye?',
                      prefixIcon: Icon(Icons.flight_land),
                      border:OutlineInputBorder(
                        
                        borderRadius:BorderRadius.circular(20.0)
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(Icons.date_range),
                    title: Text(
                      _selectedDate == null
                          ? 'Tarih seç'
                          : _selectedDate!.toLocal().toString().split(' ')[0],
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_down),
                    onTap: _selectDate,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Uçuş arama işlemi _searchFlights()
                    },
                    child: Text('Uçuşları ara'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
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
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
