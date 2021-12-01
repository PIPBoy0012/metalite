// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'dart:io';

/*Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`

  WidgetsFlutterBinding.ensureInitialized();

  //Getting list of cameras
  final cameras = await availableCameras();

  //Getting the first camera available
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        camera: firstCamera,
      ),
    ),
  );
}*/

// A screen that allows users to take a picture using a given camera.

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initSate() {
    super.initState();
    // To Display current output from camera
    // Create a CameraController

    _controller = CameraController(
      // Get specific camera from list
      widget.camera,

      // Define the resolution to use
      ResolutionPreset.medium,
    );

    //Initializing the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    //Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('take a picture')),
      // You must wait until the controller is initialized before displaying the
      // Camera preview. Use a FutureBuilder to display a loading spinner until the
      // Camera has finished initializing.

      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.

            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an OnPressed callback

        onPressed: () async {
          // Take the picture in a try / catch block. If anything goes wrong,
          // catch the error.

          try {
            // Ensure that the camera is initialized
            await _initializeControllerFuture;

            // Attempt to take picture and get the file image
            // where it was saved

            final image = await _controller.takePicture();

            // If the picture was taken, display it on a new screen

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // The DisplayPictureScreen widget

                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If there is an error, log it in the console
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),

      // The image is stored as a file on the device. Use the 'Image.file'
      // constructor with the given path to display the image.

      body: Image.file(File(imagePath)),
    );
  }
}
