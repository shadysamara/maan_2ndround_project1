import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/data/auth_helper.dart';
import 'package:maan1/ui/auth/data/firestore_helper.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/auth/providers/auth_provider.dart';
import 'package:maan1/ui/auth/ui/widgets/custom_dropdown_button.dart';
import 'package:maan1/ui/auth/ui/widgets/custom_textfield.dart';
import 'package:maan1/ui/helpers/route_helper.dart';
import 'package:maan1/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Form(
        key: provider.registerKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextfeild(
                label: 'Email',
                controller: provider.emailController,
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextfeild(
                label: 'Password',
                isHidden: true,
                controller: provider.passwordController,
              ),
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
              CustomButton(
                  title: 'Register', function: provider.registerNewUser)
            ],
          ),
        ),
      );
    });
  }
}
