import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DestacadosSlider extends StatefulWidget {
  const DestacadosSlider({Key? key}) : super(key: key);

  @override
  _DestacadosSliderState createState() => _DestacadosSliderState();
}

class _DestacadosSliderState extends State<DestacadosSlider> {
  late List<String> imageUrls; // Lista para almacenar las URLs de las imágenes
  final storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    // Inicializa la lista de URLs de imágenes
    imageUrls = [];
    // Obtiene las URLs de las imágenes
    getImagesUrls();
  }

  Future<void> getImagesUrls() async {
    for (int i = 0; i <= 30; i++) {
      int imageIndex = i; // Guarda el valor de 'i' en otra variable
      try {
        final ref = storage.ref().child('carteles/cartel$i.webp');
        final url = await ref.getDownloadURL();
        setState(() {
          imageUrls.add(url);
        });
      } catch (e) {
        // Muestra un Snackbar en lugar de imprimir en la consola
        /*
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al obtener la URL de la imagen $imageIndex'),
          ),
        );
        */

        // Muestra un Snackbar en lugar de imprimir en la consola
        print('Error al obtener la URL de la imagen $imageIndex: $e');
        print(
            'Path de la imagen: ${storage.ref().child('carteles/cartel$i.webp').fullPath}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 300,
              width: 200,
              color: Colors.red.shade300,
              child: Image.network(
                imageUrls[itemIndex],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
