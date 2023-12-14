import 'package:flutter/material.dart';
import 'package:turolconnect_tfg/models/event_model.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;

  const EventDetailPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Evento'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Parte superior: Imagen del cartel
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(event.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Parte inferior: Detalles del evento y botón para añadir al calendario
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Descripción: ${event.description}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Fecha y Hora: ${event.datetime}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Ubicación: ${event.location}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para añadir al calendario
                      // Puedes utilizar paquetes como `table_calendar` para esta funcionalidad
                    },
                    child: Text('Añadir al Calendario'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
