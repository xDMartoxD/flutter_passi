import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/screen_args/email_confirmation_screen_args.dart';
import 'package:passi_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class EmailConfirmationScreen extends StatefulWidget {
  static const name = "email-confirmation";
  static const route = "email-confirmation";
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
  Map<String, String> _authData = {
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
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.confirmUser(widget.email, _authData["code"]!);
      await authProvider.signInUser(widget.email, widget.password);

      context.pop();
      context.pop();
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
                    labelText: 'Codigo de confirmacion',
                    helperText:
                        "Te hemos enviado un codigo de confirmacion a tu correo electronico",
                  ),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
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
