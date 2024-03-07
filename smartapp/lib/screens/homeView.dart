// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smartapp/widgets/smart-device-box.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final double horizontalPadding = 20;
  final double verticalPadding = 25;

  // ignore: non_constant_identifier_names
  List SmartDevices = [
    ["Smart Ligh", "lib/icons/light-bulb.png", true],
    ["Smart Ac", "lib/icons/air-conditioner.png", false],
    ["Smart Tv", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false]
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      SmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: const Center(child: Text("SmartHome" ,style: TextStyle(color: Color.fromARGB(255, 14, 0, 0) , fontSize: 30),)),
        actions: const [Icon(Icons.settings_sharp , color: Color.fromARGB(255, 0, 0, 0)), Padding(padding: EdgeInsets.all(10))],
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'lib/icons/menu.png',
                  height: 45,
                  color: Colors.grey[800],
                ),
                Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Smart Home App"),
                Text("Developed By Hammad Irfan"),
                Text(
                  "Smart Home",
                  style: TextStyle(fontSize: 40),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  smartDeviceName: SmartDevices[index][0],
                  iconPath: SmartDevices[index][1],
                  powerOn: SmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value , index),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
