import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:f_task/src/domain/repositories/cart/cart_repository.dart';

import 'src/app.dart';
import 'src/app_options.dart';
import 'src/config/router/app_routes.dart';
import 'src/injector_container.dart';
import 'src/presentation/bloc/log_bloc_observer.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await LocalDataService.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  await init();

  /// global CERTIFICATE_VERIFY_FAILEd_KEY
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    ModelBinding(
      initialModel: AppOptions(
        themeMode: localSource.themeMode,
        locale: Locale(localSource.locale),
      ),
      child: const MainApp(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (cert, host, port) => true;
}

/// flutter pub run flutter_launcher_icons:main
/// flutter run -d windows
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// flutter pub ipa
