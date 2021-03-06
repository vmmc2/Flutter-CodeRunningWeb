import 'package:code_running_front/business/user/models/request/req_get_thread_comment_entity.dart';
import 'package:code_running_front/business/user/models/request/req_thread_comment_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_get_thread_comment_entity.dart';
import 'package:code_running_front/business/user/models/response/resp_get_threads_entity.dart';
import 'package:code_running_front/common/base/page_state.dart';
import 'package:code_running_front/res/styles.dart';
import 'package:code_running_front/ui/nav_util.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:load/load.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'get/bloc.dart';
import 'post/bloc.dart';

class ThreadPage extends StatefulWidget {
  final RespGetThreadsData data;

  const ThreadPage({Key key, this.data}) : super(key: key);

  @override
  _ThreadPageState createState() => _ThreadPageState();
}

class _ThreadPageState extends BaseLoadingPageState<ThreadPage> {
  GetThreadCommentBloc _bloc;
  PostThreadCommentBloc _pbloc;

  var page = 0;

  var _refreshController = RefreshController();

  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _bloc = GetThreadCommentBloc();
    _bloc.add(InGetThreadCommentEvent(ReqGetThreadCommentEntity()
      ..threadId = widget.data.id
      ..page = page));

    _pbloc = PostThreadCommentBloc();

    _bloc.listen((state) {
      if (state is GetThreadCommentedState) {
        _refreshController.refreshCompleted();
        _refreshController.loadComplete();
      } else if (state is InPostThreadCommentState) {
        showLoadingDialog();
      } else {
        _refreshController.refreshFailed();
        _refreshController.loadFailed();
        hideLoadingDialog();
      }
    });
    _pbloc.listen((state) {
      if (state is PostThreadCommentedState) {
        showSuccess(msg: "评论成功！");
        page = 0;
        _bloc?.add(InGetThreadCommentEvent(ReqGetThreadCommentEntity()
          ..threadId = widget.data.id
          ..page = page));
      } else if (state is InPostThreadCommentState) {
        showLoadingDialog();
      } else {
        hideLoadingDialog();
      }
    });
  }

  @override
  void dispose() {
    _bloc?.close();
    _pbloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动态详情"),
      ),
      body: SmartRefresher(
        scrollController: _scrollController,
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: () => {
          page = 0,
          _bloc?.add(InGetThreadCommentEvent(ReqGetThreadCommentEntity()
            ..threadId = widget.data.id
            ..page = page))
        },
        onLoading: () => {
          page += 1,
          _bloc?.add(InGetThreadCommentEvent(ReqGetThreadCommentEntity()
            ..threadId = widget.data.id
            ..page = page))
        },
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              buildThreadListItem(widget.data),
              Expanded(
                child: BlocBuilder(
                  bloc: _bloc,
                  builder: (BuildContext context, state) {
                    switch (state.runtimeType) {
                      case GetThreadCommentedState:
                        hideLoadingDialog();
                        return ListView.builder(
                          controller: _scrollController,
                          itemBuilder: (context, index) =>
                              buildCommentItem(state.entity.data[index]),
                          itemCount: state.entity.data.length,
                        );
                      default:
                        if (state is InGetThreadCommentEvent) {
                          showLoadingDialog();
                        }
                        return SizedBox(
                          key: Key("assets/animations/status/loading.flr"),
                          child: new FlareActor(
                            "assets/animations/status/loading.flr",
                            animation: "spin2",
                          ),
                          width: 75,
                          height: 75,
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handlePostComment,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildThreadListItem(RespGetThreadsData data) {
    return Container(
      key: ValueKey(data.id),
      margin: EdgeInsets.all(16),
      child: Card(
        key: ValueKey(data.id),
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '#${data.id}',
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
              Gaps.vGap(16),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    data.title,
                    style: TextStyle(fontSize: 20),
                  )),
                  Gaps.hGap(4),
                  Text(
                    data.username,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Gaps.vGap(16),
              Row(
                children: <Widget>[
                  Text(
                    data.subtitle,
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCommentItem(RespGetThreadCommentData data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    data.username,
                    style: TextStyle(fontSize: 16),
                  ),
                  Gaps.hGap(8.0),
                  Text(
                    DateTime.fromMillisecondsSinceEpoch(
                            data.createDate.toInt() * 1000)
                        .toLocal()
                        .toString(),
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Gaps.vGap(16),
              Row(
                children: <Widget>[
                  Text(
                    data.content,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String comment = "";

  void handlePostComment() {
    showDialog(
        barrierDismissible: true,
        context: context,
        child: Material(
          type: MaterialType.transparency, //透明类型
          child: Center(
            child: Container(
              width: 600,
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: TextEditingController(),
                            decoration: InputDecoration(
                                icon: Icon(Icons.comment), hintText: "评论内容..."),
                            onChanged: (s) {
                              setState(() {
                                comment = s;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Gaps.vGap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => NavUtil.navigator().pop(),
                        child: Text(
                          "取消",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FlatButton(
                        onPressed: () => handleComment(),
                        child: Text(
                          "评论",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void preparedPage() {
    // TODO: implement preparedPage
  }

  handleComment() {
    NavUtil.navigator().pop();
    if (comment == "") {
      showError(msg: "评论内容不能为空");
      return;
    }
    _pbloc.add(InPostThreadCommentEvent(ReqThreadCommentEntity()
      ..threadId = widget.data.id
      ..content = comment));
  }
}
