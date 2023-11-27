import 'package:flutter/material.dart';
import 'package:cafe_app/core.dart';
import '../controller/mainmenu_controller.dart';

class MainmenuView extends StatefulWidget {
  MainmenuView({Key? key}) : super(key: key);

  Widget build(context, MainmenuController controller) {
    controller.view = this;
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              padding: EdgeInsets.all(10.0),
              width: 60,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: 24.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person_2_outlined,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            // bungkus expanded (ALT+E)
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  width: 100,
                  decoration: BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black,
                        ),
                        child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/924/924514.png",
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Selamat Pagi",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Agus Purniawan",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
              
                      // untuk menambah fungsi const, tekan (Ctrl+Shift+Alt+1)
              
                      // bukus teks dengan ScrollView (Alt+Shift+J)
                      // agar tidak terputus dipinggir, berikan perintah clipnone
                      SingleChildScrollView(
                        clipBehavior: Clip.none,
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              List.generate(controller.kategori.length, (index) {
                            var item = controller.kategori[index];
                            bool klikmenu = controller.pilihkategori == index;
                            // bungkus teks dengan container, agar bisa memisah per kata, lalu gunakan perintah mr15
                            // tekan ctrl+shift+C untuk menuju ke mainmenu_controller
                            return Container(
                              margin: EdgeInsets.only(
                                right: 15.0,
                              ),
                              child: InkWell(
                                onTap: () => controller.updatekategori(index),
                                child: Text(
                                  "$item",
                                  style: TextStyle(
                                      fontSize: klikmenu ? 16.0 : 14,
                                      fontWeight: klikmenu
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: klikmenu ? Colors.red : Colors.grey),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      // agar bisa list view tekan alt shift J
                      SingleChildScrollView(
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        child: Row(
                          children: List.generate(controller.products.length, (index) {
                            var item=controller.products[index];
                            return Container(
                              margin: EdgeInsets.only(right: 12.0,),
                              width: 90,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Image.network(
                                      item["photo"],
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    item["product_name"], // alt shift enter
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Rp. ${item["price"]}K",
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                      height: 20.0,
                      ),
                      Text("Nikmati kopi di pagi hari anda",
                      style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                      height: 10.0,
                      ),
                      Container(
                      height: 160.0,
                      decoration: BoxDecoration(
                      image: DecorationImage(
                      image: NetworkImage(
                      "https://teraspendopo.com/wp-content/uploads/2022/09/20220926_100012_0000-min.jpg",
                      ),
                      fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                      Radius.circular(
                      8.0,
                      ),
                      ),
                      ),
                      ),
                      SizedBox(
                      height: 20.0,
                      ),
                      GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0 / 1.4,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      ),
                      itemCount: controller.products.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                      var item = controller.products[index];
                      return Container(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Expanded(
                      child: Container(
                      width: MediaQuery.of(context).size.width,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                      image: DecorationImage(
                      image: NetworkImage(
                      item["photo"],
                      ),
                      fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                      Radius.circular(
                      6.0,
                      ),
                      ),
                      ),
                      child: Stack(
                      children: [
                      Positioned(
                      right: 6.0,
                      top: 8.0,
                      child: CircleAvatar(
                      radius: 14.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 14.0,
                      ),
                      ),
                      ),
                      ],
                      ),
                      ),
                      ),
                      SizedBox(
                      height: 8.0,
                      ),
                      Text(
                      item["product_name"],
                      style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                      height: 4.0,
                      ),
                      Text(
                      item["category"],
                      style: TextStyle(
                      fontSize: 12.0,
                      ),
                      ),
                      SizedBox(
                      height: 4.0,
                      ),
                      Text(
                      "Rp. ${item["price"]}K",
                      style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      ),
                      ),
                      ],
                      ),
                      );
                      },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<MainmenuView> createState() => MainmenuController();
}
