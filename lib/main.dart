import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2x2 Rubik\'s Cube',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CubeScreen(),
    );
  }
}

class CubeState {
  List<List<Color>> faces = [
    [Colors.red, Colors.red, Colors.red, Colors.red], // Front
    [Colors.blue, Colors.blue, Colors.blue, Colors.blue], // Left
    [Colors.green, Colors.green, Colors.green, Colors.green], // Right
    [Colors.yellow, Colors.yellow, Colors.yellow, Colors.yellow], // Back
    [Colors.orange, Colors.orange, Colors.orange, Colors.orange], // Top
    [Colors.white, Colors.white, Colors.white, Colors.white], // Bottom
  ];

  void rotateFaceClockwise(int faceIndex) {
    List<Color> temp = [...faces[faceIndex]];
    faces[faceIndex] = [temp[2], temp[0], temp[3], temp[1]];
  }

  void rotateTop() {
    rotateFaceClockwise(4);
    List<Color> temp = [faces[0][0], faces[0][1]];
    faces[0][0] = faces[1][0]; faces[0][1] = faces[1][1];
    faces[1][0] = faces[3][2]; faces[1][1] = faces[3][3];
    faces[3][2] = faces[2][0]; faces[3][3] = faces[2][1];
    faces[2][0] = temp[0]; faces[2][1] = temp[1];
  }

  void rotateBottom() {
    rotateFaceClockwise(5);
    List<Color> temp = [faces[0][2], faces[0][3]];
    faces[0][2] = faces[2][2]; faces[0][3] = faces[2][3];
    faces[2][2] = faces[3][0]; faces[2][3] = faces[3][1];
    faces[3][0] = faces[1][2]; faces[3][1] = faces[1][3];
    faces[1][2] = temp[0]; faces[1][3] = temp[1];
  }
}

class CubeScreen extends StatefulWidget {
  const CubeScreen({Key? key}) : super(key: key);

  @override
  _CubeScreenState createState() => _CubeScreenState();
}

class _CubeScreenState extends State<CubeScreen> {
  CubeState cube = CubeState();

  void rotateTop() {
    setState(() => cube.rotateTop());
  }

  void rotateBottom() {
    setState(() => cube.rotateBottom());
  }

  Widget buildFace(List<Color> faceColors) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => Container(color: faceColors[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2x2 Rubik\'s Cube')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              const Text('Top'),
              SizedBox(height: 100, width: 100, child: buildFace(cube.faces[4]))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                const Text('Left'),
                SizedBox(height: 100, width: 100, child: buildFace(cube.faces[1]))
              ]),
              SizedBox(height: 100, width: 100, child: buildFace(cube.faces[0])),
              Column(children: [
                const Text('Right'),
                SizedBox(height: 100, width: 100, child: buildFace(cube.faces[2]))
              ])
            ]),
            Column(children: [
              const Text('Bottom'),
              SizedBox(height: 100, width: 100, child: buildFace(cube.faces[5]))
            ]),
            Column(children: [
              const Text('Back'),
              SizedBox(height: 100, width: 100, child: buildFace(cube.faces[3]))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(onPressed: rotateTop, child: const Text('Rotate Top')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: rotateBottom, child: const Text('Rotate Bottom'))
            ])
          ],
        ),
      ),
    );
  }
}
