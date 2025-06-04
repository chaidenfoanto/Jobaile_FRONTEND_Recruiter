import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/BLoC/profile_bloc.dart';
import 'package:profile/BLoC/profile_event.dart';
import 'package:profile/models/user.dart';
import 'package:profile/views/pages/profile.dart'; // Pastikan path ini benar

// Mock halaman navigasi
class MockFavoriteWorkersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Pekerja Favorit')), body: Center(child: Text('Halaman Pekerja Favorit')));
  }
}

class MockTermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Terms & Conditions')), body: Center(child: Text('Halaman Terms & Conditions')));
  }
}

class MockContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Contact Us')), body: Center(child: Text('Halaman Contact Us')));
  }
}

class TestNavigatorObserver extends MockNavigatorObserver {
  final List<Route<dynamic>> pushedRoutes = <Route<dynamic>>[];

  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    pushedRoutes.add(route!);
  }
}

abstract class MockNavigatorObserver extends NavigatorObserver {}

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

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.text(user.name), findsOneWidget);
      expect(find.text(user.phoneNumber), findsOneWidget);
      expect(find.text('E-mail'), findsOneWidget);
      expect(find.text('E-mail address'), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);
      expect(find.text('Profil'), findsOneWidget);
      expect(find.byIcon(Icons.notifications_none), findsOneWidget);
      expect(find.text('Pekerja Favorit'), findsOneWidget);
      expect(find.text('Terms & Conditions'), findsOneWidget);
      expect(find.text('Contact us'), findsOneWidget);
      expect(find.byIcon(Icons.bookmark), findsOneWidget);
      expect(find.byIcon(Icons.assignment), findsOneWidget);
      expect(find.byIcon(Icons.contact_phone), findsOneWidget);
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

      await tester.drag(scrollableFinder, const Offset(0, -300));
      await tester.pumpAndSettle();
    });

    testWidgets('tapping list items does not crash and is tappable', (WidgetTester tester) async {
      // Kita akan menggunakan callback onListItemTap untuk mencegah navigasi sebenarnya
      // dan hanya memastikan bahwa onTap dipanggil.
      String? tappedRouteName;

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ProfileBloc>(
            create: (_) => ProfileBloc()..add(LoadProfile()),
            child: ProfilePage(
              // Injeksi callback untuk menguji onTap tanpa navigasi
              onListItemTap: (routeName) {
                tappedRouteName = routeName;
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final itemTextsAndRoutes = {
        'Pekerja Favorit': '/favorite_workers',
        'Terms & Conditions': '/terms_conditions',
        'Contact us': '/contact_us',
      };

      for (final entry in itemTextsAndRoutes.entries) {
        final text = entry.key;
        final expectedRoute = entry.value;

        final itemFinder = find.widgetWithText(ListTile, text);
        expect(itemFinder, findsOneWidget);

        await tester.ensureVisible(itemFinder);
        await tester.pumpAndSettle(); // Pastikan widget terlihat setelah scroll
        await tester.tap(itemFinder);
        await tester.pump(); // Pump untuk memicu callback onTap

        // Verifikasi bahwa callback dipanggil dengan rute yang benar
        expect(tappedRouteName, expectedRoute);
        tappedRouteName = null; // Reset untuk iterasi berikutnya
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

  group('ProfilePage Navigation Tests', () {
    late TestNavigatorObserver navigatorObserver;

    setUp(() {
      navigatorObserver = TestNavigatorObserver();
    });

    Future<void> pumpProfilePage(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [navigatorObserver],
          home: BlocProvider<ProfileBloc>(
            create: (_) => ProfileBloc()..add(LoadProfile()),
            child: ProfilePage(),
          ),
          routes: {
            '/favorite_workers': (context) => MockFavoriteWorkersPage(),
            '/terms_conditions': (context) => MockTermsAndConditionsPage(),
            '/contact_us': (context) => MockContactUsPage(),
          },
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));
    }

    testWidgets('tapping "Pekerja Favorit" navigates to the favorite workers page', (WidgetTester tester) async {
      await pumpProfilePage(tester);

      final itemFinder = find.widgetWithText(ListTile, 'Pekerja Favorit');
      await tester.ensureVisible(itemFinder);
      await tester.pumpAndSettle();
      await tester.tap(itemFinder);
      await tester.pumpAndSettle(); // Tunggu navigasi selesai

      expect(navigatorObserver.pushedRoutes.last.settings.name, '/favorite_workers');
      expect(find.byType(MockFavoriteWorkersPage), findsOneWidget);
    });

    testWidgets('tapping "Terms & Conditions" navigates to the terms and conditions page', (WidgetTester tester) async {
      await pumpProfilePage(tester);

      final itemFinder = find.widgetWithText(ListTile, 'Terms & Conditions');
      await tester.ensureVisible(itemFinder);
      await tester.pumpAndSettle();
      await tester.tap(itemFinder);
      await tester.pumpAndSettle(); // Tunggu navigasi selesai

      expect(navigatorObserver.pushedRoutes.last.settings.name, '/terms_conditions');
      expect(find.byType(MockTermsAndConditionsPage), findsOneWidget);
    });

    testWidgets('tapping "Contact us" navigates to the contact us page', (WidgetTester tester) async {
      await pumpProfilePage(tester);

      final itemFinder = find.widgetWithText(ListTile, 'Contact us');
      await tester.ensureVisible(itemFinder);
      await tester.pumpAndSettle();
      await tester.tap(itemFinder);
      await tester.pumpAndSettle(); // Tunggu navigasi selesai

      expect(navigatorObserver.pushedRoutes.last.settings.name, '/contact_us');
      expect(find.byType(MockContactUsPage), findsOneWidget);
    });
  });
}

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:profile/BLoC/profile_bloc.dart';
// import 'package:profile/BLoC/profile_state.dart';
// import 'package:profile/models/user.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:profile/views/pages/profile.dart';

// // Mock BLoC
// class MockProfileBloc extends Mock implements ProfileBloc {}

// // Mock NavigatorObserver untuk memantau navigasi
// abstract class MockNavigatorObserver extends NavigatorObserver {}

// class TestNavigatorObserver extends MockNavigatorObserver {
//   final List<Route<dynamic>> pushedRoutes = <Route<dynamic>>[];

//   @override
//   void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
//     pushedRoutes.add(route!);
//     super.didPush(route, previousRoute);
//   }
// }

// // Mock halaman navigasi
// class MockFavoriteWorkersPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Pekerja Favorit')),
//       body: Center(child: Text('Halaman Pekerja Favorit')),
//     );
//   }
// }

// class MockTermsAndConditionsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Terms & Conditions')),
//       body: Center(child: Text('Halaman Terms & Conditions')),
//     );
//   }
// }

// class MockContactUsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Contact Us')),
//       body: Center(child: Text('Halaman Contact Us')),
//     );
//   }
// }

// void main() {
//   late MockProfileBloc mockProfileBloc;
//   late User testUser;

//   setUp(() {
//     mockProfileBloc = MockProfileBloc();

//     testUser = User(
//       name: 'Julia Harayu Wati',
//       email: 'julia.harayuti01@gmail.com',
//       phoneNumber: '+62 385749464',
//     );

//     // Stub initial state and stream of states
//     when(() => mockProfileBloc.state).thenReturn(ProfileLoading());
//     whenListen(
//       mockProfileBloc,
//       Stream.fromIterable([
//         ProfileLoading(),
//         ProfileLoaded(testUser),
//       ]),
//       initialState: ProfileLoading(),
//     );
//   });

//   tearDown(() {
//     mockProfileBloc.close();
//   });

//   group('ProfilePage Widget Tests (with Mock BLoC)', () {
//     testWidgets('displays loading indicator initially', (tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: BlocProvider.value(
//             value: mockProfileBloc,
//             child: ProfilePage(),
//           ),
//         ),
//       );

//       expect(find.byType(CircularProgressIndicator), findsOneWidget);

//       await tester.pumpAndSettle();
//     });

//     testWidgets('displays profile information when loaded', (tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: BlocProvider.value(
//             value: mockProfileBloc,
//             child: ProfilePage(),
//           ),
//         ),
//       );

//       await tester.pumpAndSettle();

//       expect(find.byType(Image), findsOneWidget);
//       expect(find.byType(ClipRRect), findsOneWidget);
//       expect(find.text(testUser.name), findsOneWidget);
//       expect(find.text(testUser.phoneNumber), findsOneWidget);
//       expect(find.text('E-mail'), findsOneWidget);
//       expect(find.text('E-mail address'), findsOneWidget);
//       expect(find.text(testUser.email), findsOneWidget);
//       expect(find.text('Profil'), findsOneWidget);
//       expect(find.byIcon(Icons.notifications_none), findsOneWidget);
//       expect(find.text('Pekerja Favorit'), findsOneWidget);
//       expect(find.text('Terms & Conditions'), findsOneWidget);
//       expect(find.text('Contact us'), findsOneWidget);
//       expect(find.byIcon(Icons.bookmark), findsOneWidget);
//       expect(find.byIcon(Icons.assignment), findsOneWidget);
//       expect(find.byIcon(Icons.contact_phone), findsOneWidget);
//       expect(find.byIcon(Icons.arrow_forward_ios), findsNWidgets(3));
//     });

//     testWidgets('can scroll through the profile page', (tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: BlocProvider.value(
//             value: mockProfileBloc,
//             child: ProfilePage(),
//           ),
//         ),
//       );

//       await tester.pumpAndSettle();

//       final scrollableFinder = find.byType(SingleChildScrollView);
//       expect(scrollableFinder, findsOneWidget);

//       await tester.drag(scrollableFinder, const Offset(0, -300));
//       await tester.pumpAndSettle();
//     });

//     testWidgets('tapping list items triggers onListItemTap callback', (tester) async {
//       String? tappedRouteName;

//       await tester.pumpWidget(
//         MaterialApp(
//           home: BlocProvider.value(
//             value: mockProfileBloc,
//             child: ProfilePage(
//               onListItemTap: (routeName) {
//                 tappedRouteName = routeName;
//               },
//             ),
//           ),
//         ),
//       );

//       await tester.pumpAndSettle();

//       final itemTextsAndRoutes = {
//         'Pekerja Favorit': '/favorite_workers',
//         'Terms & Conditions': '/terms_conditions',
//         'Contact us': '/contact_us',
//       };

//       for (final entry in itemTextsAndRoutes.entries) {
//         final text = entry.key;
//         final expectedRoute = entry.value;

//         final itemFinder = find.widgetWithText(ListTile, text);
//         expect(itemFinder, findsOneWidget);

//         await tester.ensureVisible(itemFinder);
//         await tester.pumpAndSettle();
//         await tester.tap(itemFinder);
//         await tester.pump();

//         expect(tappedRouteName, expectedRoute);
//         tappedRouteName = null;
//       }
//     });

//     testWidgets('tapping notification icon calls onNotificationPressed', (tester) async {
//       bool pressed = false;

//       await tester.pumpWidget(
//         MaterialApp(
//           home: ProfilePage(
//             onNotificationPressed: () {
//               pressed = true;
//             },
//           ),
//         ),
//       );

//       await tester.pumpAndSettle();

//       final buttonFinder = find.byKey(Key('notification_button'));
//       expect(buttonFinder, findsOneWidget);

//       await tester.tap(buttonFinder);
//       await tester.pump();

//       expect(pressed, true);
//     });
//   });

//   group('ProfilePage Navigation Tests', () {
//     late TestNavigatorObserver navigatorObserver;

//     setUp(() {
//       navigatorObserver = TestNavigatorObserver();
//     });

//     Future<void> pumpProfilePage(WidgetTester tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           navigatorObservers: [navigatorObserver],
//           home: BlocProvider.value(
//             value: mockProfileBloc,
//             child: ProfilePage(),
//           ),
//           routes: {
//             '/favorite_workers': (context) => MockFavoriteWorkersPage(),
//             '/terms_conditions': (context) => MockTermsAndConditionsPage(),
//             '/contact_us': (context) => MockContactUsPage(),
//           },
//         ),
//       );
//       await tester.pumpAndSettle();
//     }

//     testWidgets('navigates to favorite workers page', (tester) async {
//       await pumpProfilePage(tester);

//       final itemFinder = find.widgetWithText(ListTile, 'Pekerja Favorit');
//       await tester.ensureVisible(itemFinder);
//       await tester.pumpAndSettle();
//       await tester.tap(itemFinder);
//       await tester.pumpAndSettle();

//       expect(navigatorObserver.pushedRoutes.last.settings.name, '/favorite_workers');
//       expect(find.byType(MockFavoriteWorkersPage), findsOneWidget);
//     });

//     testWidgets('navigates to terms and conditions page', (tester) async {
//       await pumpProfilePage(tester);

//       final itemFinder = find.widgetWithText(ListTile, 'Terms & Conditions');
//       await tester.ensureVisible(itemFinder);
//       await tester.pumpAndSettle();
//       await tester.tap(itemFinder);
//       await tester.pumpAndSettle();

//       expect(navigatorObserver.pushedRoutes.last.settings.name, '/terms_conditions');
//       expect(find.byType(MockTermsAndConditionsPage), findsOneWidget);
//     });

//     testWidgets('navigates to contact us page', (tester) async {
//       await pumpProfilePage(tester);

//       final itemFinder = find.widgetWithText(ListTile, 'Contact us');
//       await tester.ensureVisible(itemFinder);
//       await tester.pumpAndSettle();
//       await tester.tap(itemFinder);
//       await tester.pumpAndSettle();

//       expect(navigatorObserver.pushedRoutes.last.settings.name, '/contact_us');
//       expect(find.byType(MockContactUsPage), findsOneWidget);
//     });
//   });
// }
