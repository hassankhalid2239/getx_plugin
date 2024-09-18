import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_plugin/Controllers/list_controller.dart';

import 'data.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final _listController = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    print('build....');
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'List App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              _listController.addUser(
                  data[index]['name'], data[index]['image']);
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[index]['image']),
            ),
            title: Text(data[index]['name']),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
          height: 90,
          child: Obx(() {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _listController.selectedUsers.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 90,
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              _listController.selectedUsers[index]['image']),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            _listController.deleteUser(index);
                          },
                          icon: const Icon(
                            Icons.clear,
                            // color: Colors.black,
                            size: 28,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          _listController.selectedUsers[index]['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          })),
    );
  }
}
