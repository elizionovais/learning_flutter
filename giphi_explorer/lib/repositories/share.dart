import 'package:flutter_share/flutter_share.dart';

class ShareLink{
  Future<void> share(String link) async {
    await FlutterShare.share(
        title: 'Compartilhar Gif',
        text: 'Compartilhe com quem desejar essa gif...',
        linkUrl: link,
        chooserTitle: null);
  }
 
}