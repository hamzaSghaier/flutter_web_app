// import 'package:flutter/material.dart';
// import 'dart:html' as html;
// import 'dart:typed_data';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http_parser/http_parser.dart';
// import 'package:http/http.dart' as http;

// class FilePickerRegister extends StatefulWidget {
//   final String name;

//   const FilePickerRegister({Key key, this.name}) : super(key: key);
//   @override
//   createState() => FilePickerRegisterState();
// }

// class FilePickerRegisterState extends State<FilePickerRegister> {
//   List<int> _selectedFile;
//   Uint8List _bytesData;
//   GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

//   startWebFilePicker() async {
//     html.InputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.multiple = true;
//     uploadInput.draggable = true;
//     uploadInput.click();

//     uploadInput.onChange.listen((e) {
//       final files = uploadInput.files;
//       final file = files[0];
//       final reader = new html.FileReader();

//       reader.onLoadEnd.listen((e) {
//         _handleResult(reader.result);
//       });
//       reader.readAsDataUrl(file);
//     });
//   }

//   void _handleResult(Object result) {
//     setState(() {
//       _bytesData = Base64Decoder().convert(result.toString().split(",").last);
//       _selectedFile = _bytesData;
//     });
//   }

//   List<int> getPath() {
//     return _selectedFile;
//   }

//   // Future<String> makeRequest() async {
//   //   var url = Uri.parse("http://192.168.23.10/upload_api/web/app_dev.php/api/save-file/");
//   //   var request = new http.MultipartRequest("POST", url);
//   //   request.files.add(
//   //       await http.MultipartFile.fromBytes('file', _selectedFile, contentType: new MediaType('application', 'octet-stream'), filename: widget.name));

//   //   request.send().then((response) {
//   //     print("test");
//   //     print(response.statusCode);
//   //     if (response.statusCode == 200) print("Uploaded!");
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build

//     return SafeArea(
//       child: Container(
//         child: new Form(
//           autovalidate: true,
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 16.0, left: 28),
//             child: new Container(
//                 width: 350,
//                 child: Column(children: <Widget>[
//                   Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
//                     MaterialButton(
//                       color: Colors.pink,
//                       elevation: 8,
//                       highlightElevation: 2,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                       textColor: Colors.white,
//                       child: Text('Select a file'),
//                       onPressed: () {
//                         startWebFilePicker();
//                       },
//                     ),
//                     Divider(
//                       color: Colors.teal,
//                     ),
//                     RaisedButton(
//                       color: Colors.purple,
//                       elevation: 8.0,
//                       textColor: Colors.white,
//                       onPressed: () {
//                         //makeRequest();
//                       },
//                       child: Text('Send file to server'),
//                     ),
//                   ])
//                 ])),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FilePickerRegister extends StatefulWidget {
  final String name;

  const FilePickerRegister({Key key, this.name}) : super(key: key);
  @override
  FilePickerRegisterState createState() => FilePickerRegisterState();
}

class FilePickerRegisterState extends State<FilePickerRegister> {
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
    print(_paths);
    print(_paths.elementAt(0));
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
    return Center(
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
                color: Colors.white.withOpacity(0.8),
              ),
              width: 800,
              height: 70,
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white.withOpacity(0.5), // background
                        onPrimary: Colors.black,
                        minimumSize: Size(300, 80) // foreground
                        ),
                    onPressed: () => _openFileExplorer(),
                    child: Row(
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.file_upload,
                          color: Colors.blue.shade900,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Center(
                    child: Text(
                      _paths != null && _paths.isNotEmpty ? "  fichier : " + _fileName ?? "..." + "${_paths.elementAt(0)}" : 'Aucun fichier choisi',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
