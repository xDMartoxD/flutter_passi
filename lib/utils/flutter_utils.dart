import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../screens/email_login_screen.dart';
import '../screens/email_register_screen.dart';

void bottomSheetAuthHandler({
  required BuildContext context,
}) {
  showModalBottomSheet<dynamic>(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 5,
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15),
          ),
          color: Theme.of(context).cardColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Wrap(
          children: [
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: Text(
                "PASSI",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: Text(
                "Tus eventos favoritos. \n Al instante.",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            // const SizedBox(height: 80),
            // Center(
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       alignment: Alignment.centerLeft,
            //       fixedSize: Size(MediaQuery.of(context).size.width * .9, 50),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5), // <-- Radius
            //       ),
            //     ),
            //     onPressed: () {
            //       context.pushNamed(EmailRegisterScreen.name);
            //     },
            //     child: Stack(
            //       children: <Widget>[
            //         Align(
            //             alignment: Alignment.centerLeft,
            //             child: const FaIcon(
            //               FontAwesomeIcons.google,
            //               color: Colors.white,
            //             )),
            //         Align(
            //             alignment: Alignment.center,
            //             child: Text(
            //               "Registrate con google",
            //               style: Theme.of(context).textTheme.titleSmall,
            //               textAlign: TextAlign.center,
            //             ))
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(height: 60),
            // Center(
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       alignment: Alignment.centerLeft,
            //       fixedSize: Size(MediaQuery.of(context).size.width * .9, 50),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5), // <-- Radius
            //       ),
            //     ),
            //     onPressed: () {
            //       context.pushNamed(EmailRegisterScreen.name);
            //     },
            //     child: Stack(
            //       children: <Widget>[
            //         Align(
            //             alignment: Alignment.centerLeft,
            //             child: const Icon(
            //               Icons.apple,
            //               color: Colors.white,
            //             )),
            //         Align(
            //             alignment: Alignment.center,
            //             child: Text(
            //               "Registrate con Apple",
            //               style: Theme.of(context).textTheme.titleSmall,
            //               textAlign: TextAlign.center,
            //             ))
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(height: 60),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  fixedSize: Size(MediaQuery.of(context).size.width * .9, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // <-- Radius
                  ),
                ),
                onPressed: () {
                  context.pushNamed(EmailRegisterScreen.name);
                },
                child: Stack(
                  children: <Widget>[
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: FaIcon(
                          FontAwesomeIcons.envelope,
                          color: Colors.white,
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Registrate con tu correo",
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  context.pushNamed(EmailLoginScreen.name);
                },
                child: const Text(
                  "Iniciar Sesion",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      );
    },
  );
}

Future<void> googleSignIn() async {}

String parseDate(TemporalDateTime date) {
  return DateFormat('dd-MM-yy').format(DateTime.parse(date.toString()));
}

String parseTime(TemporalDateTime date) {
  return DateFormat('HH:mm').format(DateTime.parse(date.toString()));
}

String formatNumber(double number) {
  final thousendFormat = NumberFormat.decimalPattern('en_us');
  return thousendFormat.format(number);
}

Color getColor(String color) {
  final r = int.parse(color.substring(0, 2), radix: 16);
  final g = int.parse(color.substring(2, 4), radix: 16);
  final b = int.parse(color.substring(4, 6), radix: 16);
  return Color.fromRGBO(r, g, b, 1);
}

errorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 4),
      backgroundColor: Colors.red,
    ),
  );
}
