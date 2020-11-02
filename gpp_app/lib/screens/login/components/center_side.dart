import 'package:flutter/material.dart';
import 'package:gpp_app/services/login_tap.dart';
import 'package:gpp_app/util/size_config.dart';
import 'package:gpp_app/widgets/custom_text_field.dart';
import 'package:gpp_app/widgets/buttons.dart';

Widget buildCenterSide(BuildContext context) {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pwCtrl = TextEditingController();

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: getBlockSizeHorizontal(10)),
    child: Column(
      children: <Widget>[
        SizedBox(height: getBlockSizeVertical(1)),
        customTextField(
          "이메일",
          "이메일을 입력하세요",
          emailCtrl,
        ),
        SizedBox(height: getBlockSizeVertical(1)),
        customTextField(
          "비밀번호",
          "비밀번호를 입력하세요",
          pwCtrl,
          obscure: true,
        ),
        SizedBox(height: getBlockSizeVertical(1)),
        DefaultButton(
            text: '확인',
            press: () {
              loginTapped(context, emailCtrl.text, pwCtrl.text);
            }),
      ],
    ),
  );
}
