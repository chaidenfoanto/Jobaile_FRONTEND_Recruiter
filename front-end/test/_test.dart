import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/BLoC/profile_bloc.dart';
import 'package:profile/BLoC/profile_event.dart';
import 'package:profile/models/user.dart'; // Pastikan path ini benar dan UserModel ada
import 'package:profile/views/pages/profile.dart'; // Pastikan path ini benar

void main() {
  group('ProfilePage Widget Tests', () {
    testWidgets('displays loading indicator initially', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ProfileBloc>(
            create: (_) => ProfileBloc()..add(LoadProfile()),
            child: ProfilePage(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 2));
    });

    testWidgets('displays profile information when loaded', (WidgetTester tester) async {
      final user = User(
        name: 'Julia Harayu Wati',
        email: 'julia.harayuti01@gmail.com',
        phoneNumber: '+62 385749464',
      );

      final bloc = ProfileBloc();

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ProfileBloc>(
            create: (_) => bloc..add(LoadProfile()),
            child: ProfilePage(),
          ),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Check profile picture exists
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(ClipRRect), findsOneWidget);

      // Check user name text
      expect(find.text(user.name), findsOneWidget);

      // Check phone number text
      expect(find.text(user.phoneNumber), findsOneWidget);

      // Check email label and value
      expect(find.text('E-mail'), findsOneWidget);
      expect(find.text('E-mail address'), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);

      // Check AppBar title
      expect(find.text('Profil'), findsOneWidget);

      // Check notification icon button exists
      expect(find.byIcon(Icons.notifications_none), findsOneWidget);

      // Check list items titles exist
      expect(find.text('Pekerja Favorit'), findsOneWidget);
      expect(find.text('Terms & Conditions'), findsOneWidget);
      expect(find.text('Contact us'), findsOneWidget);

      // Check list item icons exist
      expect(find.byIcon(Icons.bookmark), findsOneWidget);
      expect(find.byIcon(Icons.assignment), findsOneWidget);
      expect(find.byIcon(Icons.contact_phone), findsOneWidget);

      // Check if all ListTile trailing arrow icon exist
      expect(find.byIcon(Icons.arrow_forward_ios), findsNWidgets(3));
    });

    testWidgets('can scroll through the profile page', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ProfileBloc>(
            create: (_) => ProfileBloc()..add(LoadProfile()),
            child: ProfilePage(),
          ),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final scrollableFinder = find.byType(SingleChildScrollView);
      expect(scrollableFinder, findsOneWidget);

      // Scroll down to ensure items are visible
      await tester.drag(scrollableFinder, const Offset(0, -300));
      await tester.pumpAndSettle();
    });

    testWidgets('tapping list items does not crash and is tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ProfileBloc>(
            create: (_) => ProfileBloc()..add(LoadProfile()),
            child: ProfilePage(),
          ),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final itemTexts = ['Pekerja Favorit', 'Terms & Conditions', 'Contact us'];

      for (final text in itemTexts) {
        final itemFinder = find.widgetWithText(ListTile, text);
        expect(itemFinder, findsOneWidget);
        
        // Scroll to the item before tapping
        await tester.ensureVisible(itemFinder);
        await tester.tap(itemFinder);
        await tester.pump();
      }
    });

    testWidgets('tapping notification icon calls onPressed', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: ProfilePage(
          onNotificationPressed: () {
            pressed = true;
          },
        ),
      ),
    );

    await tester.pumpAndSettle();

    final buttonFinder = find.byKey(Key('notification_button'));
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump();

    expect(pressed, true);
  });
  });
}