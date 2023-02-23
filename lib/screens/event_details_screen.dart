import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/event_provider.dart';
import 'package:passi_app/providers/ticket_provider_by_event.dart';
import 'package:passi_app/widgets/expandable_text.dart';
import 'package:passi_app/widgets/app_map_view.dart';
import 'package:passi_app/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:string_to_hex/string_to_hex.dart';

class EventDetailsScreen extends StatelessWidget {
  static const route = "event-details/:id";
  static const name = "event-details";

  final String id;
  final String? promoterCode;

  void goToCheckout() {}
  void goToLogin() {}

  void pressedHandler(BuildContext context) {
    final user = Provider.of<AuthenticationProvider>(context).user;
    if (user != null) {
      goToCheckout();
    } else {
      goToLogin();
    }
  }

  final NumberFormat thousendFormat = NumberFormat.decimalPattern('en_us');
  EventDetailsScreen({super.key, required this.id, this.promoterCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 55,
        width: MediaQuery.of(context).size.width * .8,
        child: FloatingActionButton(
          child: Text(
            "Asistir",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          onPressed: () => pressedHandler(context),
        ),
      ),
      body: ChangeNotifierProvider<EventProvider>(
        create: (context) {
          return EventProvider();
        },
        child: EventContent(
          id: id,
        ),
      ),
    );
  }
}

class EventContent extends StatefulWidget {
  final String id;

  EventContent({
    super.key,
    required this.id,
  });

  @override
  State<EventContent> createState() => _EventContentState();
}

class _EventContentState extends State<EventContent> {
  late final NumberFormat thousendFormat;

  Future<void>? _setEvent;
  @override
  void initState() {
    super.initState();
    thousendFormat = NumberFormat.decimalPattern('en_us');

    Future.delayed(Duration.zero).then((_) {
      _setEvent = Provider.of<EventProvider>(context, listen: false).setEventById(widget.id);
    });
  }

  String parseDate(TemporalDateTime date) {
    return DateFormat('dd-MM-yy').format(DateTime.parse(date.toString()));
  }

  String parseTime(TemporalDateTime date) {
    return DateFormat('HH:mm').format(DateTime.parse(date.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _setEvent,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Loading();
          default:
            return Consumer<EventProvider>(builder: (context, value, child) {
              return value.event == null
                  ? Loading()
                  : CustomScrollView(
                      slivers: <Widget>[
                        EventDetailsAppBar(
                          id: widget.id,
                          images: [value.event!.primaryImage, ...(value.event!.images ?? [])],
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                value.event!.title,
                                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                softWrap: true,
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                              height: 8,
                            ),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(border: Border.symmetric()),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  EventInfoIcon(
                                    icon: Icons.watch_later_outlined,
                                    textContent:
                                        "${parseTime(value.event!.startDateTime)} - ${parseTime(value.event!.finishDateTime)}",
                                  ),
                                  EventInfoIcon(
                                    icon: Icons.map,
                                    textContent: "${value.event!.address}",
                                  ),
                                  EventInfoIcon(
                                    icon: Icons.calendar_today,
                                    textContent: "${parseDate(value.event!.startDateTime)}",
                                  ),
                                  EventInfoIcon(
                                    icon: Icons.corporate_fare_rounded,
                                    textContent: "${value.event!.company}",
                                  ),
                                  EventInfoIcon(
                                    icon: Icons.star_border_rounded,
                                    textContent: value.event!.eventCategory.name,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: ChangeNotifierProvider<TicketCategoriesByEventProvider>(
                                    create: (context) {
                                      return TicketCategoriesByEventProvider();
                                    },
                                    child: EventDetailsCategoriesInfo(
                                      thousendFormat: thousendFormat,
                                      eventId: value.event!.id,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            PromotersWidget(),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AspectRatio(
                                aspectRatio: 3 / 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: AppMapView(),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ExpandableText(value.event!.description),
                            ),
                            SizedBox(height: 80)
                          ]),
                        )
                      ],
                    );
            });
        }
      },
    );
  }
}

class PromotersWidget extends StatelessWidget {
  const PromotersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(backgroundColor: Theme.of(context).cardColor),
          title: Text(
            "Pimer Promotor",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        Divider(
          endIndent: 8,
          indent: 8,
          color: Colors.grey,
        ),
        ListTile(
          leading: CircleAvatar(backgroundColor: Theme.of(context).cardColor),
          title: Text(
            "Pimer Promotor",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        Divider(
          endIndent: 8,
          indent: 8,
          color: Colors.grey,
        ),
        ListTile(
          leading: CircleAvatar(backgroundColor: Theme.of(context).cardColor),
          title: Text(
            "Pimer Promotor",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        Divider(
          endIndent: 8,
          indent: 8,
          color: Colors.grey,
        )
      ],
    );
  }
}

class EventInfoIcon extends StatelessWidget {
  IconData icon;
  String textContent;
  EventInfoIcon({
    Key? key,
    required this.icon,
    required this.textContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(icon), Text(textContent)],
          ),
        ),
        VerticalDivider(
          color: Colors.grey,
          indent: 5,
          endIndent: 5,
        )
      ],
    );
  }
}

class EventDetailsCategoriesInfo extends StatelessWidget {
  const EventDetailsCategoriesInfo({
    Key? key,
    required this.thousendFormat,
    required this.eventId,
  }) : super(key: key);

  final NumberFormat thousendFormat;
  final String eventId;

  Future<void> _listTicketCateogires(BuildContext context) async {
    await Provider.of<TicketCategoriesByEventProvider>(context)
        .fetchTicketCategoriesByEventId(eventId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _listTicketCateogires(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Consumer<TicketCategoriesByEventProvider>(
              builder: (context, value, child) {
                print(value.ticketCategories[0].color);
                return Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: value.ticketCategories.map(
                    (ticketCategory) {
                      return TableRow(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: Text(
                              ticketCategory.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            child: Text(
                              "\$ ${thousendFormat.format(ticketCategory.price)}",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: 5,
                            decoration: BoxDecoration(
                              color: Color(StringToHex.toColor(ticketCategory.color)),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          )
                        ],
                      );
                    },
                  ).toList(),
                );
              },
            );
          default:
            return Loading();
        }
      },
    );
  }
}

class EventDetailsAppBar extends StatefulWidget {
  const EventDetailsAppBar({
    Key? key,
    required this.id,
    required this.images,
  }) : super(key: key);

  final String id;
  final List<String> images;

  @override
  State<EventDetailsAppBar> createState() => _EventDetailsAppBarState();
}

class _EventDetailsAppBarState extends State<EventDetailsAppBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.images.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          Positioned.fill(
            child: PageView.builder(
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? Hero(
                        tag: widget.id,
                        child: InteractiveViewer(
                          child: Image.network(
                            widget.images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : InteractiveViewer(
                        child: Image.network(
                          widget.images[index],
                          fit: BoxFit.cover,
                        ),
                      );
              },
              onPageChanged: (value) {
                setState(() {
                  _tabController.index = value;
                });
              },
            ),
          ),
          Positioned.fill(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TabPageSelector(
                controller: _tabController,
                color: Colors.grey,
                selectedColor: Colors.white,
                borderStyle: BorderStyle.none,
                indicatorSize: 10,
              ),
            ),
          )
        ]),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.ios_share),
        )
      ],
    );
  }
}
