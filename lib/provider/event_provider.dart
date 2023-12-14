import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turolconnect_tfg/models/event_model.dart';

class EventProvider extends ChangeNotifier {
  final CollectionReference _eventsCollection =
      FirebaseFirestore.instance.collection('events');

  // Obtener la lista de eventos desde Firestore
  Future<List<Event>> getEvents() async {
    QuerySnapshot querySnapshot = await _eventsCollection.get();
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      // Asegúrate de que 'imageUrl' exista en el documento
      if (data.containsKey('imageUrl')) {
        return Event.fromMap(data);
      } else {
        throw Exception('El documento no contiene un campo de imageUrl');
      }
    }).toList();
  }
}
