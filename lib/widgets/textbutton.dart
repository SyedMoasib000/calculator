import 'package:calculator/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    required this.txt,
    required this.btncolor,
    required this.onpressed,
    required this.txtcolor,
    super.key,
  });

  final String txt;
  final Color txtcolor;
  final Color btncolor;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.pad8(context)),
      child: Container(
        width: SizeConfig.width(context) / 4.4,
        height: SizeConfig.height(context) / 10,
        decoration: BoxDecoration(
          color: btncolor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: TextButton(
            onPressed: onpressed,
            child: Text(
              txt,
              style: TextStyle(
                  fontSize: SizeConfig.font28(context),
                  color: txtcolor,
                  overflow: TextOverflow.ellipsis),
            )),
      ),
    );
  }
}
