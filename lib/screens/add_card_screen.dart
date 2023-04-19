import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/payment_methods_by_user.dart';
import 'package:provider/provider.dart';

class AddCardScreen extends StatelessWidget {
  static const name = "add-card";
  static const path = "add-card";
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<AuthenticationProvider,
        PaymentMethodsByUserProvider>(
      create: (context) {
        return PaymentMethodsByUserProvider();
      },
      update: (context, authenticationProvider, prev) {
        return PaymentMethodsByUserProvider(
            authenticationProvider: authenticationProvider);
      },
      child: const CardForm(),
    );
  }
}

// HOLA
class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  bool _isLoading = false;
  TextEditingController cardNumberController = TextEditingController();
  _CardType cardType = _CardType.Invalid;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _cardData = {
    'number': '',
    'card_holder': '',
    'exp_month': '',
    'exp_year': '',
    'cvc': ''
  };

  @override
  void initState() {
    cardNumberController.addListener(
      () {
        getCardTypeFrmNumber();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    super.dispose();
  }

  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      String input = _CardUtils.getCleanedNumber(cardNumberController.text);
      _CardType type = _CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  void _addCardHandler(BuildContext context) async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      if (!_formKey.currentState!.validate()) {
        // Invalid!
        return;
      }
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
      final cardSaved = await Provider.of<PaymentMethodsByUserProvider>(context,
              listen: false)
          .saveNewCard(_cardData);
      if (cardSaved == null) {
        if (context.mounted) {
          context.pop();
        }
      } else {
        _showErrorDialog(cardSaved);
      }
    } on ApiException catch (e) {
      _showErrorDialog(e.message);
    } catch (e) {
      safePrint(e.toString());
      _showErrorDialog("Ocurrio un error");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agrega tu tarjeta")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(19),
                        _CardNumberInputFormatter()
                      ],
                      decoration: InputDecoration(
                        hintText: "Numero de tarjeta",
                        suffix: _CardUtils.getCardIcon(cardType),
                      ),
                      validator: (input) => _CardUtils.validateCardNum(input),
                      onSaved: (input) {
                        _cardData["number"] =
                            _CardUtils.getCleanedNumber(input!);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        decoration: const InputDecoration(
                          hintText: "Nombre completo",
                        ),
                        validator: (input) {
                          if (input == null || input.isEmpty) {
                            return "Campo requerido";
                          }
                          return null;
                        },
                        onSaved: (input) {
                          _cardData["card_holder"] = input!;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              // Limit the input
                              LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: const InputDecoration(hintText: "CVV"),
                            validator: (input) => _CardUtils.validateCVV(input),
                            onSaved: (input) {
                              _cardData["cvc"] = input!;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                              _CardMonthInputFormatter(),
                            ],
                            decoration:
                                const InputDecoration(hintText: "MM/YY"),
                            validator: (input) =>
                                _CardUtils.validateDate(input),
                            onSaved: (input) {
                              _cardData["exp_year"] =
                                  _CardUtils.getYear(input!);
                              _cardData["exp_month"] =
                                  _CardUtils.getMonth(input);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () => _addCardHandler(context),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : Text(
                          "Agregar",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _CardType {
  Master,
  Visa,
  Verve,
  Discover,
  AmericanExpress,
  DinersClub,
  Jcb,
  Others,
  Invalid
}

class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class _CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class _CardUtils {
  static _CardType getCardTypeFrmNumber(String input) {
    _CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = _CardType.Master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = _CardType.Visa;
    } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = _CardType.Verve;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = _CardType.AmericanExpress;
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = _CardType.Discover;
    } else if (input.startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = _CardType.DinersClub;
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = _CardType.Jcb;
    } else if (input.length <= 8) {
      cardType = _CardType.Others;
    } else {
      cardType = _CardType.Invalid;
    }
    return cardType;
  }

  static Widget? getCardIcon(_CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case _CardType.Master:
        img = 'mastercard.png';
        break;
      case _CardType.Visa:
        img = 'visa.jpeg';
        break;
      case _CardType.AmericanExpress:
        img = 'american_express.png';
        break;
      case _CardType.DinersClub:
        img = 'dinners_club.jpeg';
        break;
      case _CardType.Others:
        icon = const Icon(
          Icons.credit_card,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
    }
    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'assets/images/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  /// With the card number with Luhn Algorithm/// https://en.wikipedia.org/wiki/Luhn_algorithm
  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return "Campo requerido";
    }
    input = getCleanedNumber(input);
    if (input.length < 8) {
      return "Tarjeta invalida";
    }
    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit =
          int.parse(input[length - i - 1]); // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }
    if (sum % 10 == 0) {
      return null;
    }
    return "Tarjeta invalida";
  }

  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo requerido";
    }
    if (value.length < 3 || value.length > 4) {
      return "CVV es invalido";
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return "campo requerido";
    }
    int year;
    int month;
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));

      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }
    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Mes de vencimiento invalido';
    }
    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'año de vencimiento invalido';
    }
    if (!hasDateExpired(month, year)) {
      return "Tarjeta vencida";
    }
    return null;
  }

  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }

  static String getMonth(String expiryDate) {
    return expiryDate.split('/')[0];
  }

  static String getYear(String expiryDate) {
    return expiryDate.split('/')[1];
  }
}
