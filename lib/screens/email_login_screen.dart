import 'package:amplify_auth_cognito/amplify_auth_cognito.dart' show AuthException;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart' show isEmail;
import '../providers/authentication_provider.dart';

class EmailLoginScreen extends StatefulWidget {
  static const name = "email-login";
  static const route = "email-login";
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  Map<String, String> _authData = {
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
      final authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
      await authProvider.signInUser(_authData["email"]!, _authData["password"]!);
      if (context.mounted) {
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
            title: Text("Ocurrio un error"),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cerrar"))
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
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Correo',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !isEmail(value)) {
                      return 'Correo invalido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value!;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Contraseña invalida asegurate de que contenga por lo menos 8 caracteres';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: _isLoading ? null : _submit,
                    child: _isLoading
                        ? Center(
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
