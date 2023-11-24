import 'package:expatswap_fluttertask/data/dependency_injection/injection_container.dart';
import 'package:expatswap_fluttertask/view_model/cloud_firestore_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/global_var/global_variable.dart';

class ViewInformationScreen extends ConsumerStatefulWidget {
  const ViewInformationScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ViewInformationScreenState();
}

class _ViewInformationScreenState extends ConsumerState<ViewInformationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(savedDataProvider.notifier).state =
          await storageLocator<CloudFirestoreViewModel>().retrieveData(ref);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final savedData = ref.watch(savedDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("View Information "),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(child: Icon(Icons.delete_forever)),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: ref.read(numberOfDataProvider),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  child: ListTile(
                    title: Text("Name: ${savedData['name']}"),
                    isThreeLine: true,
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email: ${savedData['email']}"),
                        Text("Phone: ${savedData['phone']}"),
                        Text("DOB: ${savedData['dob']}"),
                        Text("Address: ${savedData['address']}"),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
