import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';

class AppStrings {
  AppStrings._();
  
  static String getAppName(BuildContext context) => context.tr.appName;
  static String getEmail(BuildContext context) => context.tr.email;
  static String getPassword(BuildContext context) => context.tr.password;
  static String getOr(BuildContext context) => context.tr.or;
  static String getSignIn(BuildContext context) => context.tr.signIn;
  static String getSignUp(BuildContext context) => context.tr.signUp;
  static String getEnterEmailPassword(BuildContext context) => context.tr.enterEmailPassword;
  static String getCreateAccount(BuildContext context) => context.tr.createAccount;
  static String getAlreadyHaveAccount(BuildContext context) => context.tr.alreadyHaveAccount;
  static String getWelcome(BuildContext context) => context.tr.welcome;
  static String getPleaseLogin(BuildContext context) => context.tr.pleaseLogin;
  static String getGoogle(BuildContext context) => context.tr.google;
  static String getDontHaveAccount(BuildContext context) => context.tr.dontHaveAccount;
  static String getGetStarted(BuildContext context) => context.tr.getStarted;
}
