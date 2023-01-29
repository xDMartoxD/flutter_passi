import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          EventDetailsAppBar(id: id, imageUrl: imageUrl),
          SliverList(
            delegate: SliverChildListDelegate([
              Text(
                "Hoa como vas este es un texto muy mpero muy largo",
                style: Theme.of(context).textTheme.displaySmall,
                softWrap: true,
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
              Card(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: EventDetailsCategoriesInfo(thousendFormat: thousendFormat),
                ),
              ),
            ]),
          )
        ],
      ),
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
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              "Space Around",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              "\$ ${thousendFormat.format(30000)}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          )
        ],
      )
    ]);
  }
}

class EventDetailsAppBar extends StatelessWidget {
  const EventDetailsAppBar({
    Key? key,
    required this.id,
    required this.imageUrl,
  }) : super(key: key);

  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: PageView(
          children: [
            Hero(
              tag: id,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Hero(
              tag: id,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
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
