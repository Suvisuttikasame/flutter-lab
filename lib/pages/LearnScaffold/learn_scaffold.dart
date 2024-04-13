import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LearnScaffold extends StatefulWidget {
  const LearnScaffold({super.key});

  @override
  State<LearnScaffold> createState() => _LearnScaffoldState();
}

class _LearnScaffoldState extends State<LearnScaffold>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _navigationIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text('Scaffold'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.man)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
        ],
        bottom: TabBar(controller: _tabController, tabs: const [
          Icon(Icons.book),
          Icon(
            Icons.grade,
          )
        ]),
      ),
      drawer: Drawer(
        clipBehavior: Clip.antiAlias,
        child: ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.one_k),
              title: Text('first'),
            ),
            ListTile(
              leading: Icon(Icons.two_k),
              title: Text('second'),
            ),
            ListTile(
              leading: Icon(Icons.three_k),
              title: Text('third'),
            ),
          ],
        ),
      ),
      drawerEnableOpenDragGesture: false,
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: const Text('open drawer'));
              },
            ),
          ),
          const Center(child: Text('grade')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navigationIndex,
          onTap: (value) {
            setState(() {
              _navigationIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.heart_broken), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.handshake), label: ''),
          ]),
    );
  }
}
