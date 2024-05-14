import 'package:calculator/utils/colors.dart';
import 'package:calculator/utils/size_config.dart';
import 'package:calculator/widgets/textbutton.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double num1 = 0;
  double num2 = 0;
  String showanswers = "0";
  String? operation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    bottom: SizeConfig.pad24(context) * 2,
                    right: SizeConfig.pad8(context)),
                child: Text(
                  showanswers,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: SizeConfig.font28(context) * 2),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextButton(
                  txt: "AC",
                  btncolor: greyColor,
                  onpressed: () => clear(),
                  txtcolor: darkblackColor,
                ),
                CustomTextButton(
                  txt: "%",
                  btncolor: greyColor,
                  onpressed: () => selectoperation('%'),
                  txtcolor: darkblackColor,
                ),
                CustomTextButton(
                  txt: "<-",
                  btncolor: greyColor,
                  onpressed: () => delete(),
                  txtcolor: darkblackColor,
                ),
                CustomTextButton(
                  txt: "/",
                  btncolor: orangeColor,
                  onpressed: () => selectoperation("/"),
                  txtcolor: whiteColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextButton(
                  txt: "7",
                  btncolor: blackColor,
                  onpressed: () => shownumber(7),
                  txtcolor: whiteColor,
                ),
                CustomTextButton(
                  txt: "8",
                  btncolor: blackColor,
                  onpressed: () => shownumber(8),
                  txtcolor: whiteColor,
                ),
                CustomTextButton(
                  txt: "9",
                  btncolor: blackColor,
                  onpressed: () => shownumber(9),
                  txtcolor: whiteColor,
                ),
                CustomTextButton(
                  txt: "X",
                  btncolor: orangeColor,
                  onpressed: () => selectoperation("X"),
                  txtcolor: whiteColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextButton(
                  txt: "4",
                  btncolor: blackColor,
                  onpressed: () => shownumber(4),
                  txtcolor: whiteColor,
                ),
                CustomTextButton(
                  txt: "5",
                  btncolor: blackColor,
                  onpressed: () => shownumber(5),
                  txtcolor: whiteColor,
                ),
                CustomTextButton(
                  txt: "6",
                  btncolor: blackColor,
                  onpressed: () => shownumber(6),
                  txtcolor: whiteColor,
                ),
                CustomTextButton(
                  txt: "-",
                  btncolor: orangeColor,
                  onpressed: () => selectoperation("-"),
                  txtcolor: whiteColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextButton(
                  txt: "1",
                  btncolor: blackColor,
                  onpressed: () => shownumber(1),
                  txtcolor: whiteColor,
                ),
                CustomTextButton(
                  txt: "2",
                  btncolor: blackColor,
                  onpressed: () => shownumber(2),
                  txtcolor: whiteColor,
                ),
                CustomTextButton(
                  txt: "3",
                  btncolor: blackColor,
                  onpressed: () => shownumber(3),
                  txtcolor: whiteColor,
                ),
                CustomTextButton(
                  txt: "+",
                  btncolor: orangeColor,
                  onpressed: () => selectoperation('+'),
                  txtcolor: whiteColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.pad8(context)),
                  child: Container(
                    width: SizeConfig.width(context) / 2.1,
                    height: SizeConfig.height(context) / 10,
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () => shownumber(0),
                      child: Text(
                        "0",
                        style: TextStyle(
                            fontSize: SizeConfig.font28(context),
                            color: whiteColor),
                      ),
                    ),
                  ),
                ),
                CustomTextButton(
                  txt: ".",
                  btncolor: blackColor,
                  onpressed: null,
                  txtcolor: whiteColor,
                ),
                CustomTextButton(
                  txt: "=",
                  btncolor: orangeColor,
                  onpressed: () => calculate(),
                  txtcolor: whiteColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void clear() {
    setState(() {
      num1 = 0;
      num2 = 0;
      showanswers = "0";
      operation = null;
    });
  }

  void selectoperation(String op) {
    setState(() {
      operation = op;
      num1 = double.parse(showanswers);
      showanswers = "0";
    });
  }

  void delete() {
    setState(() {
      if (showanswers.length > 1) {
        showanswers = showanswers.substring(0, showanswers.length - 1);
      } else {
        showanswers = "0";
      }
    });
  }

  void shownumber(int num) {
    setState(() {
      if (showanswers == "0") {
        showanswers = "$num";
      } else {
        showanswers = "$showanswers$num";
      }
    });
  }

  void calculate() {
    setState(() {
      num2 = double.parse(showanswers);
      if (operation == "+") {
        showanswers = (num1 + num2).toString();
      } else if (operation == "-") {
        showanswers = (num1 - num2).toString();
      } else if (operation == "X") {
        showanswers = (num1 * num2).toString();
      } else if (operation == "/") {
        showanswers = (num1 / num2).toString();
      } else if (operation == "%") {
        showanswers = (num1 % num2).toString();
      }
    });
  }
}
