import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/utils/amplify_utils.dart';
import 'package:passi_app/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../utils/flutter_utils.dart';

class ProfileScreen extends StatelessWidget {
  static const name = 'profile';
  static const route = 'profile';
  const ProfileScreen({super.key});

  Future<void> _getUser(BuildContext context) async {
    await Provider.of<AuthenticationProvider>(context, listen: false).setUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getUser(context),
        builder: (context, snapshot) {
          return Consumer<AuthenticationProvider>(builder: (context, value, child) {
            if (value.user == null) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Loading();
                default:
                  return UnAuth();
              }
            } else {
              return Auth(name: value.user!.name, avatar: value.user!.avatar);
            }
          });
        });
  }
}

class Auth extends StatefulWidget {
  final String name;
  final S3Object? avatar;
  const Auth({super.key, required this.name, required this.avatar});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String avatarUrl = "";
  @override
  void initState() {
    super.initState();
    getUrl(widget.avatar?.key ?? "").then((value) {
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
            radius: 50,
            // backgroundImage: AssetImage('assets/images/empty-profile.png'),
            child: SizedBox(
              height: 100,
              width: 100,
              child: FittedBox(
                child: ClipOval(child: Image.asset('assets/images/empty-profile.png')),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10),
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
                  onPressed: () => bottomSheetAuthHandler(
                        context: context,
                      ),
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
