import 'package:flutter/material.dart';
import 'package:passi_app/data/data.dart';
import 'package:passi_app/models/screen_args/event_categories_screen_args.dart';
import 'package:passi_app/screens/event_categories_overview_screen.dart';
import 'package:passi_app/widgets/event_item.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      itemCount: event_categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: Text(
                    event_categories[index].name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (() {
                    final args = EventCategoriesOverviewScreenArgs(id: event_categories[index].id);
                    context.goNamed(EventCategoriesOverviewScreen.name, params: args.params());
                  }),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                  child: Text("Ver Mas"),
                )
              ],
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: event_categories[index].events.length,
                itemBuilder: (BuildContext context, int index2) {
                  return EventItem(
                    imageUrl: event_categories[index].events[index2].imageUrl,
                    title: event_categories[index].events[index2].title,
                    id: event_categories[index].events[index2].id.toString(),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
