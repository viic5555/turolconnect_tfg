import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turolconnect_tfg/provider/event_provider.dart';
import 'package:turolconnect_tfg/models/event_model.dart';

class ImageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtén el EventProvider desde el contexto
    var eventProvider = Provider.of<EventProvider>(context);

    return FutureBuilder<List<Event>>(
      future: eventProvider.getEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var event = snapshot.data![index];
              return event.imageUrl != ''
                  ? Image.network(event.imageUrl)
                  : Text('No hay imagen disponible');
            },
          );
        }
      },
    );
  }
}
