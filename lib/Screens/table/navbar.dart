import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_ui/Screens/table/dropfile.dart';

class TryScreen extends StatefulWidget {
  @override
  State<TryScreen> createState() => _TryScreenState();
}

class _TryScreenState extends State<TryScreen> {
  int index = 0;
  final screens = [
    Center(
        child: Text('Voters Registry',
            style: TextStyle(
              fontSize: 67,
            ))),
    Center(
        child: Text('Incident Report',
            style: TextStyle(
              fontSize: 67,
            ))),
    Center(
        child: Text('Upload',
            style: TextStyle(
              fontSize: 67,
            ))),
    Center(
        child: Text('Settings',
            style: TextStyle(
              fontSize: 67,
            ))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
           border: Border(
      top: BorderSide(width: 0.6, color: Color.fromARGB(255, 212, 212, 212)),
    ),
        ),
        child: NavigationBarTheme(
            data: NavigationBarThemeData(
                indicatorColor: Colors.transparent,
                labelTextStyle: MaterialStateProperty.all(
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
                )),
            child: NavigationBar(
                height: 60,
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: index,
                animationDuration: Duration(milliseconds: 400),
                onDestinationSelected: (index) =>
                    setState(() => this.index = index),
                destinations: [
                  NavigationDestination(
                    icon: FaIcon(
                      FontAwesomeIcons.checkCircle,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    label: 'Vote Registry',
                    selectedIcon: FaIcon(
                      FontAwesomeIcons.solidCheckCircle,
                      color:Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  NavigationDestination(
                    icon: FaIcon(
                      FontAwesomeIcons.flag,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    label: 'Report',
                    selectedIcon: FaIcon(
                      FontAwesomeIcons.solidFlag,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.upload_file,
                      size: 30,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    label: 'Upload',
                    selectedIcon: FaIcon(
                      FontAwesomeIcons.fileUpload,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 30,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    label: 'Settings',
                    selectedIcon: FaIcon(
                      FontAwesomeIcons.cog,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ])
        ),
      ),
    );
  }
}
