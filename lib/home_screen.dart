import 'package:findzipcode/find_zip_screen.dart';
import 'package:findzipcode/zip_code.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _zoneCodeTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _address2TextController = TextEditingController();
  final _bnameTextController = TextEditingController();

  @override
  void dispose() {
    _zoneCodeTextController.dispose();
    _addressTextController.dispose();
    _address2TextController.dispose();
    _bnameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('우편번호 검색'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _zoneCodeTextController,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  ZipCode zipCode = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FindZipScreen()),
                  );
                  _zoneCodeTextController.text = zipCode.zonecode;
                  _address2TextController.text = zipCode.roadAddress;
                  _bnameTextController.text = zipCode.bname;
                },
                child: const Text('우편번호 찾기'),
              ),
            ],
          ),
          TextField(
            controller: _address2TextController,
          ),
          Row(
            children: [
              Expanded(child: TextField()),
              SizedBox(width: 20),
              Expanded(
                  child: TextField(
                controller: _bnameTextController,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
