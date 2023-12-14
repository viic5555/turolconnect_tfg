// lib/models/EventModel_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final int? id;
  final String name;
  final String description;
  final DateTime datetime;
  final String location;
  final String imageUrl;

  Event({
    this.id,
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

  @override
  List<Object?> get props => [name, description, datetime, location, imageUrl];

  static Event fromSnapshot(DocumentSnapshot snap) {
    Event event = Event(
      id: snap['id'],
      name: snap['name'],
      description: snap['description'],
      datetime: snap['2022-03-15T13:45:30Z'],
      location: snap['location'],
      imageUrl: snap['imageUrl'],
    );
    return event;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'datetime': datetime,
      'location': location,
      'imageUrl': imageUrl,
    };
  }
}
