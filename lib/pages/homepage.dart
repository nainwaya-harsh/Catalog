import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/cart.dart';
import 'package:flutter_application/models/catalog.dart';
import 'package:flutter_application/utiles/routes.dart';
import 'package:flutter_application/widgets/item_widget.dart';
import 'package:flutter_application/widgets/themes.dart';
import '/widgets/drawer.dart';
import 'package:flutter/services.dart';
import "dart:convert";
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widget/catalog_header.dart';
import '../widgets/home_widget/catalog_list.dart';
import 'cart_page.dart';
import '../utiles/routes.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogueModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: "Made with ❤️ By Harsh Nainwaya"
            .text
            .color(context.accentColor)
            .xl
            .make(),
      ),
      drawer: MyDrawer(),
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: context.theme.buttonColor,
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart_badge_plus),
        ).badge(
            count: _cart.items.length,
            color: context.cardColor,
            size: 20,
            textStyle: TextStyle(fontSize: 15)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogueModel != null && CatalogueModel.items.isNotEmpty)
                (CatalogList().expand())
              else
                (CircularProgressIndicator().centered().py(16).expand())
            ],
          ),
        ),
      ),
    );
  }
}
