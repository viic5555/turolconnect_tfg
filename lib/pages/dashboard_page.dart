import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:turolconnect_tfg/widgets/destacados_slider.dart';
import 'package:turolconnect_tfg/widgets/event_slider.dart';
import 'package:turolconnect_tfg/provider/event_provider.dart';
import 'package:turolconnect_tfg/provider/auth_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            'assets/title2.png',
            fit: BoxFit.cover,
            height: 90,
            filterQuality: FilterQuality.high,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // Llama al método de cierre de sesión del AuthProvider
                Provider.of<MyAuthProvider>(context, listen: false).logout();
                // Navega de regreso a la página de inicio de sesión
                // Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child:
                  Text('Destacados', style: GoogleFonts.aBeeZee(fontSize: 25)),
            ),
            const SizedBox(
              height: 16,
            ),
            const DestacadosSlider(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('Buena acogida',
                  style: GoogleFonts.aBeeZee(fontSize: 25)),
            ),
            const SizedBox(height: 32),
            // Altura del contenedor
            EventSlider(),

            const SizedBox(height: 32),
            /*Text('Tus verbenas de confianza',
                style: GoogleFonts.aBeeZee(fontSize: 25)),
            const SizedBox(height: 32),
            EventSlider(),*/
          ]),
        ),
      ),
    );
  }
}
