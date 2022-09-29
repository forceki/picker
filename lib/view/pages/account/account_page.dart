import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:picker/components/chart.dart';
import 'package:picker/view/pages/account/changePw.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required this.changeNavbar}) : super(key: key);
  final Function(int) changeNavbar;
  @override
  State<AccountPage> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 150,
          padding: const EdgeInsets.only(bottom: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(262),
            child: const Image(
              image: NetworkImage(
                  'https://images.pexels.com/photos/7562139/pexels-photo-7562139.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            'John Doe',
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            '@admin',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        const Text('Last Login: 09-20-2022',
            style: TextStyle(
                color: Color(0xFF777986),
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        GestureDetector(
          onTap: () async {
            final result = await Navigator.push<int>(
                context,
                MaterialPageRoute(
                    // navigasi ke detail page, tapi detail pagenya pakai template
                    // scaffold kalo perlu bawa index bottomnavbar nya sekalian
                    builder: (context) => ChangePw()));
            // abis page tujuan di pop, bawa indexnya ke parent
            // widget buat ngeganti body widget kalo user pencet
            // bottomnavbarnya waktu di page detail
            if (result is int) widget.changeNavbar(result);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.fromLTRB(33, 40, 33, 20),
            height: 70,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F4F8),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 10),
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: const Icon(
                        Icons.lock_outline_rounded,
                        color: Color((0xFF2CBF6C)),
                      ),
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: Color((0xFF2CBF6C)))
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(33, 0, 33, 20),
          height: 70,
          decoration: const BoxDecoration(
            color: Color(0xFFF3F4F8),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 10),
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Icon(
                      Icons.exit_to_app_rounded,
                      color: Color((0xFFD63333)),
                    ),
                  ),
                  Text(
                    'Log Out',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded, color: Color((0xFFD63333)))
            ],
          ),
        ),
      ],
    ));
  }
}
