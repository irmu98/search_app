import 'package:flutter/material.dart';

class SearchImageScreen extends StatelessWidget {
  const SearchImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이미지 검색 앱', style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
    );
  }
}
