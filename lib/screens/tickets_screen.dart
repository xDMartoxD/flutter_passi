// import 'package:amplify_api/model_queries.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:passi_app/models/Event.dart';
// import 'package:passi_app/models/EventCategory.dart';
// import 'package:passi_app/providers/authentication_provider.dart';
// import 'package:passi_app/providers/event_provider.dart';
// import 'package:passi_app/providers/tickets_provider.dart';
// import 'package:passi_app/widgets/loading.dart';
// import 'package:provider/provider.dart';

// import 'package:qr_flutter/qr_flutter.dart';

// class TicketsScreen extends StatelessWidget {
//   final TabController tabController;
//   const TicketsScreen({super.key, required this.tabController});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider<EventProvider>(
//             create: (context) {
//               return EventProvider();
//             },
//           ),
//           ChangeNotifierProxyProvider<AuthenticationProvider, TicketsProvider>(create: (context) {
//             return TicketsProvider();
//           }, update: (context, authenticationProvider, prev) {
//             return TicketsProvider(authenticationProvider: authenticationProvider);
//           })
//         ],
//         child: TicketsContent(
//           tabController: tabController,
//         ));
//   }
// }

// class TicketsContent extends StatefulWidget {
//   final TabController tabController;
//   const TicketsContent({super.key, required this.tabController});

//   @override
//   State<TicketsContent> createState() => _TicketsContentState();
// }

// class _TicketsContentState extends State<TicketsContent> with TickerProviderStateMixin {
//   late final TabController _tabPageSelectorController1;
//   late final TabController _tabPageSelectorController2;
//   late final TabController _tabPageSelectorController3;
//   late final PageController _pageController1;
//   late final PageController _pageController2;
//   late final PageController _pageController3;
//   @override
//   void initState() {
//     super.initState();
//     _tabPageSelectorController1 = TabController(length: 5, vsync: this);
//     _tabPageSelectorController2 = TabController(length: 5, vsync: this);
//     _tabPageSelectorController3 = TabController(length: 5, vsync: this);
//     _pageController1 = PageController(keepPage: true);
//     _pageController2 = PageController(keepPage: true);
//     _pageController3 = PageController(keepPage: true);
//     widget.tabController.addListener(_tabChangeListener);
//   }

//   void _tabChangeListener() {
//     switch (widget.tabController.index) {
//       case 0:
//         _pageController1.animateToPage(_tabPageSelectorController1.index,
//             duration: Duration(microseconds: 1), curve: Curves.fastOutSlowIn);
//         break;
//       case 1:
//         _pageController2.animateToPage(_tabPageSelectorController2.index,
//             duration: Duration(microseconds: 1), curve: Curves.fastOutSlowIn);
//         break;
//       case 2:
//         _pageController3.animateToPage(_tabPageSelectorController3.index,
//             duration: Duration(microseconds: 1), curve: Curves.fastOutSlowIn);
//         break;
//       default:
//     }
//   }

//   @override
//   void dispose() {
//     _tabPageSelectorController1.dispose();
//     _tabPageSelectorController2.dispose();
//     _tabPageSelectorController3.dispose();
//     _pageController1.dispose();
//     _pageController2.dispose();
//     _pageController3.dispose();
//     widget.tabController.removeListener(_tabChangeListener);
//     super.dispose();
//   }

//   Future<void> getTickets() async {
//     await Provider.of<TicketsProvider>(context, listen: false).getTickets();
//   }

