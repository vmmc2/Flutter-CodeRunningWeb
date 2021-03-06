import 'dart:async';

import 'package:code_running_front/business/user/dashboard/modules/profile/get/credits/bloc.dart';
import 'package:code_running_front/business/user/models/request/req_get_credits_entity.dart';
import 'package:code_running_front/business/user/models/request/req_get_profile_entity.dart';
import 'package:code_running_front/common/base/page_state.dart';
import 'package:code_running_front/res/styles.dart';
import 'package:code_running_front/router/my_router.gr.dart';
import 'package:code_running_front/ui/image_load_view.dart';
import 'package:code_running_front/ui/nav_util.dart';
import 'package:code_running_front/utils/enum.dart';
import 'package:code_running_front/utils/user_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'modules/profile/get/credits/get_credits_bloc.dart';
import 'modules/profile/get/profile/bloc.dart';

class UserDashBoard extends StatefulWidget {
  UserDashBoard({Key key}) : super(key: key);

  @override
  UserDashBoardState createState() => UserDashBoardState();
}

class UserDashBoardState extends BaseLoadingPageState<UserDashBoard> {
  GetProfileBloc _getProfileBloc;
  GetCreditsBloc _getCreditsBloc;

  GetProfileBloc get getProfileBloc => _getProfileBloc;

  @override
  void initState() {
    super.initState();
    _getProfileBloc = GetProfileBloc();
    _getCreditsBloc = GetCreditsBloc();
    _getProfileBloc
        ?.add(InGetProfileEvent(ReqGetProfileEntity()
      ..id = getUserInfo().id));
    _getCreditsBloc.add(InGetCreditsEvent(ReqGetCreditsEntity()));
  }

