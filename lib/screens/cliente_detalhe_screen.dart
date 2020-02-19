import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:mercantis_flutter/screens/venda_detalhe_screen.dart';
import 'package:mercantis_flutter/services/clientes_detalhe_service.dart';
import 'package:mercantis_flutter/models/clientes_detalhe.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:expandable/expandable.dart';
import 'package:intl/intl.dart';
import 'package:mercantis_flutter/widgets/row_detail.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class ClienteDetalheScreen extends StatefulWidget {
  ClienteDetalheScreen({this.codCliente});
  final codCliente;

  @override
  _ClienteDetalheScreenState createState() => _ClienteDetalheScreenState();
}

class _ClienteDetalheScreenState extends State<ClienteDetalheScreen>
    with SingleTickerProviderStateMixin {
  int cod = 0;
  int _selectedIndex = 0;
  bool isLoading;

  bool _isVisible = true;
  bool _isVisible2 = true;
  bool _isVisible3 = true;

  List<Recebimento> recebimentos = List<Recebimento>();
  List<Endereco> endereco = List<Endereco>();
  List<Contato> contato = List<Contato>();
  List<Pedido> pedido = List<Pedido>();
  String fantasia;
  String status;
  String nome;
  String cnpj;
  String fj;
  dynamic telefone;
  dynamic classificacao;
  dynamic inscricaoEstadual;
  dynamic inscricaoMunicipal;
  dynamic tipo;
  dynamic setor;
  String dsSetor;
  DateTime dtCadastro;
  DateTime dtAtualizacao;
  dynamic cnpjOk;
  dynamic tipoCliente;
  dynamic indicadorIE;

  TabController _tabController;
  final formatCurrency = new NumberFormat.simpleCurrency();

  @override
  void initState() {
    isLoading = true;
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
    cod = widget.codCliente;
    Services.getCliente(cod).then((usersFromServer) {
      setState(() {
        print(usersFromServer);
        telefone = usersFromServer.telefone;
        recebimentos = usersFromServer.recebimentos;
        endereco = usersFromServer.enderecos;
        contato = usersFromServer.contatos;
        pedido = usersFromServer.pedidos;

        nome = usersFromServer.nome;
        fantasia = usersFromServer.fantasia;
        status = usersFromServer.status;
        cnpj = usersFromServer.cnpj;
        fj = usersFromServer.fj;
        classificacao = usersFromServer.classificacao;
        inscricaoEstadual = usersFromServer.inscricaoEstadual;
        inscricaoMunicipal = usersFromServer.inscricaoMunicipal;
        tipo = usersFromServer.tipo;
        setor = usersFromServer.setor;
        dsSetor = usersFromServer.dsSetor;
        dtCadastro = usersFromServer.dtCadastro;
        dtAtualizacao = usersFromServer.dtAtualizacao;
        cnpjOk = usersFromServer.cnpjOk;
        tipoCliente = usersFromServer.tipoCliente;
        indicadorIE = usersFromServer.indicadorIe;

        isLoading = false;
      });
    });
  }

  Widget makeBody() {
    if (isLoading) {
      return this.indicator();
    } else {
      return this.Tabi();
    }
  }

  Widget indicator() {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kVermelhoGradiente, //change your color here
        ),
        elevation: 5.0,
        backgroundColor: Color(0xFFE8E8E8),
        title: Text(
          "Carregando...",
          style: TextStyle(
            fontSize: 25.0,
            color: kVermelhoBase,
            fontFamily: 'Oswald',
          ),
        ),
      ),
      body: Center(
        child: SpinKitCubeGrid(
          color: Color(0xFFB91D21),
          size: 100.0,
        ),
      ),
    );
  }

  Widget Tabi() {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: kVermelhoBase, //change your color here
        ),
        elevation: 5.0,
        backgroundColor: kBranco,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '$fantasia',
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 15.0,
                color: kVermelhoBase,
                fontFamily: 'Oswald',
              ),
            ),
            Image(
              image: AssetImage('images/mercantis.png'),
              height: 36,
              width: 36.0,
            ),
          ],
        ),
        bottom: TabBar(
          unselectedLabelColor: kCinzaEscuro,
          labelColor: kVermelhoBase,
          tabs: [
            Tab(
              icon: new Icon(Icons.person),
              text: "Cliente",
            ),
            Tab(
              icon: new Icon(Icons.local_grocery_store),
              text: "Pedidos",
            ),
            Tab(
              icon: new Icon(Icons.library_books),
              text: "Recebimentos",
            ),
          ],
          controller: _tabController,
          indicatorColor: kVermelhoBase,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          BodyWidget(),
          produt(),
          cp(),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget BodyWidget() {
    return Scaffold(
      backgroundColor: Color(0xFFE3E3E3),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 500,
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          compras_detalhe_widget(
                              texto1: 'Fantasia',
                              texto2: '${fantasia.toString()}'),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'CNPJ', texto2: '${cnpj.toString()}'),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Telefone',
                              texto2: '${telefone.toString()}'),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Setor', texto2: '${dsSetor.toString()}'),
//                          Divider(),
//                          compras_detalhe_widget(
//                              texto1: 'Rentabilidade',
//                              texto2:
//                                  '${DateFormat("dd/MM/yyyy").format(DateTime.parse(data.toString().substring(0, 10)))}'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 500,
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ListView.builder(
                            physics: new NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(5.0),
                            shrinkWrap: true,
                            itemCount: endereco == null ? 0 : endereco.length,
                            itemBuilder: (BuildContext context, int index) {
                              //return makeCard;
                              return RowDetail(
                                icone: Icons.home,
                                texto1:
                                    '${endereco[index].endereco.toString().toString()}, ${endereco[index].bairro.toString()}, ${endereco[index].cep.toString()}',
                                texto2: 'Endereço',
                                corIcone: kVermelhoBase,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: 500,
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ExpandablePanel(
                            theme: ExpandableThemeData(
                              iconColor: kVermelhoBase,
                            ),
                            header: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    size: 25,
                                    color: kVermelhoBase,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Contatos',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'OpenSans',
                                      color: kVermelhoBase,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            expanded: ListView.builder(
                              physics: new NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.all(5.0),
                              shrinkWrap: true,
                              itemCount: contato == null ? 0 : contato.length,
                              itemBuilder: (BuildContext context, int index) {
                                //return makeCard;
                                return Card(
                                  elevation: 4.0,
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 2.0, vertical: 6.0),
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Color(0xFFE8E8E8)),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Nome",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'OpenSans',
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(width: 10),
                                              Flexible(
                                                child: Text(
                                                  '${contato[index].nome.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'OpenSans',
                                                      color: kCinzaEscuro),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        compras_detalhe_widget(
                                            texto1: 'Cargo',
                                            texto2:
                                                '${contato[index].cargo.toString()}'),
                                        Divider(),
                                        compras_detalhe_widget(
                                            texto1: 'Telefone',
                                            texto2:
                                                '(${contato[index].prefixo1.toString()}) ${contato[index].numero1.toString()}'),
                                        Divider(),
                                        compras_detalhe_widget(
                                            texto1: 'Email',
                                            texto2:
                                                '${contato[index].email.toString()}'),
                                        Divider(),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              ButtonTheme(
                                                minWidth: 5,
                                                child: FlatButton(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Discar",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'OpenSans',
                                                            color:
                                                                kVermelhoBase,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Icon(
                                                        Icons.phone_in_talk,
                                                        color: kVermelhoBase,
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    launch("tel:" +
                                                        '${contato[index].prefixo1.toString().toString()}${contato[index].numero1.toString()}');
                                                  },
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    right: 12.0),
                                                decoration: new BoxDecoration(
                                                  border: new Border(
                                                    right: new BorderSide(
                                                        width: 1.0,
                                                        color: kCinzaEscuro),
                                                  ),
                                                ),
                                              ),
                                              ButtonTheme(
                                                minWidth: 5,
                                                child: FlatButton(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Enviar Email",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'OpenSans',
                                                            color:
                                                                kVermelhoBase,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Icon(
                                                        Icons.mail_outline,
                                                        color: kVermelhoBase,
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    launch("mailto:" +
                                                        '${contato[index].email.toString()}');
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            tapHeaderToExpand: true,
                            hasIcon: true,
                          ),
                        ],
                      ),
                    ),
                  ),
//                  Expanded(
//                    child: Container(
//                      width: 500,
//                      child: Card(
//                        elevation: 8.0,
//                        margin: new EdgeInsets.symmetric(
//                            horizontal: 10.0, vertical: 6.0),
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            SizedBox(
//                              height: 10,
//                            ),
//                            Text(
//                              "Informações da Liberação",
//                              style: TextStyle(
//                                  fontSize: 20,
//                                  fontFamily: 'OpenSans',
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.w500),
//                              textAlign: TextAlign.center,
//                            ),
//                            Divider(),
//                            compras_detalhe_widget(
//                              texto1: 'Total CR Vencido',
//                              texto2: 'R',
//                            ),
//                            Divider(),
//                            compras_detalhe_widget(
//                                texto1: 'Total CR a Vencer', texto2: 'R'),
//                            Divider(),
//                            compras_detalhe_widget(
//                              texto1: 'Media de Atraso(90dias)',
//                              texto2: '',
//                            ),
//                            Divider(),
//                            compras_detalhe_widget(
//                              texto1: 'Crédito Usado',
//                              texto2: 'R',
//                            ),
//                            Divider(),
//                            compras_detalhe_widget(
//                              texto1: 'Rentabilidade Pedido',
//                              texto2: '%',
//                            ),
//                            Divider(),
//                            compras_detalhe_widget(
//                              texto1: 'Cond. Pag. Pedido',
//                              texto2: '',
//                            ),
//                            SizedBox(
//                              height: 10,
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
//                  Container(
//                    width: 500,
//                    child: Card(
//                      elevation: 8.0,
//                      margin: new EdgeInsets.symmetric(
//                          horizontal: 10.0, vertical: 6.0),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          SizedBox(
//                            height: 8,
//                          ),
//                          ExpandablePanel(
//                            theme: ExpandableThemeData(
//                              iconColor: kVermelhoBase,
//                            ),
//                            header: Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Text(
//                                'OBSERVAÇÃO DE CRÉDITO',
//                                overflow: TextOverflow.ellipsis,
//                                style: TextStyle(
//                                  fontSize: 20,
//                                  fontWeight: FontWeight.w500,
//                                  fontFamily: 'OpenSans',
//                                  color: kVermelhoBase,
//                                ),
//                              ),
//                            ),
//                            expanded: Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Text(
//                                '',
//                                softWrap: true,
//                              ),
//                            ),
//                            tapHeaderToExpand: true,
//                            hasIcon: true,
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  Container(
//                    width: 500,
//                    child: Card(
//                      elevation: 8.0,
//                      margin: new EdgeInsets.symmetric(
//                          horizontal: 10.0, vertical: 6.0),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          SizedBox(
//                            height: 10,
//                          ),
//                          Text(
//                            "Informações de Crédito",
//                            style: TextStyle(
//                                fontSize: 20,
//                                fontFamily: 'OpenSans',
//                                color: Colors.black,
//                                fontWeight: FontWeight.w500),
//                            textAlign: TextAlign.center,
//                          ),
//                          Divider(),
//                          compras_detalhe_widget(
//                            texto1: 'Limite de Crédito',
//                            texto2: 'R',
//                          ),
//                          Divider(),
//                          compras_detalhe_widget(
//                            texto1: 'Rentabilidade Desejada',
//                            texto2: '%',
//                          ),
//                          Divider(),
//                          compras_detalhe_widget(
//                            texto1: 'Prazo Médio',
//                            texto2: '',
//                          ),
//                          Divider(),
//                          compras_detalhe_widget(
//                            texto1: 'Dias Sem Compra Máx.',
//                            texto2: '',
//                          ),
//                          Divider(),
//                          compras_detalhe_widget(
//                            texto1: 'Dias Atraso Máx.',
//                            texto2: '',
//                          ),
//                          Divider(),
//                          compras_detalhe_widget(
//                            texto1: 'Dias Atrsado Médio Máx.',
//                            texto2: '',
//                          ),
//                          Divider(),
//                          compras_detalhe_widget(
//                            texto1: 'Dias Atraso',
//                            texto2: '',
//                          ),
//                          Divider(),
//                          compras_detalhe_widget(
//                            texto1: 'Faturamento Mín.',
//                            texto2: 'R',
//                          ),
//                          Divider(),
//                          compras_detalhe_widget(
//                            texto1: 'Cond. Pagamento',
//                            texto2: '',
//                          ),
//                          SizedBox(
//                            height: 10,
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget produt() {
    return Scaffold(
      backgroundColor: Color(0xFFE3E3E3),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: pedido == null ? 0 : pedido.length,
              itemBuilder: (BuildContext context, int index) {
                //return makeCard;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return VendaDetalheScreen(
                        pedido: pedido[index].pedido,
                      );
                    }));
                  },
                  child: Card(
                    elevation: 4.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 6.0),
                    child: Container(
                        decoration: BoxDecoration(color: kBranco),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    flex: 8,
                                    child: Container(
                                      padding: EdgeInsets.only(right: 12.0),
                                      decoration: new BoxDecoration(
                                        border: new Border(
                                          right: new BorderSide(
                                              width: 2.0, color: kCinzaEscuro),
                                        ),
                                      ),
                                      child: Icon(Icons.monetization_on,
                                          color: kCinzaEscuro),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 84,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            pedido[index].razaoSocial,
                                            overflow: TextOverflow.clip,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            pedido[index].esFantasia,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: kCinzaEscuro,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                  "Pedido: ${pedido[index].pedido.toString()} |",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: kCinzaSubtitulo,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Emissão: ${DateFormat("dd/MM/yyyy").format(DateTime.parse(pedido[index].data.toString().substring(0, 10)))}",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: kCinzaSubtitulo,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Icon(Icons.keyboard_arrow_right,
                                        color: kVermelhoBase, size: 40.0),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Total:",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: kVermelhoBase,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "R${formatCurrency.format(pedido[index].valorAFaturar)}",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: kCinzaEscuro,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "OpenSans-Regular"),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget cp() {
    return Scaffold(
      backgroundColor: Color(0xFFE3E3E3),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: recebimentos == null ? 0 : recebimentos.length,
              itemBuilder: (BuildContext context, int index) {
                //return makeCard;
                return Container(
                  width: 500,
                  child: Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Número CR " +
                                '${recebimentos[index].numeroCr.toString()}',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'OpenSans',
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(),
                        compras_detalhe_widget(
                          texto1: 'Status',
                          texto2: '${recebimentos[index].status}',
                        ),
                        Divider(),
                        compras_detalhe_widget(
                          texto1: 'Vencimento',
                          texto2:
                              '${DateFormat("dd/MM/yyyy").format(DateTime.parse(recebimentos[index].vencimento.toString().substring(0, 10)))}',
                        ),
                        Divider(),
                        compras_detalhe_widget(
                          texto1: 'Data de Recebimento',
                          texto2:
                              '${DateFormat("dd/MM/yyyy").format(DateTime.parse(recebimentos[index].dtRecebimento.toString().substring(0, 10)))}',
                        ),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Valor Recebido',
                            texto2:
                                'R${formatCurrency.format(recebimentos[index].valorRecebido)}'),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return makeBody();
  }
}

class compras_detalhe_widget extends StatelessWidget {
  const compras_detalhe_widget(
      {Key key, @required this.texto1, @required this.texto2})
      : super(key: key);

  final String texto1;
  final String texto2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            texto1,
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'OpenSans',
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              texto2,
              style: TextStyle(
                  fontSize: 18, fontFamily: 'OpenSans', color: kCinzaEscuro),
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}