import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
import 'package:maan1/ui/auth/data/firestorage_helper.dart';
import 'package:maan1/ui/chat/data/data_firestore_helper.dart';
import 'package:maan1/ui/chat/models/message_model.dart';

class ChatProvider extends ChangeNotifier {
  PageController pageController = PageController();
  String getMyId() {
    return AuthHelper.authHelper.getUserId();
  }

  int currentPageIndex = 0;
  changePageIndex(int newIndex) {
    pageController.jumpToPage(newIndex);
    this.currentPageIndex = newIndex;
    notifyListeners();
  }

  TextEditingController messageController = TextEditingController();

  sendMessage([MessageModel messageModel]) {
    if (messageModel == null) {
      messageModel = MessageModel(
          messageController.text, AuthHelper.authHelper.getUserId());
    }
    ChatFirestoreHelper.dataFirestoreHelper.sendMessage(messageModel);
    messageController.clear();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStream() {
    return ChatFirestoreHelper.dataFirestoreHelper.getChatStream();
  }

  ///////////////////////////
  ///send image in message
  File file;
  selectFile() async {
    XFile file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    this.file = File(file.path);
    String imageUrl = await FireStorageHelper.fireStorageHelper
        .uploadImage(this.file, 'chat_images');
    MessageModel messageModel = MessageModel(
      '',
      getMyId(),
      imageUrl: imageUrl,
    );
    sendMessage(messageModel);
  }
}