//   Future<void> _setEvent(String id) async {
//     await Provider.of<EventProvider>(context, listen: false).setEventById(id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getTickets(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.done:
//             return Consumer<TicketsProvider>(
//               builder: (context, ticketsProvider, child) {
//                 return TabBarView(
//                   controller: widget.tabController,
//                   children: [
//                     Stack(
//                       children: [
//                         Positioned.fill(
//                           child: PageView.builder(
//                             controller: _pageController1,
//                             scrollDirection: Axis.vertical,
//                             itemCount: ticketsProvider.tickets.length,
//                             itemBuilder: (context, index) {
//                               return Stack(
//                                 children: [
//                                   Positioned.fill(
//                                       child: FutureBuilder(
//                                     future: _setEvent(ticketsProvider.tickets[index].event.id),
//                                     builder: (BuildContext context, AsyncSnapshot snapshot) {
//                                       return Consumer<EventProvider>(
//                                         builder: (context, eventProvider, child) {
//                                           return eventProvider.event != null
//                                               ? Image.network(
//                                                   eventProvider.event!.primaryImage,
//                                                   fit: BoxFit.cover,
//                                                 )
//                                               : Container();
//                                         },
//                                       );
//                                     },
//                                   )),
//                                   Positioned.fill(
//                                       child: Container(
//                                     decoration: const BoxDecoration(
//                                       gradient: LinearGradient(
//                                         colors: [Colors.transparent, Colors.black],
//                                         begin: Alignment.topCenter,
//                                         end: Alignment.bottomCenter,
//                                       ),
//                                     ),
//                                   ))
//                                 ],
//                               );
//                             },
//                             onPageChanged: (value) {
//                               setState(() {
//                                 _tabPageSelectorController1.index = value;
//                               });
//                             },
//                           ),
//                         ),
//                         Positioned.fill(
//                           right: 10,
//                           child: Align(
//                             alignment: Alignment.centerRight,
//                             child: RotatedBox(
//                               quarterTurns: 1,
//                               child: TabPageSelector(
//                                 controller: _tabPageSelectorController1,
//                                 color: Colors.grey,
//                                 selectedColor: Colors.white,
//                                 borderStyle: BorderStyle.none,
//                                 indicatorSize: 10,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     Stack(
//                       children: [
//                         Positioned.fill(
//                           child: PageView.builder(
//                             controller: _pageController2,
//                             scrollDirection: Axis.vertical,
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return Stack(
//                                 children: [
//                                   Positioned.fill(
//                                     child: Container(
//                                       child: Image.network(
//                                         "https://res.cloudinary.com/eventboost/image/upload/v1594282851/website/wp/eventboost-twitter-card-home.jpg",
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned.fill(
//                                     child: Container(
//                                       padding:
//                                           const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
//                                       decoration: const BoxDecoration(
//                                         gradient: LinearGradient(
//                                           colors: [Colors.transparent, Colors.black],
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter,
//                                         ),
//                                       ),
//                                       child: Ticket(),
//                                     ),
//                                   )
//                                 ],
//                               );
//                             },
//                             onPageChanged: (value) {
//                               setState(() {
//                                 _tabPageSelectorController2.index = value;
//                               });
//                             },
//                           ),
//                         ),
//                         Positioned.fill(
//                           right: 10,
//                           child: Align(
//                             alignment: Alignment.centerRight,
//                             child: RotatedBox(
//                               quarterTurns: 1,
//                               child: TabPageSelector(
//                                 controller: _tabPageSelectorController2,
//                                 color: Colors.grey,
//                                 selectedColor: Colors.white,
//                                 borderStyle: BorderStyle.none,
//                                 indicatorSize: 10,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     Stack(
//                       children: [
//                         Positioned.fill(
//                           child: PageView.builder(
//                             controller: _pageController3,
//                             scrollDirection: Axis.vertical,
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return Stack(
//                                 children: [
//                                   Positioned.fill(
//                                     child: Image.network(
//                                       "https://res.cloudinary.com/eventboost/image/upload/v1594282851/website/wp/eventboost-twitter-card-home.jpg",
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   Positioned.fill(
//                                       child: Container(
//                                     decoration: const BoxDecoration(
//                                       gradient: LinearGradient(
//                                         colors: [Colors.transparent, Colors.black],
//                                         begin: Alignment.topCenter,
//                                         end: Alignment.bottomCenter,
//                                       ),
//                                     ),
//                                   ))
//                                 ],
//                               );
//                             },
//                             onPageChanged: (value) {
//                               setState(() {
//                                 _tabPageSelectorController3.index = value;
//                               });
//                             },
//                           ),
//                         ),
//                         Positioned.fill(
//                           right: 10,
//                           child: Align(
//                             alignment: Alignment.centerRight,
//                             child: RotatedBox(
//                               quarterTurns: 1,
//                               child: TabPageSelector(
//                                 controller: _tabPageSelectorController3,
//                                 color: Colors.grey,
//                                 selectedColor: Colors.white,
//                                 borderStyle: BorderStyle.none,
//                                 indicatorSize: 10,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               },
//             );
//           default:
//             return Loading();
//         }
//       },
//     );
//   }
// }

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:passi_app/providers/ticket_category_provider.dart';
import 'package:passi_app/screens/profile_screen.dart';
import '../providers/authentication_provider.dart';
import '../providers/event_provider.dart';
import '../providers/tickets_provider.dart';
import '../widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});
  Future<void> fetchTickets() async {}
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) {
            return EventProvider(eventId: '');
          }),
          ChangeNotifierProvider(create: (context) {
            return TicketCategoryProvider();
          }),
          ChangeNotifierProxyProvider3<AuthenticationProvider, EventProvider,
              TicketCategoryProvider, TicketsProvider>(
            create: (context) {
              return TicketsProvider();
            },
            update: (
              context,
              authenticationProvider,
              eventProvider,
              ticketCategory,
              prev,
            ) {
              return TicketsProvider(
                  authenticationProvider: authenticationProvider,
                  eventProvider: eventProvider,
                  ticketCategoryProvider: ticketCategory);
            },
          )
        ],
        child: FutureBuilder(
          future: fetchTickets(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return const TicketsContent();
          },
        ));
  }
}

