import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:passi_app/models/screen_args/event_checkout_screen_args.dart';
import 'package:passi_app/screens/event_checkout_screen.dart';
import 'package:passi_app/widgets/expandable_text.dart';
import 'package:passi_app/widgets/app_map_view.dart';

class EventDetailsScreen extends StatelessWidget {
  static const route = "event-details";
  static const name = "event-details";

  final String id;
  final String imageUrl;
  final NumberFormat thousendFormat = NumberFormat.decimalPattern('en_us');
  EventDetailsScreen({super.key, required this.id, required this.imageUrl});

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
          onPressed: () {
            final args = EventCheckoutScreenArgs(id: id);
            context.goNamed(
              EventCheckoutScreen.name,
              params: args.params(),
            );
          },
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          EventDetailsAppBar(id: id, imageUrl: imageUrl),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Titulo del Evento",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
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
                    EventInfoIcon(),
                    EventInfoIcon(),
                    EventInfoIcon(),
                    EventInfoIcon(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: EventDetailsCategoriesInfo(thousendFormat: thousendFormat),
                  ),
                ),
              ),
              ProotersWidget(),
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
                child: ExpandableText(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              ),
              SizedBox(height: 80)
            ]),
          )
        ],
      ),
    );
  }
}

class ProotersWidget extends StatelessWidget {
  const ProotersWidget({
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
  const EventInfoIcon({
    Key? key,
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
            children: [Icon(Icons.lock_clock), Text("Reloj")],
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
  }) : super(key: key);

  final NumberFormat thousendFormat;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  "Space Around",
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
                  "\$ ${thousendFormat.format(30000)}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            ],
          ),
          TableRow(
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  "Space Around",
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
                  "\$ ${thousendFormat.format(30000)}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            ],
          ),
          TableRow(
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  "Space Around",
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
                  "\$ ${thousendFormat.format(30000)}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class EventDetailsAppBar extends StatefulWidget {
  const EventDetailsAppBar({
    Key? key,
    required this.id,
    required this.imageUrl,
  }) : super(key: key);

  final String id;
  final String imageUrl;

  @override
  State<EventDetailsAppBar> createState() => _EventDetailsAppBarState();
}

class _EventDetailsAppBarState extends State<EventDetailsAppBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
              itemCount: 2,
              itemBuilder: (context, index) {
                return index == 0
                    ? Hero(
                        tag: widget.id,
                        child: InteractiveViewer(
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : InteractiveViewer(
                        child: Image.network(
                          widget.imageUrl,
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
