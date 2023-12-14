import 'package:flutter/material.dart';
import 'package:turolconnect_tfg/models/event_model.dart';

class EventDetailsPage extends StatelessWidget {
  final String imageUrl;

  EventDetailsPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Evento'),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
