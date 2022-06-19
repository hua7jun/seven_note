import 'package:flutter/material.dart';
import 'package:seven_note/controls/custm_tab.dart';

class TabHomePage extends StatefulWidget {
  const TabHomePage({Key? key}) : super(key: key);

  @override
  _TabHomePageState createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage>
    with SingleTickerProviderStateMixin {
  List tabs = ["分类1", "分类2", "分类3", "分类4"];
  List<Widget> tab_views = ["分类1", "分类2", "分类3", "分类4"].map((item) {
    return Center(
      child: Text(item),
    );
  }).toList();
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _tabBar() {
    return Container(
      height: 56,
      color: Colors.white,
      child: TabBar(
          controller: _controller,
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black26,
          tabs: tabs
              .map((e) => CustomTab(
                    child: SizedBox(
                      width: 100,
                      child: Row(
                        children: [Text(e), const Text("关闭")],
                      ),
                    ),
                  ))
              .toList()),
    );
  }

  Widget _body() {
    return TabBarView(
      controller: _controller,
      children: tab_views,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tabBar(),
        Expanded(
          child: _body(),
        ),
      ],
    );
  }
}
