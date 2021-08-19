import 'package:flutter/material.dart';
import 'package:maan1/ui/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatelessWidget {
  String label;
  String content;
  ItemWidget(this.label, this.content);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Provider.of<AuthProvider>(context, listen: false)
                  .headingStyle,
            ),
            Text(
              content,
              style:
                  Provider.of<AuthProvider>(context, listen: false).bodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
