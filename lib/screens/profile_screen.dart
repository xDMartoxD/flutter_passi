import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return false ? Auth() : UnAuth();
  }
}

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            minRadius: 50,
          ),
          Text(
            "Alfonso Perez",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          )
        ],
      ),
    );
  }
}

class UnAuth extends StatelessWidget {
  const UnAuth({super.key});

  Future<void> googleSignIn() async {}

  void bottomSheetHandler(BuildContext context) {
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
              SizedBox(
                height: 80,
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: googleSignIn,
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Ingresa con Google",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.envelope,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Ingresa con tu correo",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Iniciar Sesion",
                        style: TextStyle(color: Colors.white),
                      ))),
              SizedBox(
                height: 80,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outlined,
            color: Colors.grey,
            size: 120,
          ),
          SizedBox(
              width: 240,
              child: FloatingActionButton(
                  shape: StadiumBorder(),
                  onPressed: () => bottomSheetHandler(context),
                  child: Text(
                    "Ingresa",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ))),
        ],
      ),
    );
  }
}