  @override
  void dispose() {
    debugPrint("dispose dashboard");
    _getProfileBloc?.close();
    _getCreditsBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("主界面"),
        actions: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Text("你好 " + getUserInfo().username)),
          FlatButton.icon(
              onPressed: handleExit,
              icon: FaIcon(FontAwesomeIcons.doorOpen),
              label: Text(
                "退出登录",
                style: TextStyles.textWhite14,
              ))
        ],
      ),
      body: Container(
          child: Stack(
            children: <Widget>[
              ImageLoadView(
                "images/background/02.jpg",
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                placeholder: "images/placeholders/black.jpg",
                imageType: ImageType.assets,
              ),
              buildContent()
            ],
          )),
    );
  }

  void handleExit() {
    showSuccess(msg: "您已退出");
    Timer(Duration(seconds: 2), () => logOut());
  }

  @override
  void preparedPage() {
    // TODO: implement preparedPage
  }

  /// 菜单，左侧为功能菜单，右侧为动态
  Widget buildContent() =>
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Row(
          children: <Widget>[Expanded(child: buildMenu()), buildMoments()],
        ),
      );

  Widget buildMenu() =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.vertical,
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            GestureDetector(
                onTap: () => {handleEditorOpen(context)},
                child: buildMenuBtn(
                    FaIcon(
                      FontAwesomeIcons.code,
                      size: 25,
                      color: Colors.white,
                    ),
                    "我的编辑器",
                    "开始创作")),
            GestureDetector(
              onTap: () => {handleRepositoryOpen(context)},
              child: buildMenuBtn(
                  FaIcon(
                    FontAwesomeIcons.cloud,
                    size: 25,
                    color: Colors.white,
                  ),
                  "我的码库",
                  "代码历史"),
            ),
            GestureDetector(
              onTap: () => {handleGroundOpen(context)},
              child: buildMenuBtn(
                  FaIcon(
                    FontAwesomeIcons.warehouse,
                    size: 25,
                    color: Colors.white,
                  ),
                  "论坛广场",
                  "发现你的所见所闻"),
            ),
            GestureDetector(
              onTap: () => {handleMallOpen(context)},
              child: buildMenuBtn(
                  FaIcon(
                    FontAwesomeIcons.shoppingCart,
                    size: 25,
                    color: Colors.white,
                  ),
                  "社区点点通",
                  "知识带回家"),
            ),
            GestureDetector(
              onTap: () => {handleCartOpen(context)},
              child: buildMenuBtn(
                  FaIcon(
                    FontAwesomeIcons.shoppingCart,
                    size: 25,
                    color: Colors.white,
                  ),
                  "我的购物车",
                  "我的知识宝库"),
            ),
            GestureDetector(
              onTap: () => {handleHomeOpen(context)},
              child: buildMenuBtn(
                  FaIcon(
                    FontAwesomeIcons.cogs,
                    size: 25,
                    color: Colors.white,
                  ),
                  "个人主页",
                  "购买的项目、资料设置"),
            )
          ],
        ),
      );

  /// 动态
  Widget buildMoments() {
    var info = getUserInfo();
    return Column(
      children: <Widget>[
        //时间面板
        FlutterAnalogClock(
          dateTime: DateTime.now(),
          dialPlateColor: Colors.white,
          hourHandColor: Colors.black,
          minuteHandColor: Colors.black,
          secondHandColor: Colors.black,
          numberColor: Colors.black,
          borderColor: Colors.black,
          tickColor: Colors.black,
          centerPointColor: Colors.black,
          showBorder: true,
          showTicks: true,
          showMinuteHand: true,
          showSecondHand: true,
          showNumber: true,
          borderWidth: 8.0,
          hourNumberScale: .10,
          hourNumbers: [
            'I',
            'II',
            'III',
            'IV',
            'V',
            'VI',
            'VII',
            'VIII',
            'IX',
            'X',
            'XI',
            'XII'
          ],
          isLive: true,
          width: 250,
          height: 250,
        ),
        Gaps.vGap(16.0),
        Card(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BlocBuilder(
                  bloc: _getProfileBloc,
                  builder: (BuildContext context, state) {
                    if (state is GetProfileedState) {
                      return Container(
                        alignment: Alignment.center,
                        child: ImageLoadView(
                          state.entity.data.avatarUrl,
                          height: 75,
                          width: 75,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: 0,
                      );
                    }
                  },
                ),
                Gaps.vGap(8.0),
                BlocBuilder(
                  bloc: _getProfileBloc,
                  builder: (BuildContext context, state) {
                    if (state is GetProfileedState) {
                      return Text(
                        "ID:${state.entity.data.username}",
                        style: TextStyles.textDark14,
                        textAlign: TextAlign.start,
                      );
                    } else {
                      return SizedBox(
                        width: 0,
                      );
                    }
                  },
                ),
                Gaps.vGap(8.0),
                BlocBuilder(
                  bloc: _getProfileBloc,
                  builder: (BuildContext context, state) {
                    if (state is GetProfileedState) {
                      return Text("昵称:${state.entity.data.nickname}",
                          style: TextStyles.textDark14,
                          textAlign: TextAlign.start);
                    } else {
                      return SizedBox(
                        width: 0,
                      );
                    }
                  },
                ),
                Gaps.vGap(8.0),
                BlocBuilder(
                  bloc: _getCreditsBloc,
                  builder: (BuildContext context, state) {
                    if (state is GetCreditsedState) {
                      return Text("积分:${state.entity.data.credits}",
                          style: TextStyles.textDark14,
                          textAlign: TextAlign.start);
                    } else {
                      return SizedBox(
                        width: 0,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildMenuBtn(Widget img, String text, String subtext,
      {Function() onclick}) =>
      Card(
        elevation: 10,
        shape: RoundedRectangleBorder(),
        color: Color(0x50000000),
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 25,
                alignment: Alignment.center,
                child: img,
              ),
              Gaps.vGap(8),
              Text(
                text,
                style: TextStyles.textWhite16,
                textAlign: TextAlign.center,
              ),
              Gaps.vGap(8),
              Text(subtext,
                  style: TextStyles.textWhite14, textAlign: TextAlign.center)
            ],
          ),
        ),
      );

  void handleEditorOpen(context) {
    NavUtil.navigator().pushNamed(Routes.codePage);
  }

  handleRepositoryOpen(BuildContext context) {
    NavUtil.navigator().pushNamed(Routes.userRepositoryPage);
  }

  handleGroundOpen(BuildContext context) {
    NavUtil.navigator().pushNamed(Routes.threadGroundPage).then((value) =>
        _getCreditsBloc.add(InGetCreditsEvent(ReqGetCreditsEntity())));
  }

  handleMallOpen(BuildContext context) {
    NavUtil.navigator().pushNamed(Routes.mallPage);
  }

  handleCartOpen(BuildContext context) {
    NavUtil.navigator()
        .pushNamed(Routes.cartPage,
        arguments: CartPageArguments(getCreditsBloc: _getCreditsBloc))
        .then((value) =>
        _getCreditsBloc.add(InGetCreditsEvent(ReqGetCreditsEntity())));
  }

  handleHomeOpen(BuildContext context) {
    NavUtil.navigator().pushNamed(Routes.homePage,
        arguments: HomePageArguments(pBloc: _getProfileBloc)).then((value) =>
        _getProfileBloc
            ?.add(InGetProfileEvent(ReqGetProfileEntity()
          ..id = getUserInfo().id)));
  }
}
