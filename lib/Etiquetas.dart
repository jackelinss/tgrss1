import 'package:flutter/material.dart';

class Etiquetas extends StatefulWidget {
  @override
  _EtiquetasState createState() => _EtiquetasState();
}

class _EtiquetasState extends State<Etiquetas> {
  final controllerTarea = TextEditingController();
  final controllerCalificado = TextEditingController();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               
                TextField(
                  controller: controllerTarea,
                  enabled: !isLoggedIn,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Tarea'),
                ),
                SizedBox(
                  height: 1,
                ),
                               

                  TextField(
                  controller: controllerCalificado,
                  enabled: !isLoggedIn,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Seleccion'),
                ),
                SizedBox(
                  height: 1,
                ),
                 Container(
                  height: 50,
                  child: TextButton(
                    child: const Text('añadir'),
                    onPressed:()
                     {},
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 50,
                  child: TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
                
              ],

              
            ),
          ),
        ));
  }
}
  
  