
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holytea_slicing_ui/views/menupage.dart';
import 'package:holytea_slicing_ui/widgets/counterwidget.dart';
import 'package:holytea_slicing_ui/widgets/counterwidgetCart.dart';
import 'package:holytea_slicing_ui/widgets/ewallet.dart';
import '../controller/CartController.dart';
import '../controller/controller_counter.dart';
import '../model/cartmodel.dart';
import '../utils/themes.dart';
import 'homepage.dart';

class CartPage extends StatelessWidget {
  final cartController = Get.put(CartController());
  final controllerCounter = Get.put(CounterController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            child: eWallet(),
          ),
          Container(
            margin: EdgeInsets.only(right: 220),
            child: Text('Your Order(s)', style: subHeaderText),
          ),
          Expanded(
            child:
            Obx(() {
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final cartItem = cartController.cartItems[index];
                  final totalItemPrice = cartItem.price * cartItem.quantity;
                  return ListTile(
                    title: Text(cartItem.productName),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 95,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(cartItem.productImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    subtitle: CounterWidget2(index: index), // This widget should correctly access cartItem
                    trailing: Text(
                      "Rp $totalItemPrice",
                      style: normalFontBlFigma2,
                    ),
                  );
                },
              );
            })

          ),

          // Dibawah adalah kodingan untuk menampilkan total price
          // Card(
          //   elevation: 4,
          //   margin: const EdgeInsets.all(16),
          //   child: Padding(
          //     padding: const EdgeInsets.all(16),
          //     child:
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text(
          //           'Total Price:',
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //         Obx(() {
          //           // Calculate the total price by summing up totalItemPrice of all items
          //           double totalPrice = 0;
          //           for (CartItem cartItem in cartController.cartItems) {
          //             totalPrice += cartItem.price * cartItem.quantity;
          //           }
          //
          //           return Text(
          //             'Rp $totalPrice', // Display the total price
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           );
          //         }),
          //       ],
          //     ),
          //   ),
          // ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            child: ElevatedButton(
              onPressed: () {
              },
              style: customButtonStyle,
              child: Text(
                "Make Order",
                style: btnlogin,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Get.off(() => HomePage());
              },
              icon: Icon(Icons.home, color: colorText),
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: IconButton(
                onPressed: () {
                  Get.off(() => Menupage());
                },
                icon: Icon(Icons.menu_book, color: colorText),
              ),
            ),
            label: "menu",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.green),
            ),
            label: "cart",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Get.snackbar(
                    "Page", "MessagePage tunggu di push alias sedang dibuat");
              },
              icon: Icon(Icons.message, color: colorText),
            ),
            label: "chat",
          ),
        ],
        showSelectedLabels: false,

      ),
    );
  }
}
