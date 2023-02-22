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
    await Provider.of<EventCategoriesProvider>(context, listen: false).fetchEventCategories();
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

          default:
            return LoadedEvents();
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
    return Consumer<EventCategoriesProvider>(
      builder: ((context, value, _) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: value.eventCategroies.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventCategoryTitle(value, index),
                ChangeNotifierProvider<EventsByCategory>(
                  create: (context) {
                    return EventsByCategory(categoryId: value.eventCategroies[index].id);
                  },
                  child: EventsByCategoryList(),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}

class EventsByCategoryList extends StatelessWidget {
  const EventsByCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> _fetchEventsByCategory(BuildContext context) async {
      Provider.of<EventsByCategory>(context, listen: false).fetchEventsByCategory();
    }

    return SizedBox(
      height: 200,
      child: FutureBuilder(
        future: _fetchEventsByCategory(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(color: Colors.white));
            default:
              return Consumer<EventsByCategory>(
                builder: (context, value, _) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.events.length,
                    itemBuilder: (BuildContext context, int index) {
                      return EventItem(
                        imageUrl: value.events[index].primaryImage,
                        title: value.events[index].title,
                        id: value.events[index].id,
                      );
                    },
                  );
                },
              );
          }
        },
      ),
    );
  }
}

class EventCategoryTitle extends StatelessWidget {
  final EventCategoriesProvider value;
  final int index;
  const EventCategoryTitle(
    this.value,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              foregroundColor: Colors.white, textStyle: TextStyle(fontWeight: FontWeight.bold)),
          child: Text("Ver Mas"),
        )
      ],
    );
  }
}
