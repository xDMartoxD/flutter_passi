import 'package:flutter/material.dart';
import 'package:passi_app/providers/events_by_category.dart';

import 'package:passi_app/widgets/event_item_large.dart';
import 'package:passi_app/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../models/Event.dart';
import '../widgets/app_map_view.dart';

class EventCategoriesOverviewScreen extends StatefulWidget {
  static const path = "event-categories";
  static const name = "event-categories";
  final String id;
  final String categoryName;
  EventCategoriesOverviewScreen({super.key, required this.id, required this.categoryName});

  @override
  State<EventCategoriesOverviewScreen> createState() => _EventCategoriesOverviewScreenState();
}

class _EventCategoriesOverviewScreenState extends State<EventCategoriesOverviewScreen>
    with SingleTickerProviderStateMixin {
  late DraggableScrollableController _scrollableController;
  late double _appBarElevation;
  Animation<Color?>? _appBarAnimation;
  late final AnimationController _animationController;
  late bool _mapButtonVisible;
  ScrollController? _listViewController;
  @override
  void initState() {
    super.initState();

    _scrollableController = DraggableScrollableController();
    _scrollableController.addListener(_scrollableControllerListener);
    _appBarElevation = 5;
    _animationController =
        AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _mapButtonVisible = true;

    Future.delayed(Duration.zero).then((_) {
      _appBarAnimation =
          ColorTween(begin: Theme.of(context).appBarTheme.backgroundColor, end: Colors.transparent)
              .animate(_animationController)
            ..addListener(animationListener);
    });
  }

  void _scrollableControllerListener() {
    if (_scrollableController.size > 0.9) {
      _animationController.reverse();
      _listViewController?.animateTo(
        0,
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
      setState(() {
        _appBarElevation = 5;
        _mapButtonVisible = true;
      });
    } else if (_scrollableController.size < 0.2) {
      _animationController.forward();
      setState(() {
        _appBarElevation = 0;
        _mapButtonVisible = false;
      });
    }
  }

  void animationListener() {
    setState(() {
      // The state that has changed here is the animation object’s value.
    });
  }

  @override
  void dispose() {
    _scrollableController.removeListener(_scrollableControllerListener);
    _scrollableController.dispose();
    _animationController.dispose();
    _listViewController?.dispose();
    super.dispose();
  }

  Future<void> _fetchEventsByCategory(BuildContext context) async {
    await Provider.of<EventsByCategoryProvider>(context).fetchEventsByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.categoryName),
        elevation: _appBarElevation,
        backgroundColor: _appBarAnimation?.value,
      ),
      body: ChangeNotifierProvider<EventsByCategoryProvider>(
          create: (_) {
            return EventsByCategoryProvider(categoryId: widget.id);
          },
          child: FutureBuilder(
            future: _fetchEventsByCategory(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Consumer<EventsByCategoryProvider>(
                    builder: (context, value, child) {
                      return EventsByCategoryContent(
                        scrollableController: _scrollableController,
                        mapButtonVisible: _mapButtonVisible,
                        events: value.events,
                      );
                    },
                  );
                default:
                  return Loading();
              }
            },
          )),
    );
  }
}

class EventsByCategoryContent extends StatelessWidget {
  const EventsByCategoryContent({
    super.key,
    required DraggableScrollableController scrollableController,
    required bool mapButtonVisible,
    required this.events,
  })  : _scrollableController = scrollableController,
        _mapButtonVisible = mapButtonVisible;

  final DraggableScrollableController _scrollableController;
  final bool _mapButtonVisible;
  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // AppMapView(),
        Positioned.fill(
          top: 0,
          child: DraggableScrollableSheet(
            maxChildSize: 1,
            initialChildSize: 1,
            minChildSize: .1,
            snap: true,
            controller: _scrollableController,
            builder: ((context, scrollController) {
              return Stack(children: [
                Material(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  elevation: 5,
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 5,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: events.length,
                          itemBuilder: (BuildContext context, int index) {
                            return EventItemLarge(
                              id: events[index].id,
                              imageUrl: events[index].primaryImage,
                              address: events[index].address,
                              title: events[index].title,
                              place: events[index].place,
                              price: events[index].price,
                              date: events[index].startDateTime,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  bottom: 40,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedOpacity(
                      opacity: _mapButtonVisible ? 1 : 0,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 300),
                      child: FloatingActionButton.extended(
                        label: Text(
                          'Map',
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.white,
                        icon: Icon(
                          Icons.map_rounded,
                          size: 24.0,
                          color: Colors.black,
                        ),
                        onPressed: _mapButtonVisible
                            ? () {
                                _scrollableController.animateTo(
                                  .1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn,
                                );
                                scrollController.animateTo(
                                  0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn,
                                );
                              }
                            : null,
                      ),
                    ),
                  ),
                ),
              ]);
            }),
          ),
        ),
      ],
    );
  }
}
