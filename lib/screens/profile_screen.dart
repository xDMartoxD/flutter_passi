import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/auth_provider.dart';
import 'package:passi_app/screens/email_register_screen.dart';
import 'package:passi_app/utils/amplify_utilds.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _getUser(BuildContext context) async {
    await Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getUser(context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(color: Colors.white));
            default:
              return Consumer<AuthProvider>(builder: (context, value, child) {
                return value.user != null
                    ? UnAuth()
                    : Auth(name: value.user!.name, avatar: value.user!.avatar);
              });
          }
        });
  }
}

class Auth extends StatefulWidget {
  final String name;
  final S3Object avatar;
  const Auth({super.key, required this.name, required this.avatar});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String avatarUrl = "";
  @override
  void initState() {
    super.initState();
    getUrl(widget.avatar.key).then((value) {
      setState(() {
        avatarUrl = value ?? "";
      });
    });
  }

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
            child: Image.network(avatarUrl),
          ),
          Text(
            widget.name,
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
  const UnAuth({
    super.key,
  });

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
                    "Registrate con Google",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.goNamed(EmailRegisterScreen.name);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.envelope,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Registrate con tu correo",
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
