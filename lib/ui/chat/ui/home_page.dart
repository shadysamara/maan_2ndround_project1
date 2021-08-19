import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/auth/providers/auth_provider.dart';
import 'package:maan1/ui/chat/providers/chat_provider.dart';
import 'package:maan1/ui/chat/ui/chat_page.dart';
import 'package:maan1/ui/chat/ui/edit_profile.dart';
import 'package:maan1/ui/chat/ui/profile_page.dart';
import 'package:maan1/ui/helpers/route_helper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final routeName = 'homePage';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .editProfileNavigation();
              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: PageView(
        controller: Provider.of<ChatProvider>(context).pageController,
        children: [ProfilePage(), ChatPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<ChatProvider>(context).currentPageIndex,
        onTap: (x) {
          Provider.of<ChatProvider>(context, listen: false).changePageIndex(x);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
        ],
      ),
    );
  }
}
