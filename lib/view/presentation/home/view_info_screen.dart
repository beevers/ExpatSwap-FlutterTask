import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewInformationScreen extends ConsumerStatefulWidget {
  const ViewInformationScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ViewInformationScreenState();
}

class _ViewInformationScreenState extends ConsumerState<ViewInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Information "),
        centerTitle: true,
      ),
      body: const Center(child: Text("No Information Yet")),
    );
  }
}