class TicketsContent extends StatelessWidget {
  const TicketsContent({
    super.key,
  });

  Future<void> getTickets(BuildContext context) async {
    try {
      await Provider.of<TicketsProvider>(context, listen: false).getTickets();
    } catch (e) {
      safePrint(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (conext, authenticationProvider, child) {
        if (authenticationProvider.user == null) {
          return const UnAuth();
        } else {
          return FutureBuilder(
            future: getTickets(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Consumer<TicketsProvider>(
                    builder: (context, ticketProvider, child) {
                      return PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: ticketProvider.tickets.length,
                        itemBuilder: (context, index) {
                          return Stack(children: [
                            ticketProvider.tickets[index] != null &&
                                    ticketProvider.tickets[index]?.event != null
                                ? Positioned.fill(
                                    child: Image.network(
                                      ticketProvider.tickets[index]!.event!.primaryImage,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(),
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.transparent, Colors.black],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 40,
                                  horizontal: 50,
                                ),
                                child: ticketProvider.tickets[index] != null &&
                                        ticketProvider.tickets[index]?.event != null
                                    ? TicketWidget(
                                        didAssit: ticketProvider.tickets[index]!.didAssist,
                                        eventMaxAge: ticketProvider.tickets[index]!.event!.minAge,
                                        eventAddress: ticketProvider.tickets[index]!.event!.address,
                                        eventCompany: ticketProvider.tickets[index]!.event!.company,
                                        eventPlace: ticketProvider.tickets[index]!.event!.place,
                                        eventStartDate: ticketProvider
                                            .tickets[index]!.event!.startDateTime
                                            .toString(),
                                        id: ticketProvider.tickets[index]!.id,
                                        eventTitle: ticketProvider.tickets[index]!.event!.title,
                                        ticketCategoryName:
                                            ticketProvider.tickets[index]!.ticketCategory!.name,
                                      )
                                    : Container(),
                              ),
                            ),
                          ]);
                        },
                      );
                    },
                  );

                default:
                  return const Loading();
              }
            },
          );
        }
      },
    );
  }
}

class TicketWidget extends StatelessWidget {
  final String id;
  final String eventCompany;
  final String eventStartDate;
  final int? eventMaxAge;
  final String eventTitle;
  final bool didAssit;
  final String? eventPlace;
  final String eventAddress;
  final String ticketCategoryName;
  const TicketWidget({
    super.key,
    required this.id,
    required this.eventCompany,
    required this.eventStartDate,
    this.eventMaxAge,
    required this.eventTitle,
    required this.didAssit,
    this.eventPlace,
    required this.eventAddress,
    required this.ticketCategoryName,
  });

  showQr(BuildContext context) {
    showModalBottomSheet<void>(
        elevation: 5,
        context: context,
        builder: (context) {
          return Center(
            child: QrImage(
              data: id,
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
        color: Theme.of(context).cardColor,
        surfaceTintColor: Theme.of(context).cardColor,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      eventCompany,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    DateFormat('hh:mm').format(DateTime.parse(eventStartDate)),
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
                  eventMaxAge != null
                      ? Text(
                          "+$eventMaxAge",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                              ),
                        )
                      : Container(),
                  Text(
                    DateFormat('yyyy-MM-dd').format(DateTime.parse(eventStartDate)),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
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
                eventTitle,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
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
                "$eventAddress - $eventPlace",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
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
                  Checkbox(value: didAssit, onChanged: (value) {})
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () => showQr(context),
                child: Center(
                    child: QrImage(
                  data: id,
                  version: QrVersions.auto,
                  size: 120.0,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                )),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    ticketCategoryName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
