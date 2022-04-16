import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/LandingPage/landingPage.dart';
import 'package:project/customer/addCustomerPage.dart';
import 'package:project/customer/editCustomer.dart';
import 'package:project/dialog/dialog.dart';
import 'package:project/dio/dio.dart';
import 'package:project/model/CustomerModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class customerPage extends StatefulWidget {
  customerPage({Key? key}) : super(key: key);

  @override
  State<customerPage> createState() => _customerPageState();
}

class _customerPageState extends State<customerPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataCustomer();
  }

  String? id;
  List<CustomerModel>? customerModel = [];
  bool? loading = false;
  getDataCustomer() async {
    setState(() {
      customerModel = [];
      loading = false;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    id = preferences.getString('id');
    print(id);
    var params = {'isAdd': 'true', 'userid': id};
    var data = await get(context, 'getcustomer.php', params);
    print(data);
    if (data != null) {
      // customerModel = CustomerModel.fromJson(data);
      for (var item in data) {
        customerModel?.add(CustomerModel.fromJson(item));
      }
    }
    print(customerModel);
    setState(() {
      loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ข้อมูลลูกค้า',
          style: GoogleFonts.prompt(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => addCustomerPage()),
                    (route) => false);
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                  (route) => false);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              loading == false
                  ? CircularProgressIndicator()
                  : customerModel?.length != 0
                      ? Expanded(
                          flex: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ListView.builder(
                                itemCount: customerModel?.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      print(customerModel?[index].cusId);
                                      dialog_select(context, "เมนู")
                                          .then((value) {
                                        if (value == "ลบ") {
                                          dialog_conf(
                                                  context, "ต้องการลบหรือไม่")
                                              .then((value) async {
                                            if (value == true) {
                                              var params = {
                                                "isAdd": "true",
                                                "user_id": id,
                                                "cus_id":
                                                    customerModel?[index].cusId,
                                              };
                                              print(id);
                                              print(
                                                  customerModel?[index].cusId);
                                              print(params);
                                              await post(context,
                                                  "deletecustomer.php", params);
                                            }
                                            getDataCustomer();
                                          });
                                        } else if (value == "ยกเลิก") {
                                        } else if (value == "แก้ไข") {
                                          MaterialPageRoute route =
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      editCustomer(
                                                          email: customerModel?[
                                                                  index]
                                                              .cusEmail,
                                                          phone:
                                                              customerModel?[
                                                                      index]
                                                                  .cusPhone,
                                                          id:
                                                              customerModel?[
                                                                      index]
                                                                  .cusId,
                                                          name: customerModel?[
                                                                  index]
                                                              .cusName,
                                                          userid: id));
                                          Navigator.push(context, route);
                                        }
                                      });
                                    },
                                    child: Card(
                                      elevation: 20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: 1),
                                                ),
                                                child: Icon(
                                                   Icons.person,
                                                  size: 55,
                                                )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "อีเมล์ : ${customerModel![index].cusEmail.toString()}",
                                                    style: GoogleFonts.prompt(),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                      "ชื่อ : ${customerModel![index].cusName.toString()}",
                                                      style:
                                                          GoogleFonts.prompt()),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                      "เบอร์ : ${customerModel![index].cusPhone.toString()}",
                                                      style:
                                                          GoogleFonts.prompt())
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ))
                      : Text('ไม่พบข้อมูล')
            ],
          ),
        ],
      ),
    );
  }
}
