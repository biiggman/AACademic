import 'package:aacademic/camera/camera_page.dart';
import 'package:aacademic/ui/login_page.dart';
import 'package:aacademic/ui/settings_page.dart';
import 'package:aacademic/utils/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aacademic/firebase/firebase_options.dart';
import 'package:aacademic/utils/imageboard_utils.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Material App Constructor
      title: 'AACademic',

      initialRoute: '/', //Route logic for navigation

      routes: {
        '/login': (context) => const LoginPage(),
        '/settings': (context) => const SettingsPage(),
      },

      theme: MyThemes.lightTheme,

      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  //dummy variables
  Color colorVariable = Colors.blue;
  String imageURLTest = '';
  String buttonTestTitle = '';
  String buttonName = "";
  ButtonUtils buttonUtils = ButtonUtils();

  //keys here
  final navKey = GlobalKey();
  final _addButtonKey = GlobalKey<FormState>();
  final _sourceImageKey = GlobalKey();
  final _buttonColorKey = GlobalKey();

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;

      case 1:
        break;

      case 2:
        {
          ImageboardUtils imageboardUtils = ImageboardUtils();
          Color buttonColor = Colors.red;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Add a Button'),
                  content: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _addButtonKey,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                constraints: const BoxConstraints(
                                    minHeight: 100, minWidth: 100),
                                fillColor: buttonColor,
                                padding: const EdgeInsets.all(3.0),
                                shape: const CircleBorder(),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.emoji_emotions),
                                      SizedBox(height: 5),
                                      Text('My Button')
                                    ]),
                              ),
                            ),
                            Flexible(
                                flex: 4,
                                fit: FlexFit.tight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Button Name',
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            buttonName = value;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter a name.";
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      const Text('Picture: '),
                                      ButtonBar(
                                        key: _sourceImageKey,
                                        alignment: MainAxisAlignment.center,
                                        buttonPadding:
                                            const EdgeInsets.all(10.0),
                                        buttonAlignedDropdown: true,
                                        children: <Widget>[
                                          ElevatedButton(
                                              onPressed: () {
                                                imageboardUtils.chooseImage();
                                              },
                                              child: const Text('Camera Roll'))
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      const Text('Button Color: '),
                                      ButtonBar(
                                        key: _buttonColorKey,
                                        alignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        buttonHeight: 1.5,
                                        buttonMinWidth: 1.5,
                                        buttonPadding:
                                            const EdgeInsets.all(5.0),
                                        buttonAlignedDropdown: true,
                                        children: <Widget>[
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                buttonColor = Colors.red;
                                              });
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.red,
                                            padding: const EdgeInsets.all(3.0),
                                            shape: const CircleBorder(),
                                          ),
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                buttonColor = Colors.orange;
                                              });
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.orange,
                                            padding: const EdgeInsets.all(3.0),
                                            shape: const CircleBorder(),
                                          ),
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                buttonColor = Colors.yellow;
                                              });
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.yellow,
                                            padding: const EdgeInsets.all(3.0),
                                            shape: const CircleBorder(),
                                          ),
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                buttonColor = Colors.green;
                                              });
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.green,
                                            padding: const EdgeInsets.all(3.0),
                                            shape: const CircleBorder(),
                                          ),
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                buttonColor = Colors.blue;
                                              });
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.blue,
                                            padding: const EdgeInsets.all(3.0),
                                            shape: const CircleBorder(),
                                          ),
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                buttonColor = Colors.purple;
                                              });
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.purple,
                                            padding: const EdgeInsets.all(3.0),
                                            shape: const CircleBorder(),
                                          ),
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                buttonColor = Colors.white;
                                              });
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.white,
                                            padding: const EdgeInsets.all(3.0),
                                            shape: const CircleBorder(),
                                          ),
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                buttonColor = Colors.black;
                                              });
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.black,
                                            padding: const EdgeInsets.all(3.0),
                                            shape: const CircleBorder(),
                                          ),
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                buttonColor = Colors.grey;
                                              });
                                            },
                                            elevation: 2.0,
                                            fillColor: Colors.grey,
                                            padding: const EdgeInsets.all(3.0),
                                            shape: const CircleBorder(),
                                          ),
                                        ],
                                      ),
                                      ButtonBar(
                                          alignment: MainAxisAlignment.center,
                                          buttonPadding:
                                              const EdgeInsets.all(10.0),
                                          buttonAlignedDropdown: true,
                                          children: <Widget>[
                                            ElevatedButton(
                                              onPressed: () {
                                                imageboardUtils.uploadImage(
                                                    buttonName, buttonColor);
                                                Navigator.of(context)
                                                    .pushNamed('/');
                                              },
                                              child: const Text('Add to '),
                                            ),
                                          ]),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                );
              });
        }
        break;

      case 3:
        {
          await availableCameras().then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
        }
        break;

      case 4:
        Navigator.of(context).pushNamed('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
            future: buttonUtils.makeButtons(),
            builder: (BuildContext context,
                AsyncSnapshot<List<RawMaterialButton>> imageboardRef) {
              if (imageboardRef.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (imageboardRef.hasError) {
                return Text('Error: ${imageboardRef.error}');
              } else {
                return GridView.count(
                  crossAxisCount: 3,
                  children: imageboardRef.data!,
                );
              }
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        key: navKey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard),
            label: 'Keyboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

class imageboardButton extends RawMaterialButton {
  final String label;
  final String imageUrl;

  const imageboardButton(
      {required this.label, required this.imageUrl, required super.onPressed});
}

class imageboardModel extends ChangeNotifier {
  final List<imageboardButton> _buttonList = [];

  List<imageboardButton> get buttonList => _buttonList;

  addImageboardButton(imageboardButton buttonArg) {
    _buttonList.add(buttonArg);
    notifyListeners();
  }
}
