import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                        decoration: BoxDecoration(
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
                        child: Image.network(
                          "https://res.cloudinary.com/eventboost/image/upload/v1594282851/website/wp/eventboost-twitter-card-home.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Card(
                              child: Column(
                            children: [],
                          )),
                        ),
                      )
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
                        child: Image.network(
                          "https://res.cloudinary.com/eventboost/image/upload/v1594282851/website/wp/eventboost-twitter-card-home.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                          child: Container(
                        decoration: BoxDecoration(
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
            ),
          ],
        ),
      ],
    );
  }
}
