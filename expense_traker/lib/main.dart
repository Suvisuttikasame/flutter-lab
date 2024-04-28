import 'package:expense_traker/widgets/expenses.dart';
import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 179, 151, 227),
);
final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 68, 75, 135),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColorScheme.primaryContainer),
          ),
        ),
        theme: ThemeData(
                // This is the theme of your application.
                //
                // TRY THIS: Try running your application with "flutter run". You'll see
                // the application has a purple toolbar. Then, without quitting the app,
                // try changing the seedColor in the colorScheme below to Colors.green
                // and then invoke "hot reload" (save your changes or press the "hot
                // reload" button in a Flutter-supported IDE, or press "r" if you used
                // the command line to start the app).
                //
                // Notice that the counter didn't reset back to zero; the application
                // state is not lost during the reload. To reset the state, use hot
                // restart instead.
                //
                // This works for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                // useMaterial3: true,
                )
            .copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer),
          ),
          textTheme: const TextTheme().copyWith(
            titleLarge: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            titleMedium: const TextStyle(
              color: Colors.black,
            ),
            bodyLarge: const TextStyle(
              color: Colors.black,
            ),
            bodyMedium: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        // themeMode: ThemeMode.dark,
        home: const Expenses());
  }
}
