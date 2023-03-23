import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/utils/amplify_utils.dart';
import 'package:passi_app/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../widgets/unauth.dart';

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
                  return const Loading();
                default:
                  return const UnAuth();
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
      padding: const EdgeInsets.all(10),
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
                fit: BoxFit.contain,
                child: ClipOval(child: Image.asset('assets/images/empty-profile.png')),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
