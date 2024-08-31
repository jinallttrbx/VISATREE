import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TabView Refresh Example',
      home: TabViewWithRefresh(),
    );
  }
}

class TabViewWithRefresh extends StatefulWidget {
  @override
  _TabViewWithRefreshState createState() => _TabViewWithRefreshState();
}

class _TabViewWithRefreshState extends State<TabViewWithRefresh>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<List<String>> _tabData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabData = List.generate(3, (index) => List.generate(20, (i) => 'Item ${i + 1}'));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh(int tabIndex) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a network call
    setState(() {
      _tabData[tabIndex] = List.generate(
          20, (i) => 'Item ${i + 1} (Refreshed at ${DateTime.now().second})');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab View with Pull-to-Refresh'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabContent(0),
          _buildTabContent(1),
          _buildTabContent(2),
        ],
      ),
    );
  }

  Widget _buildTabContent(int tabIndex) {
    return RefreshIndicator(
      onRefresh: () => _handleRefresh(tabIndex),
      child: ListView.builder(
        itemCount: _tabData[tabIndex].length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tabData[tabIndex][index]),
          );
        },
      ),
    );
  }
}
