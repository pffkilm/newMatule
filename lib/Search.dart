import 'package:flutter/material.dart';
import 'package:ui_kit/ui_components/Menu.dart';
import 'package:ui_kit/ui_kit.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _searchState();
}

class _searchState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     bottomNavigationBar:  ui.tabBar.create(initialIndex: 0),
     body: Padding(padding: EdgeInsets.only(left: 20, top: 68),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           ui.search,
           SizedBox(height: 32),
           Text("Акции и новости",style: ui.typography.title3Semibold.copyWith(
             color: ui.colors.inputText
           ),),
           SizedBox(height: 32),
           Container(
             width: 270,
             height: 152,
             child: Image.asset("assets/images/banners.png"),
           ),
           SizedBox(height: 32),
           Text("Каталог описаний",style: ui.typography.title3Semibold.copyWith(
               color: ui.colors.inputText
           ),),
           SizedBox(height: 15),
           Container(
             child:SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child:  Row(
                 children: [
                   Menu(text: 'Все', isActive: _selectedIndex == 0),
                   SizedBox( width: 19),
                   Menu(text: 'Женщинам',),
                   SizedBox( width: 19),
                   Menu(text: 'Мужчинам',),
                   SizedBox( width: 19),
                   Menu(text: 'Детям',),
                   SizedBox( width: 19),
                   Menu(text: 'Аксессуары',),
                 ],
               ),
             ),
           ),
           SizedBox(height: 25),
           ui.productCard.card(
             title: 'Рубашка Воскресенье для машинного\nвязания',
             subtitle: 'Мужская одежда',
             price: '300',
             button: ui.smallButton.primary(
               text: "Добавить",
               onPressed: (){},
               enabled: true,
             ),
           ),
           SizedBox(height: 10),

           ui.productCard.card(
             title: 'Рубашка Воскресенье для машинного\nвязания',
             subtitle: 'Мужская одежда',
             price: '300',
             button: ui.smallButton.delete(
               text: "Убрать",
               onPressed: (){},
             ),
           ),
         ],
     ),
     ),
   );
  }

}