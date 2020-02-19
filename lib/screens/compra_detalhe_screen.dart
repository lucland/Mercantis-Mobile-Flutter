import 'package:flutter/material.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:mercantis_flutter/models/compras_detalhe.dart';
import 'package:mercantis_flutter/services/compras_detalhe.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:expandable/expandable.dart';
import 'package:intl/intl.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class CompraDetalheScreen extends StatefulWidget {
  CompraDetalheScreen({
    this.pedido,
  });

  final pedido;

  @override
  _CompraDetalheScreenState createState() => _CompraDetalheScreenState();
}

class _CompraDetalheScreenState extends State<CompraDetalheScreen>
    with SingleTickerProviderStateMixin {
  int cod = 0;
  bool isLoading;
  int _pedido;
  bool _isVisible = true;
  bool _isVisible2 = true;

  dynamic fornecedorFant;
  dynamic obs;
  dynamic compras;
  dynamic emissao;
  dynamic fornecedor;
  dynamic obsInt;
  dynamic motivo;

  dynamic comprador;
  dynamic codComp;
  dynamic transp;
  dynamic frete;
  dynamic valorFrete;
  final formatCurrency = new NumberFormat.simpleCurrency();

  dynamic ipi;
  dynamic atendido;
  dynamic pendente;
  dynamic ped;

  List<Cp> cpag = List<Cp>();
  List<PrazosEntrega> pen = List<PrazosEntrega>();
  List<Produto> produtos = List<Produto>();

  TabController _tabController;

  @override
  void initState() {
    isLoading = true;
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
    _pedido = widget.pedido;
    Services.getComp(_pedido).then((usersFromServer) {
      setState(() {
        cpag = usersFromServer.cp;
        pen = usersFromServer.prazosEntrega;
        motivo = usersFromServer.dsMotivoCompra;
        obsInt = usersFromServer.obs.obsInterna;
        produtos = usersFromServer.produtos;
        ipi = usersFromServer.totalIpi;
        atendido = usersFromServer.totalAtendido;
        pendente = usersFromServer.totalPendente;
        ped = usersFromServer.totalPedido;
        fornecedorFant = usersFromServer.fornecedorFantasia;
        comprador = usersFromServer.compradorNome;
        codComp = usersFromServer.compradorCod;
        transp = usersFromServer.transportadora;
        frete = usersFromServer.frete;
        valorFrete = usersFromServer.freteValor;
        fornecedor = usersFromServer.fornecedor;
        compras = usersFromServer;
        emissao = usersFromServer.emissao;
        obs = usersFromServer.obs.obs;
        if (usersFromServer.transportadora == null) _isVisible = !_isVisible;
        if (usersFromServer.frete == "CIF") _isVisible2 = !_isVisible2;
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
        title: Column(
          children: <Widget>[
            Text(
              'COMPRADOR: $comprador',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
                color: kVermelhoBase,
                fontFamily: 'Oswald',
              ),
            ),
          ],
        ),
        bottom: TabBar(
          unselectedLabelColor: kCinzaEscuro,
          labelColor: kVermelhoBase,
          tabs: [
            Tab(
              icon: new Icon(Icons.assignment),
              text: "Compra",
            ),
            Tab(
              icon: new Icon(Icons.local_grocery_store),
              text: "Produtos",
            ),
            Tab(
              icon: new Icon(Icons.library_books),
              text: "Prazos",
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
      bottomNavigationBar: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(0.0),
        color: kVermelhoBase,
        child: MaterialButton(
          height: 20,
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Autorizar Compra",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Oswald', fontSize: 25.0)
                      .copyWith(
                          color: Colors.white, fontWeight: FontWeight.w400)),
              SizedBox(
                width: 5,
              ),
              Image(
                image: AssetImage('images/mercantis.png'),
                height: 35.0,
                width: 35.0,
              ),
            ],
          ),
        ),
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
                          Text(
                            "${motivo.toString()}",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'OpenSans',
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Pedido',
                              texto2: '${_pedido.toString()}'),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Emissão',
                              texto2:
                                  '${DateFormat("dd/MM/yyyy").format(DateTime.parse(emissao.toString().substring(0, 10)))}'),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Comprador', texto2: '$comprador'),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Total Pedido',
                              //TODO: formatar os valores de dinheiro com a biblioteca Money Formatter
                              texto2: 'R${formatCurrency.format(ped)}'),
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
                          SizedBox(
                            height: 10,
                          ),
                          compras_detalhe_widget(
                            texto1: 'Frete',
                            texto2: '${frete.toString()}',
                          ),
                          Visibility(
                            visible: _isVisible2,
                            child: Divider(),
                          ),
                          Visibility(
                            visible: _isVisible2,
                            child: compras_detalhe_widget(
                                texto1: 'Valor do frete',
                                texto2:
                                    'R${formatCurrency.format(valorFrete)}'),
                          ),
                          Visibility(
                            visible: _isVisible,
                            child: Divider(),
                          ),
                          Visibility(
                            visible: _isVisible,
                            child: compras_detalhe_widget(
                              texto1: 'Transportadora',
                              texto2: '$transp',
                            ),
                          ),
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
                          SizedBox(
                            height: 8,
                          ),
                          ExpandablePanel(
                            theme: ExpandableThemeData(
                              iconColor: kVermelhoBase,
                            ),
                            header: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.report_problem,
                                    size: 30,
                                    color: kVermelhoBase,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Observação Interna',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'OpenSans',
                                      color: kVermelhoBase,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            expanded: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '$obsInt',
                                softWrap: true,
                              ),
                            ),
                            tapHeaderToExpand: true,
                            hasIcon: true,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 8,
                          ),
                          ExpandablePanel(
                            theme: ExpandableThemeData(
                              iconColor: kVermelhoBase,
                            ),
                            header: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.report_problem,
                                    size: 30,
                                    color: kVermelhoBase,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Observação',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'OpenSans',
                                      color: kVermelhoBase,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            expanded: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '$obs',
                                softWrap: true,
                              ),
                            ),
                            tapHeaderToExpand: true,
                            hasIcon: true,
                          ),
                        ],
                      ),
                    ),
                  ),
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
              padding: EdgeInsets.all(0.0),
              itemCount: produtos == null ? 0 : produtos.length,
              itemBuilder: (BuildContext context, int index) {
                //return makeCard;
                return Container(
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "${produtos[index].dsMaterial}",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'OpenSans',
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Quantidade',
                            texto2:
                                '${produtos[index].quantidade.toStringAsFixed(0)}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Valor Unitário',
                            texto2:
                                'R${formatCurrency.format(produtos[index].valorUnitario)}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Total',
                            texto2:
                                'R${formatCurrency.format((produtos[index].valorUnitario * produtos[index].quantidade))}'),
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

  Widget cp() {
    return Scaffold(
      backgroundColor: Color(0xFFE3E3E3),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 500,
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 8,
                          ),
                          ExpandablePanel(
                            theme: ExpandableThemeData(
                              iconColor: kPreto,
                            ),
                            header: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Condições de Pagamento',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'OpenSans',
                                  color: kPreto,
                                ),
                              ),
                            ),
                            expanded: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Dias",
                                            style: TextStyle(
                                                color: kVermelhoBase,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "OpenSans",
                                                fontSize: 20),
                                          ),
                                          Text(
                                            "Valor",
                                            style: TextStyle(
                                                color: kVermelhoBase,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "OpenSans",
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.all(0.0),
                                      itemCount: cpag == null ? 0 : cpag.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        //return makeCard;
                                        return Column(
                                          children: <Widget>[
                                            Divider(),
                                            compras_detalhe_widget(
                                                texto1:
                                                    '${cpag[index].prazo.toString()}',
                                                texto2:
                                                    'R${formatCurrency.format(cpag[index].valor)}'),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                )),
                            tapHeaderToExpand: true,
                            hasIcon: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0.0),
                    itemCount: pen == null ? 0 : pen.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "PRAZO DE ENTREGA",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'OpenSans',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Divider(),
                              compras_detalhe_widget(
                                  texto1: 'Data',
                                  texto2:
                                      '${DateFormat("dd/MM/yyyy").format(DateTime.parse(pen[index].data.toString().substring(0, 10)))}'),
                              Divider(),
                              compras_detalhe_widget(
                                  texto1: 'Prazo',
                                  texto2: '${pen[index].prazo.toString()}'),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
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
//docker-compose -f docker-compose-prod.yml build app
//docker-compose -f docker-compose-prod.yml run --rm app rake db:create db:migrate
//
//docker-compose -f docker-compose-prod.yml up -d app
