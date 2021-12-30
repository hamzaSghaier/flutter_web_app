import 'dart:convert';

import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilePickerDemo extends StatefulWidget {
  final String title;
  final bool odd;

  const FilePickerDemo({Key key, this.title, this.odd}) : super(key: key);
  @override
  FilePickerDemoState createState() => FilePickerDemoState();
}

class FilePickerDemoState extends State<FilePickerDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  List<PlatformFile> _paths;
  String directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<int> getPath() {
    print(_paths);
    print(_paths.elementAt(0));
    // Uint8List uploadfile = result.files.single.bytes;

    if (_paths != null && _paths.isNotEmpty) {
      print("byyyteeess ${_paths.elementAt(0).bytes.toString()}");
      final List<int> bytesData = Base64Decoder().convert(_paths.elementAt(0).bytes.toString().split(",").last);
      print("byyytestete ${bytesData}");

      return bytesData;
    } else
      return null;
  }

  PlatformFile getFile() {
    //print(_paths);
    // print(_paths.elementAt(0));
    // Uint8List uploadfile = result.files.single.bytes;

    if (_paths != null && _paths.isNotEmpty) {
      return _paths.elementAt(0);
    } else
      return null;
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        // withReadStream: true,
        withData: true,
        withReadStream: true,
        type: _pickingType,
        allowMultiple: _multiPick,
        // allowedExtensions: (_extension?.isNotEmpty ?? false) ? _extension?.replaceAll(' ', '').split(',') : null,
      ))
          ?.files;
      print("ppppp ${_paths.elementAt(0).toString()}");
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      print(_paths.first.extension);
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result ? Colors.green : Colors.red,
          content: Text((result ? 'Temporary files removed with success.' : 'Failed to clean temporary files')),
        ),
      );
    });
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
      setState(() => directoryPath = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 200, right: 200, top: 20, bottom: 20),
      color: widget.odd ? Colors.blueGrey.withOpacity(0.2) : Colors.blue.withOpacity(0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: widget.title,
            size: 23,
            weight: FontWeight.bold,
            color: Colors.black,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: Colors.lightBlue.withOpacity(0.8),
                    ),
                    width: 800,
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue.withOpacity(0.5), // background
                              onPrimary: Colors.black,
                              minimumSize: Size(300, 80) // foreground
                              ),
                          onPressed: () => _openFileExplorer(),
                          child: Row(
                            children: [
                              Text(
                                " Choisir un fichier",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.file_upload,
                                color: Colors.yellow,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: SizedBox(
                            width: 400,
                            child: Text(
                              _paths != null && _paths.isNotEmpty ? _fileName ?? "..." + "${_paths.elementAt(0)}" : 'Aucun fichier choisi',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
