import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:turolconnect_tfg/widgets/destacados_slider.dart';
import 'package:turolconnect_tfg/widgets/event_slider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Destacados', style: GoogleFonts.aBeeZee(fontSize: 25)),
          const SizedBox(
            height: 16,
          ),
          const DestacadosSlider(),
          const SizedBox(height: 32),
          Text('Buena acogida', style: GoogleFonts.aBeeZee(fontSize: 25)),
          const SizedBox(height: 32),
          EventSlider(),
          const SizedBox(height: 32),
          Text('Tus verbenas de confianza',
              style: GoogleFonts.aBeeZee(fontSize: 25)),
          const SizedBox(height: 32),
          EventSlider(),
        ]),
      ),
    );
  }
}
