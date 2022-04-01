import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/widget/loading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_ui/api.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../data/globalScaff.dart';

class VoteScreen extends StatefulWidget {
  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  String? elpos;
  String? authtoken;
  final _storage = FlutterSecureStorage();
  String region = "";
  String province = "";
  String code = "";
  String no = "";
  String municipality = "";
  String place = "";
  dynamic regvotes = "";
  String barangay = "";
  String error = "";

  final _formKey = GlobalKey<FormState>();

  bool _show = false;

  bool loading = false;

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  final precintController = TextEditingController();

  Future getData(value) async {
    var rsp = await fetchPrecint(value);

    if (rsp['data'] != null) {
      var data = new Map<String, dynamic>.from(rsp['data']);
      setState(() {
        _show = true;
        error = '';
        region = data['region'];
        code = data['precint_code'];
        province = data['province'];
        no = data['precint_no'];
        municipality = data['municipality'];
        place = data['pollplace'];
        regvotes = data['regvoters'];
        barangay = data['barangay'];
      });
    } else {
      setState(() {
        _show = false;
        error = rsp['message'];
        region = '';
        code = '';
        province = '';
        no = '';
        municipality = '';
        place = '';
        regvotes = '';
        barangay = '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(23, 21, 113, 1),
              title: Text('QuickCount'),
            ),

            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(30, 100, 0, 20),
                      child: Text(
                        'USER SETUP',
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Region',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 55,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                enabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                filled: true,
                                fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Province',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                enabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                filled: true,
                                fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Municipality',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                enabledBorder: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                filled: true,
                                fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Region',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  filled: true,
                                  fillColor: Color.fromRGBO(229, 229, 229, 1.0),
                                ),

                                value: dropdownvalue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      width: double.infinity,
                      child: FlatButton(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        color: Color.fromRGBO(207, 10, 10, 1),
                        onPressed: () {},
                        child: Text(
                          'SAVE',
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
