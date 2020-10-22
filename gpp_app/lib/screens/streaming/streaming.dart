import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpp_app/models/json/ppcam_model.dart';
import 'package:gpp_app/models/network/dio_client.dart';
import 'package:gpp_app/models/provider/user_profile.dart';
import 'package:gpp_app/screens/streaming/components/custom_circular_menu.dart';
import 'package:gpp_app/services/get_ppcam.dart';
import 'package:gpp_app/util/my_logger.dart';
import 'package:gpp_app/widgets/streaming/custom_vlc_controller.dart';
import 'package:gpp_app/widgets/streaming/live_video.dart';
import 'package:provider/provider.dart';

class StreamingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StreamingScreenState();
}

class _StreamingScreenState extends State<StreamingScreen> {
  Future<PpcamModel> _ppcamModel;
  CustomVlcPlayerController _controller;
  int userId;
  String ppcamUrl;

  @override
  void initState() {
    // GET ppcam profile
    this.userId = Provider.of<UserProfile>(context, listen: false).id;
    _ppcamModel = getPpcam(
      context,
      DioClient.serverUrl + 'user/' + userId.toString() + '/ppcam',
    );
    // init controller
    _controller = CustomVlcPlayerController(
      onInit: () {
        _controller.play();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // set Landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return SafeArea(
      child: Scaffold(
        primary: true,
        floatingActionButton: CustomCircularMenu(_controller),
        body: FutureBuilder(
          future: _ppcamModel,
          builder: (BuildContext context, AsyncSnapshot<PpcamModel> snapshot) {
            Widget child;
            // Future complete with data
            if (snapshot.hasData) {
              // child = _getCardBody(snapshot.data);
              MyLogger.debug('${snapshot.data}');
              // Set url in ppcam profile
              ppcamUrl =
                  'http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_normal.mp4';
              // ppcamUrl = 'http://beachreachpeach.iptime.org:9981';
              // ppcamUrl = snapshot.data.ipAddress;
              child = SizedBox(
                width: double.infinity,
                child: LiveVideo(ppcamUrl, _controller),
              );
              // Future complete with error
            } else if (snapshot.hasError) {
              DioError error = snapshot.error;
              if (error.response != null && error.response.statusCode == 404) {
                child = Center(
                  child: Text('사용하는 푸피캠을 연결해주세요'),
                );
                // Unknown error
              } else {
                child = Center(
                  child: Text('푸피캠 정보를 불러오는 중 오류가 발생했습니다'),
                );
              }
              // Future incomplete
            } else {
              child = Center(child: CircularProgressIndicator());
            }
            return child;
          },
        ),
      ),
    );
  }
}
