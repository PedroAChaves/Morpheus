import 'dart:convert';

import 'package:file_picker/file_picker.dart'; // remove later
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morpheus/shared/themes/app_colors.dart';
import 'package:morpheus/shared/widgets/image_view.dart';

class NicknamePage extends StatefulWidget {
  final String accountAvatarUrl;
  final String accountName;
  final String accountEmail;

  const NicknamePage({
    Key? key,
    required this.accountAvatarUrl,
    required this.accountEmail,
    required this.accountName,
  }) : super(key: key);

  @override
  State<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  @override
  Widget build(BuildContext context) {
    List<String> names = widget.accountName.split(' ');
    final String _initials = names.first.split('')[0] + names.last.split('')[0];
  

    late PlatformFile file;
    String avatarUrl  = widget.accountAvatarUrl;
    String pickImgUrl =
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png";

    _pickAvatarFile() async {
      var result = await FilePicker.platform.pickFiles(withReadStream: true);
      if (result != null) {
        setState(() => file = result.files.single);
      }
    }

    _uploadAvatarFile() async {
      final request = http.MultipartRequest(
        "POST",
        Uri.parse("http://localhost:8080/upload"),
      );

      request.files.add(
        http.MultipartFile(
          "avatar",
          file.readStream as Stream<List<int>>,
          file.size,
          filename: file.name,
        ),
      );

      final response = await request.send();
      var result = jsonDecode(await response.stream.bytesToString());
      setState(() => avatarUrl = result['file_url']);
       imageCache?.clear();
      print(avatarUrl);
    }

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: (){
               Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AvatarView(avatarUrl: avatarUrl);
                          },
                        ),
                      );
          }, onLongPress: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 200.0,
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.all(100),
                    decoration: const BoxDecoration(color: AppColors.light),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () => _pickAvatarFile(),
                          child: const Text("Escolher nova imagem"),
                        ),
                        const Spacer(),
                        Image.network(pickImgUrl, height: 50),
                        const Spacer(),
                        TextButton(
                          onPressed: () => _uploadAvatarFile(),
                          child: const Text("Upload imagem"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }, child: Builder(builder: (BuildContext build) {
            return Hero(
              tag: avatarUrl,
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                foregroundImage: NetworkImage(avatarUrl),
                child: Text(
                  _initials,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
                radius: 45,
              ),
            );
          })),
          Container(
            constraints: const BoxConstraints(maxWidth: 220),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // TODO: add line break for names
              children: [
                Text(
                  widget.accountName,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.accountEmail,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
