import 'package:colaborae/app/modules/user/controllers/user_controller.dart';
import 'package:colaborae/app/modules/user/models/user_model.dart';
import 'package:colaborae/app/shared/cepSearch/CepModel.dart';
import 'package:colaborae/app/shared/components/big_button.dart';
import 'package:colaborae/app/shared/components/field.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final userController = Modular.get<UserController>();

  bool createNewUser = false;

  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final cpfController = TextEditingController();
  final ruaController = TextEditingController();
  final cepController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();
  final descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (userController.user == null)
      createNewUser = true;
    else {
      nomeController.text = userController.user.firstName;
      sobrenomeController.text = userController.user.lastName;
      emailController.text = userController.user.email;
      cpfController.text = userController.user.document;
      ruaController.text = userController.user.address.address;
      bairroController.text = userController.user.address.block;
      cepController.text = userController.user.address.zipcode;
      cidadeController.text = userController.user.address.city;
      estadoController.text = userController.user.address.state;
      descricaoController.text = userController.user.description;
    }
  }

  Future<UserModel> createUser() async {
    Address address = new Address(
        address: ruaController.text,
        zipcode: cepController.text,
        city: cidadeController.text,
        state: estadoController.text);
    UserModel newUser = new UserModel(
        firstName: nomeController.text,
        lastName: sobrenomeController.text,
        email: emailController.text,
        username: emailController.text,
        document: cpfController.text,
        address: address,
        description: descricaoController.text,
        password: senhaController.text);

    bool createUser;

    if (createNewUser) {
      createUser = await userController.createUser(newUser);
    } else {
      newUser.uuid = userController.user.uuid;
      newUser.address.uuid = userController.user.address.uuid;
      createUser = await userController.editUser(newUser);
    }

    if (createUser) {
      createNewUser
          ? Modular.to.pushNamed("/login")
          : Modular.to.pushNamed("/home");
    } else {
      print("Erro");
    }
  }

  Widget Spacing(double h) {
    return SizedBox(
      height: h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/imagens/gift_50px.png',
                ),
                Spacing(10.0),
                Text(
                  createNewUser ? 'Faça seu cadastro' : 'Edite seus dados',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                  ),
                ),
                Spacing(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Dados pessoais',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacing(15.0),
                Field(
                  label: 'Nome',
                  hint: 'Digite seu primeiro nome',
                  icon: Icon(
                    Icons.person,
                    color: gray,
                  ),
                  lines: 1,
                  controller: nomeController,
                  keyboardInputType: TextInputType.name,
                ),
                Spacing(20.0),
                Field(
                  label: 'Sobrenome',
                  hint: 'Digite seu sobrenome',
                  icon: Icon(
                    Icons.person,
                    color: gray,
                  ),
                  lines: 1,
                  controller: sobrenomeController,
                  keyboardInputType: TextInputType.name,
                ),
                Spacing(20.0),
                Field(
                  readOnly: !createNewUser,
                  label: 'E-mail',
                  hint: 'Digite seu e-mail',
                  icon: Icon(
                    Icons.alternate_email,
                    color: gray,
                  ),
                  lines: 1,
                  controller: emailController,
                  keyboardInputType: TextInputType.emailAddress,
                ),
                Spacing(20.0),
                Field(
                  readOnly: !createNewUser,
                  label: 'CPF',
                  hint: 'Digite seu CPF',
                  icon: Icon(
                    Icons.accessibility,
                    color: gray,
                  ),
                  lines: 1,
                  controller: cpfController,
                  keyboardInputType: TextInputType.number,
                ),
                Spacing(20.0),
                Visibility(
                  visible: createNewUser,
                  child: Field(
                    label: 'Senha',
                    icon: Icon(
                      Icons.lock,
                      color: gray,
                    ),
                    lines: 1,
                    hint: 'Digite uma nova senha',
                    controller: senhaController,
                  ),
                ),
                Spacing(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Endereço',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        inputFormatters: [maskFormatter],
                        controller: cepController,
                        decoration: InputDecoration(
                          hintText: 'Busque pelo CEP',
                          hintStyle: TextStyle(
                            color: lightGray,
                          ),
                          labelText: 'CEP',
                          isDense: true,
                          contentPadding: EdgeInsets.all(20.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: lighterGray,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: mainPurple,
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Observer(builder: (_) {
                        return ButtonTheme(
                          height: 60,
                          child: RaisedButton(
                            elevation: 5,
                            color: mainPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0)),
                            textColor: Colors.white,
                            child: userController.loading
                                ? CircularProgressIndicator()
                                : Text("Buscar Por CEP"),
                            onPressed: () async {
                              CepModel infosAddress = await userController
                                  .getInfoCep(cepController.text);

                              setState(() {
                                ruaController.text = infosAddress.logradouro;
                                bairroController.text = infosAddress.bairro;
                                cidadeController.text = infosAddress.localidade;
                                estadoController.text = infosAddress.uf;
                              });
                            },
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                Spacing(20.0),
                Row(
                  children: [
                    Expanded(
                      child: Field(
                        readOnly: true,
                        label: 'Rua',
                        hint: 'Digite a rua da sua casa',
                        lines: 1,
                        controller: ruaController,
                        keyboardInputType: TextInputType.name,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Field(
                        readOnly: true,
                        label: 'Bairro',
                        hint: 'Digite o seu bairro',
                        lines: 1,
                        controller: bairroController,
                        keyboardInputType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                Spacing(20.0),
                Row(
                  children: [
                    Expanded(
                      child: Field(
                        readOnly: true,
                        label: 'Cidade',
                        hint: 'Ex: Rio de Janeiro',
                        controller: cidadeController,
                        lines: 1,
                        keyboardInputType: TextInputType.name,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Field(
                        readOnly: true,
                        label: 'Estado',
                        hint: 'Ex: SP',
                        controller: estadoController,
                        lines: 1,
                        keyboardInputType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                Spacing(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Adicione uma descrição ao seu perfil',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
                Spacing(20.0),
                Field(
                  label: 'Descrição',
                  hint:
                      'Escreva uma descrição rápida sobre você que aparecerá aos outros usuários.',
                  lines: 4,
                  controller: descricaoController,
                  keyboardInputType: TextInputType.multiline,
                ),
                Spacing(20.0),
                Observer(builder: (_) {
                  return BigButton(
                    loading: userController.loading,
                    text: createNewUser ? 'CADASTRAR' : 'EDITAR',
                    onPressed: () async => await createUser(),
                  );
                }),
                Spacing(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui uma conta?',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    FlatButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Entre agora.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mainPurple,
                          fontSize: 18.0,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacing(20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
