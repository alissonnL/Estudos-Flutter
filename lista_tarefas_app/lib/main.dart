import 'package:flutter/material.dart';

 void main() {
   runApp(ListaTarefasApp());
 }

 class ListaTarefasApp extends StatelessWidget {
   const ListaTarefasApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: "Lista de Tarefas",
       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
       home: ListaTarefasScreen(),
       debugShowCheckedModeBanner: false,
     );
   }
 }

 class ListaTarefasScreen extends StatefulWidget {
   const ListaTarefasScreen({super.key});

   @override
   State<ListaTarefasScreen> createState() => _ListaTarefasScreenState();
 }

 class _ListaTarefasScreenState extends State<ListaTarefasScreen> {
   List<String> tarefas = [];

   void adicionarTarefa(String novaTarefa) {
     setState(() {
       tarefas.add(novaTarefa);
     });
   }

   void marcarComoConcluida(int index) {
     setState(() {
       tarefas.removeAt(index);
     });
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Lista de Tarefas"),
       ),
       body: ListView.builder(
         itemCount: tarefas.length,
         itemBuilder: (context, index) {
           return Dismissible(
             key: Key(tarefas[index]),
             onDismissed: (direction) {
               marcarComoConcluida(index);
             },
             child: Card(
               child: ListTile(
                 title: Text(tarefas[index]),
               ),
             ),
           );
         },
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: () async {
           final novaTarefa = await showDialog<String>(
             context: context,
             builder: (context) {
               String taskName = '';

               return AlertDialog(
                 title: Text('Adicionar Tarefa'),
                 content: TextField(
                   onChanged: (value) {
                     taskName = value;
                   },
                 ),
                 actions: <Widget>[
                   TextButton(
                     onPressed: () {
                       Navigator.of(context).pop();
                     },
                     child: Text('Cancelar'),
                   ),
                   TextButton(
                     onPressed: () {
                       if (taskName.isNotEmpty) {
                         Navigator.of(context).pop(taskName);
                       }
                     },
                     child: Text('Adicionar'),
                   ),
                 ],
               );
             },
           );

           if (novaTarefa != null && novaTarefa.isNotEmpty) {
             adicionarTarefa(novaTarefa);
           }
         },
         tooltip: 'Adicionar Tarefa',
         child: Icon(Icons.add),
       ),
     );
   }
 }
