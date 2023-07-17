import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/event_details_screen.dart';
import '../models/screen_args/event_detail_screen_args.dart';

class EventItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String id;
  const EventItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              final args = EventDetailScreenArgs(id: id);
              context.pushNamed(
                EventDetailsScreen.name,
                pathParameters: args.params(),
              );
            },
            child: Container(
              height: 150,
              width: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Hero(
                    tag: id, child: Image.network(imageUrl, fit: BoxFit.cover)),
              ),
            ),
          ),
          SizedBox(
            width: 130,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
