import 'package:amplify_auth_cognito/amplify_auth_cognito.dart'
    show AuthException;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/screen_args/email_confirmation_screen_args.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart' show isEmail;

import '../providers/authentication_provider.dart';
import 'email_confirmation_screen.dart';

class EmailRegisterScreen extends StatefulWidget {
  static const name = "email-register";
  static const path = "email-register";

  const EmailRegisterScreen({
    super.key,
  });

  @override
  State<EmailRegisterScreen> createState() => _EmailRegisterScreenState();
}

class _EmailRegisterScreenState extends State<EmailRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  final Map<String, String> _authData = {
    'name': '',
    'email': '',
    'password': '',
  };
  Future<void> _submit() async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      _formKey.currentState!.save();
      if (!_formKey.currentState!.validate()) {
        // Invalid!
        return;
      }

      setState(() {
        _isLoading = true;
      });
      await Provider.of<AuthenticationProvider>(context, listen: false)
          .signUpUser(
        _authData["name"]!,
        _authData["email"]!,
        _authData["password"]!,
      );
      final emailConfirmationArgs = EmailConfirmationScreenArgs(
        email: _authData["email"]!,
        password: _authData["password"]!,
      );
      if (context.mounted) {
        context.pushNamed(
          EmailConfirmationScreen.name,
          queryParameters: emailConfirmationArgs.queryParams(),
        );
      }
    } on AuthException catch (e) {
      _showErrorDialog(e.message, context);
    } catch (err) {
      _showErrorDialog(err.toString(), context);
    } finally {
      setState(() {
        _isLoading = false;
      });
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
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(fontSize: 20),
                  decoration:
                      const InputDecoration(labelText: 'Nombre completo'),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nombre Inválido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['name'] = value!;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(labelText: 'Email'),
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
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Contraseña inválida, asegurate de que contenga por lo menos 8 caracteres';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      labelText: 'Confirma tu contraseña'),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value != _authData['password']) {
                      return 'la contraseña no coinside';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: _isLoading ? null : _submit,
                    child: _isLoading
                        ? const Center(
                            child:
                                CircularProgressIndicator(color: Colors.black),
                          )
                        : Text(
                            "Ingresar",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
