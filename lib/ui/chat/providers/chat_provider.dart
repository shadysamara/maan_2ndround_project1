import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
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

  sendMessage() {
    MessageModel messageModel =
        MessageModel(messageController.text, AuthHelper.authHelper.getUserId());
    ChatFirestoreHelper.dataFirestoreHelper.sendMessage(messageModel);
    messageController.clear();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getStream() {
    return ChatFirestoreHelper.dataFirestoreHelper.getChatStream();
  }
}
