import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SlidingUpPanel(
        panel: _buildPanel(),
        body: _buildBody(),
        minHeight: 60.0,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        collapsed: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: const Center(
            child: Icon(Icons.keyboard_arrow_up, color: Colors.white),
          ),
        ),
        onPanelSlide: (double position) {
          // Handle slide event
        },
      ),
    );
  }

  Widget _buildPanel() {
    // Add your panel content here
    return Container(
      color: Colors.white,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => ListTile(
            leading: const Icon(Icons.account_circle_sharp),
            title: Text("User ${index + 1}"),
          ),
        ),
      )),
    );
  }

  Widget _buildBody() {
    // Add your main content here
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Text('Main Content'),
      ),
    );
  }
}
