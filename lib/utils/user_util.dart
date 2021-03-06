import 'dart:convert';

import 'package:code_running_front/business/user/models/response/resp_login_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_register_entity.dart';
import 'package:code_running_front/generated/json/resp_login_entity_helper.dart';
import 'package:code_running_front/router/my_router.gr.dart';
import 'package:code_running_front/ui/nav_util.dart';
import 'package:code_running_front/utils/sharedpreference_util.dart';

void popToUserIndex() {
  NavUtil.navigator()
      .pushNamedAndRemoveUntil(Routes.indexRoute, (route) => false);
}

String getStoredToken() {
    String token = getUserInfo()?.token;
    if (token == null) {
      // 退出
      popToUserIndex();
      return "";
    } else {
      return token;
    }
}

Future<void> saveUserLoginData(RespLoginData data) async {
  await sp().setString("user", json.encode(data.toJson()));
}

Future<void> saveUserRegisterData(RespRegisterData data) async {
  await sp().setString("user", json.encode(data.toJson()));
}

Future<void> removeUserData() async {
  await sp().remove("user");
}

RespLoginData getUserInfo() {
  String jsonStr = sp().getString("user");
  return jsonStr != null
      ? respLoginDataFromJson(RespLoginData(), json.decode(jsonStr))
      : null;
}

