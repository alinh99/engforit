// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfilePic extends StatefulWidget {
//   const ProfilePic(
//       {Key key,
//       this.avatarUrl,
//       this.isSaved,
//       this.editingController,
//       this.icon})
//       : super(key: key);
//   final String avatarUrl;
//   final bool isSaved;
//   final TextEditingController editingController;
//   final IconData icon;
//   @override
//   ProfilePicState createState() => ProfilePicState();
// }

// class ProfilePicState extends State<ProfilePic> {
//   static File image;
//   File imageSaved;
//   XFile img;
//   bool isOldImage = true;
//   //connect camera
//   Future updateImageProfile() async {
//     img = await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (img != null) {
//       image = File(img.path);
//     }
//     setState(() {
//       isOldImage = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 115,
//       width: 115,
//       child: Stack(
//         fit: StackFit.expand,
//         clipBehavior: Clip.none,
//         children: [
//           widget.avatarUrl == null
//               ? CircleAvatar(
//                   backgroundColor: Colors.grey,
//                   child: Icon(
//                     Icons.person,
//                     color: Colors.grey[350],
//                     size: 50,
//                   ),
//                 )
//               : widget.avatarUrl != null && isOldImage == true
//                   ? CircleAvatar(
//                       backgroundImage: NetworkImage(widget.avatarUrl),
//                     )
//                   : widget.avatarUrl != null && isOldImage == false
//                       ? CircleAvatar(
//                           backgroundImage: Image.file(image).image,
//                         )
//                       : widget.isSaved == true && widget.avatarUrl != null
//                           ? CircleAvatar(
//                               backgroundImage: NetworkImage(widget.avatarUrl),
//                             )
//                           : null,
//           Positioned(
//             right: -16,
//             bottom: 0,
//             child: SizedBox(
//               height: 46,
//               width: 46,
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                     side: const BorderSide(color: Colors.white),
//                   ),
//                   primary: Colors.white,
//                   backgroundColor: const Color(0xFFF5F6F9),
//                 ),
//                 // onPressed: () async {
//                 //   await updateImageProfile();
//                 // },
//                 onPressed: () {
//                   print('pressed');
//                 },
//                 child: Icon(
//                   widget.icon,
//                   color: const Color(0xFF333333),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
