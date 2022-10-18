
import 'package:flutter/cupertino.dart';
import 'package:flutter2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
class Catelogheader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl3.bold.color(context.theme.accentColor).make(),
        "TrandingProducts".text.make(),
      ],
    );
  }
}