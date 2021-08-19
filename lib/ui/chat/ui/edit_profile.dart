import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/providers/auth_provider.dart';
import 'package:maan1/ui/auth/ui/widgets/custom_dropdown_button.dart';
import 'package:maan1/ui/auth/ui/widgets/custom_textfield.dart';
import 'package:maan1/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  static final routeName = 'editProfile';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: Form(
          key: provider.registerKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextfeild(
                  label: 'UserName',
                  controller: provider.userNameController,
                ),
                CustomDropDownButton(),
                CustomTextfeild(
                  label: 'Country',
                  controller: provider.countryController,
                ),
                CustomTextfeild(
                  label: 'City',
                  controller: provider.cityController,
                ),
                CustomTextfeild(
                  label: 'Phone',
                  controller: provider.phoneController,
                ),
                CustomButton(title: 'Edit', function: provider.editProfile)
              ],
            ),
          ),
        ),
      );
    });
  }
}
