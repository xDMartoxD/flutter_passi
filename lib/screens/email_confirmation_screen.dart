import 'package:amplify_auth_cognito/amplify_auth_cognito.dart' show AuthException;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/authentication_provider.dart';

class EmailConfirmationScreen extends StatefulWidget {
  static const name = "email-confirmation";
  static const path = "email-confirmation";
  final String email;
  final String password;
  const EmailConfirmationScreen({
    required this.password,
    required this.email,
    super.key,
  });

  @override
  State<EmailConfirmationScreen> createState() => _EmailConfirmationScreenState();
}

class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  final Map<String, String> _authData = {
    'code': '',
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
      final authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
      await authProvider.confirmUser(widget.email, _authData["code"]!);
      await authProvider.signInUser(widget.email, widget.password);
      if (context.mounted) {
        context.pop();
        context.pop();
        Navigator.of(context).pop();
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
            title: const Text("Ocurrió un error"),
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
                  decoration: const InputDecoration(
                    labelText: 'Codigo de confirmacion',
                    helperText:
                        "Te hemos enviado un codigo de confirmacion a tu correo electronico",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Codigo Invalido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['code'] = value!;
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
                            child: CircularProgressIndicator(color: Colors.black),
                          )
                        : Text(
                            "Confirmar",
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
