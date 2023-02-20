import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/Event.dart';
import 'package:passi_app/models/EventCategory.dart';

import 'package:qr_flutter/qr_flutter.dart';

class TicketsScreen extends StatefulWidget {
  final TabController tabController;
  const TicketsScreen({super.key, required this.tabController});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> with TickerProviderStateMixin {
  late final TabController _tabController1;
  late final TabController _tabController2;
  late final TabController _tabController3;
  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(length: 5, vsync: this);
    _tabController2 = TabController(length: 5, vsync: this);
    _tabController3 = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController1.dispose();
    _tabController2.dispose();
    _tabController3.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: [
        Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          "https://res.cloudinary.com/eventboost/image/upload/v1594282851/website/wp/eventboost-twitter-card-home.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                          child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ))
                    ],
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    _tabController1.index = value;
                  });
                },
              ),
            ),
            Positioned.fill(
              right: 10,
              child: Align(
                alignment: Alignment.centerRight,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: TabPageSelector(
                    controller: _tabController1,
                    color: Colors.grey,
                    selectedColor: Colors.white,
                    borderStyle: BorderStyle.none,
                    indicatorSize: 10,
                  ),
                ),
              ),
            )
          ],
        ),
        Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          child: Image.network(
                            "https://res.cloudinary.com/eventboost/image/upload/v1594282851/website/wp/eventboost-twitter-card-home.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Ticket(),
                        ),
                      )
                    ],
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    _tabController2.index = value;
                  });
                },
              ),
            ),
            Positioned.fill(
              right: 10,
              child: Align(
                alignment: Alignment.centerRight,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: TabPageSelector(
                    controller: _tabController2,
                    color: Colors.grey,
                    selectedColor: Colors.white,
                    borderStyle: BorderStyle.none,
                    indicatorSize: 10,
                  ),
                ),
              ),
            )
          ],
        ),
        Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          "https://res.cloudinary.com/eventboost/image/upload/v1594282851/website/wp/eventboost-twitter-card-home.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                          child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ))
                    ],
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    _tabController3.index = value;
                  });
                },
              ),
            ),
            Positioned.fill(
              right: 10,
              child: Align(
                alignment: Alignment.centerRight,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: TabPageSelector(
                    controller: _tabController3,
                    color: Colors.grey,
                    selectedColor: Colors.white,
                    borderStyle: BorderStyle.none,
                    indicatorSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Ticket extends StatelessWidget {
  const Ticket({
    super.key,
  });

  showQr(BuildContext context) {
    showModalBottomSheet<void>(
        elevation: 5,
        context: context,
        builder: (context) {
          return Center(
            child: QrImage(
              data: "1234567890",
              version: QrVersions.auto,
              size: MediaQuery.of(context).size.width * .8,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Iggy's-SAVAGE",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "7:00 PM",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400],
                        ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "+18",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  Text(
                    "2022-04-06",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Evento",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "Nombre del Evento",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Lugar y Direccion",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "Direccion del Evento",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    "Asistencia",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Checkbox(value: false, onChanged: (value) {})
                ],
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () => showQr(context),
                child: Center(
                    child: QrImage(
                  data: "1234567890",
                  version: QrVersions.auto,
                  size: 120.0,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
