// Dart imports:
import 'dart:typed_data';
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:inshorts_assignment_karan/controller/provider.dart';

// Package imports:
import 'package:provider/provider.dart';


void convertWidgetToImageAndShare(BuildContext context, containerKey) async {

  //TODO:
  // RenderRepaintBoundary renderRepaintBoundary =
  //     containerKey.currentContext.findRenderObject();
  // ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
  // ByteData byteData = await boxImage.toByteData(format: ui.ImageByteFormat.png);
  // Uint8List uInt8List = byteData.buffer.asUint8List();
  // try {
  //   await Share.file(
  //       'imsanjaysoni/InshortClone', 'inshortClone.png', uInt8List, 'image/png',
  //       text:
  //           'This message sent from *inshorts Clone* made by *Sanjay Soni*\nFork this repository on *Github*\n\n https://github.com/imSanjaySoni/Inshorts-Clone.');
  // } catch (e) {
  //   print('error: $e');
  // }
  //
  // Provider.of<FeedProvider>(context, listen: false).setWatermarkVisible(false);
}
