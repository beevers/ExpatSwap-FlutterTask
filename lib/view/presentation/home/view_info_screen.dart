import 'package:expatswap_fluttertask/data/dependency_injection/injection_container.dart';
import 'package:expatswap_fluttertask/data/utils/notify_utils.dart';
import 'package:expatswap_fluttertask/view/theme/app_color.dart';
import 'package:expatswap_fluttertask/view_model/cloud_firestore_vm.dart';
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
        body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: storageLocator<CloudFirestoreViewModel>().readUser(),
          builder: (context, snapshot) {
            final users = snapshot.data?.reversed.toList();
            if (snapshot.hasData) {
              return users!.isEmpty
                  ? const Center(
                      child: Text("No Information"),
                    )
                  : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            child: ListTile(
                              trailing: InkWell(
                                  onTap: () async {
                                    final response = await storageLocator<
                                            CloudFirestoreViewModel>()
                                        .deleteData(users[index]['id']);
                                    response
                                        ? NotifyUtil.showAlert(
                                            "Deleted Successfully")
                                        : NotifyUtil.showAlert(
                                            "An error occurred");
                                  },
                                  child: const Icon(Icons.close)),
                              title: Text("Name: ${users[index]['data'].name}"),
                              isThreeLine: true,
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email: ${users[index]['data'].email}"),
                                  Text("Phone:${users[index]['data'].phone}"),
                                  Text("DOB: ${users[index]['data'].dob}"),
                                  Text(
                                      "Address:${users[index]['data'].address}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: green,
              ));
            }
          },
        ));
  }
}
