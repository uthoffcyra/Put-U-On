import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:put_u_on/flutter_flow/flutter_flow_drop_down.dart';
import 'package:put_u_on/flutter_flow/flutter_flow_icon_button.dart';
import 'package:put_u_on/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:put_u_on/index.dart';
import 'package:put_u_on/main.dart';
import 'package:put_u_on/flutter_flow/flutter_flow_util.dart';
import 'package:spotify_item_mwlatt/app_state.dart'
    as spotify_item_mwlatt_app_state;

import 'package:provider/provider.dart';
import 'package:put_u_on/backend/firebase/firebase_config.dart';
import 'package:put_u_on/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
    spotify_item_mwlatt_app_state.FFAppState.reset();
    await spotify_item_mwlatt_app_state.FFAppState().initializePersistedState();
  });

  testWidgets('log in test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => spotify_item_mwlatt_app_state.FFAppState(),
        ),
      ],
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('LoginTab_8ak4')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(const ValueKey('LoginTab_8ak4')));
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const ValueKey('LoginEmailField_uhu5')), 'mike@gmail.com');
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const ValueKey('LoginPasswordField_ys4d')), '12345678');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('Button_6hz9')));
    await tester.pumpAndSettle();
    expect(find.text('onboarding'), findsOneWidget);
  });

  testWidgets('onboarding smooth test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => spotify_item_mwlatt_app_state.FFAppState(),
        ),
      ],
      child: MyApp(
        entryPage: EditProfileWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('usernameInput_f2vp')), 'EmRoboTest');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('nameInput_jt4u')), 'Emily');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('locationInput_24ux')), 'Cranston');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Button_i9r9')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    expect(find.text('golden'), findsWidgets);
  });

  testWidgets('US5 User Settings - Navigation', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'robotest@email.com', password: 'password');
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => spotify_item_mwlatt_app_state.FFAppState(),
        ),
      ],
      child: MyApp(
        entryPage: UserSettingsWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('Button_ykkm')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    expect(find.byKey(const ValueKey('Button_i9r9')), findsWidgets);
    await tester.tap(find.byKey(const ValueKey('Button_i9r9')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    expect(find.text('robotest'), findsWidgets);
    await tester.tap(find.byKey(const ValueKey('Button_kb3l')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    expect(find.text('Let\'s choose some music genres...'), findsWidgets);
    await tester.tap(find.byKey(const ValueKey('Button_o0qr')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    expect(find.text('robotest'), findsWidgets);
  });

  testWidgets('US5 User Settings - Log Out', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'robotest@email.com', password: 'password');
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
        ChangeNotifierProvider(
          create: (context) => spotify_item_mwlatt_app_state.FFAppState(),
        ),
      ],
      child: MyApp(
        entryPage: UserSettingsWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('Button_h1kd')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    expect(find.byKey(const ValueKey('Image_s38o')), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
