import 'package:flutter/material.dart';
import 'package:passi_app/models/screen_args/event_categories_screen_args.dart';
import 'package:passi_app/providers/eventCategories.dart';
import 'package:passi_app/providers/events_by_category.dart';
import 'package:passi_app/screens/event_categories_overview_screen.dart';
import 'package:passi_app/widgets/event_item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _listEventCategories(BuildContext context) async {
    await Provider.of<EventCateroriesProvider>(context, listen: false).fetchEventCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _listEventCategories(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            return LoadedEvents();
          default:
            return Container();
        }
      },
    );
  }
}

class LoadedEvents extends StatelessWidget {
  const LoadedEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EventCateroriesProvider>(
      builder: ((context, value, _) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: value.eventCategroies.length,
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
                        value.eventCategroies[index].name,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (() {
                        final args = EventCategoriesOverviewScreenArgs(
                          id: value.eventCategroies[index].id,
                        );
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
                    itemCount: value.eventCategroies[index].events?.length ?? 10,
                    itemBuilder: (BuildContext context, int index2) {
                      return EventItem(
                        imageUrl: value.eventCategroies[index].events?[index2].primaryImage ??
                            "https://res.cloudinary.com/eventboost/image/upload/v1594282851/website/wp/eventboost-twitter-card-home.jpg",
                        title: value.eventCategroies[index].events?[index2].title ?? "Hola",
                        id: value.eventCategroies[index].events?[index2].id ?? "$index2",
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
