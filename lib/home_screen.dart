import 'package:flutter/material.dart';
import 'package:to_do_list/utility/app_space.dart';
import 'utility/app_colour.dart';
import 'utility/app_font_weight.dart';
import 'utility/app_text_size.dart';
import 'widget/resuable_to_do_list.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime currentDateTime= DateTime.now();
  String newTitle="";
  String newDescription='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top:20,bottom: 20,right: 20),
              decoration: const BoxDecoration(
                color: AppColour.primaryColor,
              ),
              child:  Row(
                children: [
                  const Spacer(),
                   const Text("ToDo List",
                     style: TextStyle(
                       fontWeight: AppFontWeight.w500,
                       fontSize: AppTextSize.h22,
                       color: AppColour.basicColor,
                     ),
                   ),
                  const Spacer(),
                  GestureDetector(
                    child: Container(
                      decoration:const BoxDecoration(
                        color: AppColour.basicColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )
                      ),
                      child: GestureDetector(
                        onTap: (){
                            showDialog(context: context,
                                builder: (context)=> AlertDialog(
                                  title: TextFormField (
                                    decoration: const InputDecoration(
                                      hintText: "Title"
                                    ),
                                   onChanged: (textTitle){
                                     newTitle= textTitle;
                                   },
                                   style: const TextStyle(
                                     fontWeight: AppFontWeight.w500,
                                     fontSize: AppTextSize.h18,
                                     color: AppColour.primaryColor
                                   ),
                                  ),
                                  content: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Description"
                                    ),
                                    onChanged:(textDescription){
                                      newDescription=textDescription;
                                    },
                                    style: TextStyle(
                                      fontSize: AppTextSize.h12,
                                      fontWeight: AppFontWeight.w400,
                                      color: AppColour.primaryColor.withOpacity(0.7),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(onPressed: (){
                                        if(newTitle.isEmpty){
                                          newTitle="";
                                          newDescription='';
                                        }
                                        else if(newDescription.isEmpty){
                                          newTitle="";
                                          newDescription='';
                                        }
                                        else{
                                          setState(() {
                                            toDoList.add(ToDo(title: newTitle, description: newDescription));
                                            newTitle="";
                                            newDescription='';
                                          });
                                        }
                                      Navigator.pop(context);
                                    },
                                        child: const Text("Save"))
                                  ],
                                )
                            );
                        },
                        child: const Icon(Icons.add,
                        color: AppColour.primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            AppSpacing.space20,
           Builder(builder: (context) {
             if(toDoList.isEmpty){
               return
              const Center(child:Text("No objective Available"));
             }
             else{
               return
               Expanded(
                 child: ListView.builder(
                   itemCount:toDoList.length ,
                   itemBuilder: (BuildContext context, int index)
                   {return
                     ReusableToDoList(currentDateTime: currentDateTime,
                       title:toDoList[index].title,
                       description: toDoList[index].description,
                       icon1: GestureDetector(
                         onTap: (){
                           setState(() {
                             int indexToRemove = index;

                             if (indexToRemove >= 0 && indexToRemove < toDoList.length) {
                               toDoList.removeAt(indexToRemove);
                             }

                           });
                         },
                         child: const Icon(Icons.delete,
                           color: AppColour.delete,
                         ),
                       ), icon2: GestureDetector(
                         onTap: (){
                           setState(() {
                             showDialog(context: context, builder: (context)=>
                                 AlertDialog(
                                   title: TextFormField(
                                     initialValue: toDoList[index].title,

                                     onChanged: (editTitleText){
                                       newTitle=editTitleText;
                                     },
                                     style: const TextStyle(
                                         fontWeight: AppFontWeight.w500,
                                         fontSize: AppTextSize.h12,
                                         color: AppColour.primaryColor
                                     ),
                                   ),
                                   content: TextFormField(
                                     initialValue:toDoList[index].description,
                                     onChanged: (editDescriptionText){
                                       newDescription=editDescriptionText;
                                     },
                                     style: const TextStyle(
                                       fontSize: AppTextSize.h12,
                                       fontWeight: AppFontWeight.w400,
                                       color: AppColour.primaryColor,
                                     ),
                                   ),
                                   actions: [
                                     TextButton(
                                         onPressed: (){
                                           if(newTitle.isEmpty|| newDescription.isEmpty){

                                           }
                                           else if(newTitle.isNotEmpty|| newDescription.isNotEmpty){
                                             setState(() {
                                               toDoList[index]=ToDo(title: newTitle, description: newDescription);
                                               newTitle='';
                                               newDescription='';
                                             });
                                           }

                                           Navigator.pop(context);
                                         },
                                         child: const Text('Apply')
                                     )
                                   ],
                                 )
                             );
                           });
                         },
                         child: const Icon(Icons.edit,
                           color: AppColour.correct,
                         ),
                       ),);
                   },
                 ),
               );


           }
           }
           )
          ],
        ),
      ),
    );
  }
}


class ToDo{
  String title;
  String description;
  ToDo({required this.title, required this.description});

}
final List<ToDo> toDoList =[

];

