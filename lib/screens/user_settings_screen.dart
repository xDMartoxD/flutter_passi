import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:provider/provider.dart';

class UserSettingsScreen extends StatefulWidget {
  static const name = "user-settings";
  static const path = "user-settings";
  const UserSettingsScreen({super.key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  bool _isLoading = false;
  AuthenticationProvider? _authProvider;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      _authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
      if (context.mounted && _authProvider!.user == null) {
        context.pop();
      }
    });
  }

  Future<void> _deleteUser(BuildContext context) async {
    {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Eliminar Cuenta'),
            content: const Text('Estas seguro que deseas eliminar esta cuenta?'),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Eliminar'),
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  await _authProvider?.deleteUser();
                  setState(() {
                    _isLoading = false;
                  });
                  if (context.mounted) {
                    context.pop();
                    Navigator.of(context).pop();
                  }
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _signOut() async {
    setState(() {
      _isLoading = true;
    });
    await _authProvider?.signOutCurrentUser();
    setState(() {
      _isLoading = false;
    });
    if (context.mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajustes")),
      body: SingleChildScrollView(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Column(
                children: [
                  ListTile(
                    onTap: _signOut,
                    leading: const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    title: const Text("Salir de la cuenta"),
                  ),
                  ListTile(
                    onTap: () => _deleteUser(context),
                    leading: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                    ),
                    title: const Text("Eliminar cuenta"),
                  )
                ],
              ),
      ),
    );
  }
}
