import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";

import '../models/screen_args/event_detail_screen_args.dart';
import '../screens/event_details_screen.dart';

class EventItemLarge extends StatelessWidget {
  final String id;
  final String imageUrl;
  const EventItemLarge({super.key, required this.id, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        EventDetailsScreen.name,
        params: EventDetailScreenArgs(
          id: id,
        ).params(),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Nombre del Evento",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              "Luar",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.left,
            ),
            Text(
              "Fecha",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.left,
            ),
            Text(
              "\$Costo COP",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
    ;
  }
}
