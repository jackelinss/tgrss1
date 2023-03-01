
import 'package:flutter/material.dart';
import 'package:tgrss1/Tareas.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController fechaController = TextEditingController();
  TextEditingController asignacionController = TextEditingController();
  
  List<Tareas> contacts = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de tareas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Tareas',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: fechaController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                  hintText: 'fecha',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            
            const SizedBox(height: 10),

            TextField(
              controller: asignacionController,
              keyboardType: TextInputType.number,
            
              decoration: const InputDecoration(
                  hintText: 'asignacion',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            IconButton(
           icon: Icon(Icons.auto_fix_high),
            iconSize: 10,
           color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, '/añadirEtiqueta');
          }),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      String fecha = fechaController.text.trim();
                      String asign= asignacionController.text.trim();
                      if (name.isNotEmpty && fecha.isNotEmpty && asign.isNotEmpty ) {
                        setState(() {
                          nameController.text = '';
                          fechaController.text = '';
                          asignacionController.text = '';
                          contacts.add(Tareas(tarea: name, fecha: fecha , asignacion: asign));
                        });
                      }
                      //
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      //
                      String name = nameController.text.trim();
                      String fecha = fechaController.text.trim();
                      String asign= asignacionController.text.trim();
                     
                      if (name.isNotEmpty && fecha.isNotEmpty  && asign.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          fechaController.text = '';
                          asignacionController.text = '';
                          contacts[selectedIndex].tarea = name;
                          contacts[selectedIndex].fecha = fecha;
                          contacts[selectedIndex].asignacion = asign;
                          selectedIndex = -1;
                        });
                      }
                      //
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
            contacts.isEmpty
                ? const Text(
                    'No Contact yet..',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].tarea[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].tarea,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index].fecha),
             Text(contacts[index].asignacion),
          ],
         
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    nameController.text = contacts[index].tarea;
                    fechaController.text = contacts[index].fecha;
                    asignacionController.text =contacts[index].asignacion;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
                 InkWell(
                  onTap: (() {
                    //
                    setState(() {
                    
                    });
                    //
                  }),
                  child: const Icon(Icons.photo_album_sharp)), 
              
                  
            ],
          ),
        ),
      ),
    );

    
  }
}