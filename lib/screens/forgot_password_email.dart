import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/screen_args/reset_password_screen_args.dart';
import 'package:passi_app/screens/reset_password_screen.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import '../providers/authentication_provider.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  static const name = "forgot-password-email";
  static const path = "forgot-password-email";

  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {
    'email': '',
  };

  Future<void> _submit() async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      _formKey.currentState!.save();
      if (!_formKey.currentState!.validate()) {
        // Invalid!
        return;
      }
      final authProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      await authProvider.resetPassword(_authData['email']!);
      if (context.mounted) {
        final params =
            ResetPasswordScreenArgs(username: _authData['email']!).params();
        context.pushNamed(ResetPasswordScreen.name, pathParameters: params);
      }
    } on AuthException catch (e) {
      _showErrorDialog(e.message, context);
    } catch (err) {
      _showErrorDialog(err.toString(), context);
    }
  }

  void _showErrorDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: const Text("Ocurrio un error"),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cerrar"))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Olvide mi contraseña"),
      ),
      body: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 25),
                TextFormField(
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      labelText: 'Correo',
                      helperText:
                         "Enviaremos un correo electrónico con un código"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !isEmail(value)) {
                      return 'Correo inválido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value!;
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: _submit,
                    child: Text(
                      "Confirmar",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
