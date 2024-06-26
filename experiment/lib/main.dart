import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/CompareInheritedWidgett/Compare_inherited_page.dart';
import 'package:flutter_lab/pages/GridViewWidget/grid_view_page.dart';
import 'package:flutter_lab/pages/InheritedWidget/demo_inherited_page.dart';
import 'package:flutter_lab/pages/InheritedWidget/Myprovider/my_provider.dart';
import 'package:flutter_lab/pages/LearnScaffold/learn_scaffold.dart';
import 'package:flutter_lab/pages/ListViewWidget/list_view_page.dart';
import 'package:flutter_lab/pages/StyleUIPractice/style_widget_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          'home-page': (context) => const LearnScaffold(),
          'inherit-page': (context) => const DemoInheritedWidgetPage(),
          'c-inherit-page': (context) => const CompareInheritedWidgetPage(),
          'list-page': (context) => const MyListViewPage(),
          'grid-page': (context) => const MyGridViewPage(),
        },
        // initialRoute: 'home-page',
        home: const MyStyleWidget(),
      ),
    );
  }
}
