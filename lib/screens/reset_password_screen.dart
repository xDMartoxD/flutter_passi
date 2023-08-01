import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/screen_args/success_screen_args.dart';
import 'package:passi_app/screens/success_screen.dart';
import 'package:provider/provider.dart';

import '../providers/authentication_provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const name = 'reset-password';
  static const path = 'reset-password/:username';

  final String username;
  const ResetPasswordScreen({super.key, required this.username});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {'code': '', 'password': ''};

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
      final authProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      await authProvider.confirmResetPassword(
        widget.username,
        _authData['password']!,
        _authData['code']!,
      );
      if (context.mounted) {
        final queryParams = SuccessScreenArgs(
                title: "Contraseña actulizada",
                message: "Vuelve a ingresar tus datos")
            .queryParams();
        context.pushNamed(SuccessScreen.name, queryParameters: queryParams);
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
      appBar: AppBar(title: const Text("Cambio de contraseña")),
      body: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 30),
                TextFormField(
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Codigo de confirmación',
                    helperText:
                        "Te hemos enviado un código de confirmación a tu correo electrónico",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Código Invalido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['code'] = value!;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  style: const TextStyle(fontSize: 20),
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Nueva Contraseña',
                    helperText: "Minimo 8 caracteres",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return "Contraseña inválida, asegúrate de que contenga por lo menos 8 caracteres.";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  style: const TextStyle(fontSize: 20),
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirma tu contraseña',
                  ),
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
                            "Confirmar",
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
