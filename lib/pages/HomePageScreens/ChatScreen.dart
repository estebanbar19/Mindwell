import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:foodfast/data/Theme/AppColors.dart';
import 'package:foodfast/data/models/Formatters/NumericalRangeFormatter.dart';
import 'package:foodfast/data/models/Message.dart';
import 'package:foodfast/data/models/OpenAiCompletitions/CompletitionResponse.dart';
import 'package:foodfast/data/models/Prompt.dart';
import 'package:foodfast/widgets/MessageItem.dart';
import 'package:foodfast/data/OpenAI/ChatCompletitionApi.dart';



class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  late TextEditingController inputContent;
  late ScrollController _controller;
  late FocusNode myFocusNode;

  Prompt gptPrompt = Prompt.instance;
  int contadorPregunta = 1; 
  List<String> preguntas = [
  'Hola, soy tu asistente personal y me gustaría hacerte unas preguntas antes de comenzar',
  'Durante la última semana, ¿cómo calificaría su estado de ánimo ansioso? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  '¿Cómo calificaría la tensión que ha experimentado durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  'En términos de temores, ¿cómo calificaría sus niveles durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  '¿Cómo calificaría la calidad de su sueño durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  'En cuanto a su capacidad intelectual (cognitiva), ¿cómo calificaría su concentración y memoria? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  '¿Cómo calificaría su estado de ánimo deprimido durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  'En términos de síntomas musculares, ¿cómo calificaría el dolor o la rigidez muscular durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  '¿Cómo calificaría los síntomas sensoriales generales (zumbidos, visión borrosa, etc.) durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  'En cuanto a los síntomas cardiovasculares, ¿cómo calificaría la frecuencia cardíaca y las palpitaciones durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  '¿Cómo calificaría los síntomas respiratorios, como la opresión en el pecho o la sensación de ahogo, durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  'En términos de síntomas gastrointestinales, ¿cómo calificaría molestias como dolor, ardor, etc., durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  '¿Cómo calificaría los síntomas genitourinarios, como la micción frecuente o problemas de erección, durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
  'En cuanto a los síntomas autónomos, como la boca seca o la palidez, ¿cómo calificaría estos durante la última semana? \n(0 - Ausente, 1 - Leve, 2 - Moderado, 3 - Grave, 4 - Muy grave)',
];
bool resultadoEntregado = false;

// 0 - Ausente 
// 1 - Leve 
// 2 - Moderado
// 3 - Grave 
// 4 - Muy grave


  @override
  void initState() {
    // TODO: implement initState
    myFocusNode = FocusNode();
    inputContent = TextEditingController();
    _controller = ScrollController();
    setState(() {
      if(gptPrompt.messages.length < 2) gptPrompt.addMessage(Message("assistant", preguntas[0]));
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    inputContent.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _messagesCount = gptPrompt.messages.length-1 < 0 ? 0 : gptPrompt.messages.length-1;
    return Container(
      color: AppColors.quaternaryColor,
      child: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(color: Color.fromARGB(15, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                  itemCount: _messagesCount,
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                int _index = index+1;
                return MessageItem(message: gptPrompt.messages.elementAt(_index));
              }),
            ),
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Container(
              decoration: BoxDecoration(color: AppColors.quinaryColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children:   [
                  Expanded(child: TextField(focusNode: myFocusNode, controller: inputContent, inputFormatters: [NumericalRangeFormatter(min: 0, max: 4)], maxLength: contadorPregunta > 1 ? 1 : null, keyboardType: contadorPregunta == 1 ? TextInputType.text : TextInputType.number, decoration: InputDecoration(border: InputBorder.none, hintText: "Type your message...", filled: false, hintStyle: TextStyle(color: Colors.white,), counterText: ""), style: TextStyle(color: Colors.white),)),
                  IconButton(onPressed: (true) ? (){
                    setState(() {
                      if(contadorPregunta == 1){
                        FocusScope.of(context).unfocus();
                        Future.delayed(Duration(milliseconds: 50), (){
                          setState(() {
                            FocusScope.of(context).requestFocus(myFocusNode);
                          });
                        });
                      }
                      if(contadorPregunta < preguntas.length-1){
                        gptPrompt.addMessage(Message("user", inputContent.text));
                        inputContent.clear();
                        gptPrompt.addMessage(Message("assistant", preguntas[contadorPregunta]));
                        contadorPregunta++;
                      }else if(!resultadoEntregado){
                        gptPrompt.addMessage(Message("assistant", "Espera, te daré tu resultado en un instante"));
                        ChatCompletitionApi().sendPrompt(gptPrompt.getPromptString()).then((value){
                         CompletitionResponse gptResponse = CompletitionResponse.fromJson(jsonDecode(value.body) as Map<String, dynamic>);
                         print(gptResponse.choices[0].message.content);
                         setState(() {
                           gptPrompt.addMessage(Message("assistant", gptResponse.choices[0].message.content));
                           Future.delayed(Duration(milliseconds: 100), () {
                            _controller.jumpTo(_controller.position.maxScrollExtent);
                          },);
                         });
                         resultadoEntregado = true;
                       });
                      }
                    });
                    Future.delayed(Duration(milliseconds: 100), () {
                      _controller.jumpTo(_controller.position.maxScrollExtent);
                    },);
                  } : null, icon: const Icon(Icons.send, color: AppColors.secondaryColor, size: 30,),)
                ],),
              ),
            ),
          )
        ],
      ),
    );
  }
}