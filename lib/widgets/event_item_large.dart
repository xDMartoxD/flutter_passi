import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";
import 'package:intl/intl.dart';
import 'package:passi_app/utils/flutter_utils.dart';

import '../models/screen_args/event_detail_screen_args.dart';
import '../screens/event_details_screen.dart';

class EventItemLarge extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String? place;
  final String address;
  final double price;
  final TemporalDateTime date;
  const EventItemLarge({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    this.place,
    required this.address,
    required this.price,
    required this.date,
  });

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
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              "$address - $place",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.left,
            ),
            Text(
              "${parseDate(date)}",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.left,
            ),
            Text(
              "\$${formatNumber(price)} COP",
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
