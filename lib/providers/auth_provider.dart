import 'package:amplify_api/model_queries.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';

class AuthProvider with ChangeNotifier {
  User? _user;

  AuthProvider() {
    isUserSignedIn().then((isSignedin) {
      if (isSignedin) {
        setUser();
      }
    });
  }

  User? get user {
    return _user;
  }

  Future<void> setUser() async {
    final isSignedIn = await isUserSignedIn();
    if (isSignedIn) {
      try {
        final userData = await getCurrentUser();
        final request = ModelQueries.get(User.classType, userData.userId);
        final response = await Amplify.API.query(request: request).response;
        final data = response.data;
        if (data == null) {
          print('errors: ${response.errors}');
          return;
        }
        _user = data;
        notifyListeners();
      } on ApiException catch (e) {
        safePrint('Query failed: $e');
      }
    }
  }

  Future<bool> isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    return result.isSignedIn;
  }

  Future<AuthUser> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    return user;
  }

  Future<void> signUpUser(String name, String email, String password) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: email,
        CognitoUserAttributeKey.name: name
      };
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
    } on AuthException catch (e) {
      safePrint(e.message);
      safePrint(e.recoverySuggestion);
      rethrow;
    }
  }

  Future<void> confirmUser(String username, String confirmationCode) async {
    try {
      final result =
          await Amplify.Auth.confirmSignUp(username: username, confirmationCode: confirmationCode);
    } on AuthException catch (e) {
      safePrint(e.message);
      rethrow;
    }
  }

  Future<void> signInUser(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );
      await setUser();
    } on AuthException catch (e) {
      safePrint(e.message);
      rethrow;
    }
  }

  Future<void> deleteUser() async {
    try {
      await Amplify.Auth.deleteUser();
      _user = null;
      notifyListeners();
      safePrint('Delete user succeeded');
    } on Exception catch (e) {
      safePrint('Delete user failed with error: $e');
    }
  }

  Future<void> signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
      _user = null;
      notifyListeners();
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<void> resetPassword(String username) async {
    try {
      final result = await Amplify.Auth.resetPassword(
        username: username,
      );
    } on AmplifyException catch (e) {
      safePrint(e);
      rethrow;
    }
  }

  Future<void> confirmResetPassword(
      String username, String password, String confirmationCode) async {
    try {
      await Amplify.Auth.confirmResetPassword(
          username: username, newPassword: password, confirmationCode: confirmationCode);
    } on AmplifyException catch (e) {
      safePrint(e);
      rethrow;
    }
  }

  Future<void> updatePassword(String oldPassword, String newPassword) async {
    try {
      await Amplify.Auth.updatePassword(
        newPassword: newPassword,
        oldPassword: oldPassword,
      );
    } on AmplifyException catch (e) {
      safePrint(e);
      rethrow;
    }
  }
}
