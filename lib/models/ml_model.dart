import 'package:tflite/tflite.dart';

class MLModel {
  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<List?> runModel(dynamic inputData) async {
    return await Tflite.runModelOnBinary(
      binary: inputData,
      numResults: 2,
    );
  }

  void dispose() {
    Tflite.close();
  }
}
