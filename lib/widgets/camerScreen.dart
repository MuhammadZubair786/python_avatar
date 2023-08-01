import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/constants/global.dart';
import 'package:chatbot_app/controllers/global_controller.dart';
import 'package:chatbot_app/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import '../screens/main_folder/custom_bottom_navigation.dart';

const int maxVideoDuration = 5;

class RecordVideoScreen extends StatefulWidget {
  const RecordVideoScreen({super.key});

  @override
  State<RecordVideoScreen> createState() => _RecordVideoScreenState();
}

class _RecordVideoScreenState extends State<RecordVideoScreen> {
  CameraController? _controller;
  VideoPlayerController? _videoController;
  VoidCallback? _videoPlayerListener;
  bool _isRecording = false;
  String? _videoPath;
  Timer? _timer;
  int _secondsElapsed = 0;

  final globalController = Get.put(GlobalController());

  @override
  void initState() {
    super.initState();

    _initializeCamera();

  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }

      setState(() {});

      _videoController = VideoPlayerController.file(File(_videoPath!))
        ..addListener(_videoPlayerListener = () {
          setState(() {});
        })
        ..setLooping(true)
        ..initialize().then((_) {
          setState(() {});
        });
    });
  }

  void _startRecording() async {
    if (!_controller!.value.isInitialized) {
      return;
    }

    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDocDir.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String? filePath = '$videoDirectory/${DateTime.now().millisecondsSinceEpoch}.mp4';

    try {
      await _controller?.startVideoRecording();
      _timer = Timer.periodic(Duration(seconds: 1), (_) {
        setState(() {
          _secondsElapsed++;
        });
        if (_secondsElapsed >= maxVideoDuration) {
          _stopRecording();
        }
      });
    } on CameraException catch (e) {
      //print(e);
      return;
    }

    setState(() {
      _isRecording = true;
      _videoPath = filePath;
    });
  }

  void _stopRecording() async {
    if (!_controller!.value.isRecordingVideo) {
      return;
    }

    _timer?.cancel();
    _secondsElapsed = 0;

    try {
      await _controller?.stopVideoRecording().then((value) {
        _videoPath = value.path.toString();
      });
    } on CameraException catch (e) {
      //print(e);
      return;
    }

    setState(() {
      _isRecording = false;
    });

    if (_videoController != null) {
      await _videoController?.initialize();
      setState(() {});
    }

    _sendVideo();
  }

  Future<void> _sendVideo() async {
    // globalController.setLoading(true);


//     final request = http.MultipartRequest('POST', Uri.parse('/api/posts'));
//     request.fields.addAll({
//   'fileType': 'video'
// });
//     request.files.add(await http.MultipartFile.fromPath('video', _videoPath!));
//     final response = await request.send();

//     var headers = {'authorization': newToken.toString()};
//     var request = http.MultipartRequest('POST', Uri.parse('${apiGlobal}story/createStory'));

//     request.fields.addAll({'fileType': 'video'});
//     request.files.add(await http.MultipartFile.fromPath('video', _videoPath!));

// // request.files.add(await http.MultipartFile.fromPath('file', '/D:/download.jpeg'));
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       //print(await response.stream.bytesToString());
//     } else {
//       //print(response.reasonPhrase);
//     }
 showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
    var headers = {
      'authorization': newToken.toString(),
    };

  var request = http.MultipartRequest('POST', Uri.parse('https://gymsta-api.jumppace.com:9000/api/v1/story/createStory'));
request.fields.addAll({
  'fileType': 'Video'
});
request.files.add(await http.MultipartFile.fromPath('file', _videoPath!));
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  Get.back();

    Get.snackbar('Story created', "Story created successfully",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          colorText: Colors.black);

          Get.to(()=> CustomBottomNavigation());

  //print(await response.stream.bytesToString());
}
else {
  //print(response.reasonPhrase);
}
  }
  


      // final file = File(_videoPath.toString());
      // request.files.add(await http.MultipartFile.fromPath('file', '${file.path}'));
      // request.fields.addAll({'fileType': 'Video'});
      // //print(file.path);

      // request.headers.addAll(headers);

      // var response = await request.send();

      // var responsed = await http.Response.fromStream(response);

      // final responseData = json.decode(responsed.body);

      // if (response.statusCode == 200) {
      //   globalController.setLoading(false);
      //   responseData;

      //   Get.snackbar('story upload successfully', '');
      // } else {
      //   globalController.setLoading(false);
      //   Get.snackbar('Error', responseData['message'], snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 3), backgroundColor: Colors.white, colorText: Colors.black);
    //   // }
    // } catch (e) {
    //   //print(e.toString());
    // }
  // }


  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.75),
        body: Column(children: <Widget>[
          GetBuilder<GlobalController>(
            builder: (controller) {
              return Expanded(
                  child: Stack(children: <Widget>[
                controller.isLoding
                    ? Center(
                        child: Image.asset(
                          "assets/Slicing/output-onlinegiftools.gif",
                          height: 125.0,
                          color: Colors.orange,
                          width: 125.0,
                        ),
                      )
                    : _controller != null ? CameraPreview(_controller!) : Container(),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: GestureDetector(
                            onLongPress: () {
                              _startRecording();
                            },
                            onLongPressUp: () {
                              _stopRecording();
                            },
                            child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: _isRecording ? Colors.red : Colors.white, border: Border.all(width: 5, color: Colors.red))))))
              ]));
            },
          )
        ]));
  }
}
