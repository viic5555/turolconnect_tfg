// lib/models/event_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String name;
  final String description;
  final DateTime datetime;
  final String location;
  final String imageUrl;

  Event({
    required this.name,
    required this.description,
    required this.datetime,
    required this.location,
    required this.imageUrl,
  });

  // Factory method para construir un modelo desde un mapa (Firestore)
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      datetime: (map['datetime'] as Timestamp).toDate(),
      location: map['location'] ?? '',
      imageUrl: map['imageUrl'] ??
          '', // Asegúrate de almacenar 'imageUrl' en Firestore
    );
  }

  String getImageUrl() {
    return imageUrl;
  }
}
