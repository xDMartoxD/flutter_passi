import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
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
        return Wrap(
          children: [
            SizedBox(height: 200, child: Placeholder()),
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
            const SizedBox(
              height: 80,
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: googleSignIn,
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                label: Text(
                  "Registrate con Google",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  context.pushNamed(EmailRegisterScreen.name);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.envelope,
                  color: Colors.white,
                ),
                label: Text(
                  "Registrate con tu correo",
                  style: Theme.of(context).textTheme.titleSmall,
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
        );
      });
}

Future<void> googleSignIn() async {}
