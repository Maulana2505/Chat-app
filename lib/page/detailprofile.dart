// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:io' as io;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/api/user.dart';
import 'package:chat_app/bloc/profileuser/profileuser_bloc.dart';
import 'package:chat_app/bloc/profileuser/profileuser_event.dart';
import 'package:chat_app/bloc/profileuser/profileuser_state.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../repository/token.dart';
import '../repository/url.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({Key? key, required this.statedetail}) : super(key: key);
  final ProfileuserLoadDataState statedetail;
  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  TokenApi? token;
  PlatformFile? file;
  io.File? _displayfile;
  final ImagePicker _picker = ImagePicker();
  userApi userapi = userApi();
  // var url = "http://192.168.100.65:4000";
  var urls = url().uri;
  @override
  void initState() {
    _email.text = widget.statedetail.user!.email;
    _username.text = widget.statedetail.user!.username;
    BlocProvider.of<ProfileuserBloc>(context).state;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DetailProfile oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didU dprof");
    if (widget.statedetail != oldWidget.statedetail) {
      setState(() {});
    }
  }

  void imagechose() async {
    final XFile? pickedfile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedfile != null) {
        _displayfile = io.File(pickedfile.path);
        print(_displayfile);
      } else {
        print('No image selected.');
      }
      Navigator.of(context).pop();
    });
    // FilePickerResult? f = await FilePicker.platform
    //     .pickFiles(type: FileType.image, allowMultiple: false);
    // if (f != null) {
    //   file = f.files.first;
    //   setState(() {
    //     // displayfile = File(file!.path.toString());
    //     _displayfile = File(file!.path.toString());
    //     namefile = File(file!.name);
    //     print(file!);
    //   });
    //   Navigator.of(context).pop();
    // } else {}
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<ProfileuserBloc>()..add(ProfileuserLoadDataEvent());
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        //                     builder: (context) =>
        //                         Navbar()), (route) => false);
        Navigator.of(context).pop();
        print("back");
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<ProfileuserBloc, ProfileuserState>(
          listener: (context, state) {
            if (state is ProfileUpdateDataSuccesState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("update sussec")));
            }
            if (state is ProfileuserErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
          },
          builder: (context, state) {
            return SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  p(widget.statedetail.user!.imgprofile),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  _usernamefield(widget.statedetail.user!.username),
                  SizedBox(
                    height:MediaQuery.of(context).size.height * 0.02,
                  ),
                  _emailfield(widget.statedetail.user!.email),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.5),
                  _btnsave()
                ],
              ),
            ));
          },
        ),
      ),
    );
  }

  Widget p(String? img
      // ,File files
      ) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        _bottomsheet(context);
      },
      child: CircleAvatar(
        backgroundImage: _displayfile != null
            ? FileImage(_displayfile!) as ImageProvider
            : img == null
                ? const NetworkImage(
                    "https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?b=1&k=20&m=1300845620&s=170667a&w=0&h=JbOeyFgAc6-3jmptv6mzXpGcAd_8xqkQa_oUK2viFr8=")
                :
                // NetworkImage("${img}"),
                NetworkImage("$urls/imgprofile/$img"),
        radius: 50,
      ),
    );
  }

  _emailfield(String email) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        readOnly: true,
        onChanged: (value) {},
        controller: _email,
        cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
        decoration: const InputDecoration(
          hintText: "Email",
          contentPadding: EdgeInsets.all(20),
          // fillColor: light ? Colors.black : Colors.white
        ),
      ),
    );
  }

  _usernamefield(String username) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        onChanged: (value) {},
        controller: _username,
        keyboardType: TextInputType.text,
        cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
        decoration: const InputDecoration(
          hintText: "Username",
          contentPadding: EdgeInsets.all(20),
          // fillColor: light ? Colors.black : Colors.white
        ),
      ),
    );
  }

  _btnsave() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () async {
              BlocProvider.of<ProfileuserBloc>(context)
                ..add(ProfileUpdateDataEvent(
                    username: _username.text,img: _displayfile));
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              minimumSize: Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.width * 0.12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 0),
          child: Text(
            'Save',
            style: TextStyle(
              color: Theme.of(context).textTheme.labelLarge!.color,
            ),
          ),
        ),
      ],
    );
  }

  _bottomsheet(BuildContext context) {
    return showModalBottomSheet(
        elevation: 0,
        context: context,
        builder: (context) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // SizedBox(height: Get.width*0.04,),
                      InkWell(
                        radius: 0,
                        onTap: () {
                          imagechose();
                        },
                        child: const Column(
                          children: [Icon(Icons.camera_alt), Text("Camera")],
                        ),
                      ),
                      const Column(
                        children: [Icon(Icons.photo_rounded), Text("Gallery")],
                      ),
                      const Column(
                        children: [Icon(Icons.delete_rounded), Text("delete")],
                      )
                    ],
                  ),
                ],
              ),
            ));
  }
}
