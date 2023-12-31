import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turolconnect_tfg/pages/event_details_page.dart';

class EventSlider extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<String>> getImageUrls() async {
    QuerySnapshot snapshot = await firestore.collection('events').get();
    List<String> imageUrls = [];
    for (var doc in snapshot.docs) {
      String imageUrl = doc.get('imageUrl');
      imageUrls.add(imageUrl);
    }
    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: getImageUrls(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CarouselSlider.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EventDetailsPage(imageUrl: snapshot.data![itemIndex]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 300,
                      width: 200,
                      color: Colors.red.shade300,
                      child: Image.network(
                        snapshot.data![itemIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 300,
              autoPlay: false,
              viewportFraction: 0.3,
              enlargeCenterPage: false,
              pageSnapping: true,
            ),
          );
        }
      },
    );
  }
}
