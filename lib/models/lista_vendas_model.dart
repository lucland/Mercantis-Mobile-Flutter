import 'dart:convert';

class VendasLista {
  final Info info;

  VendasLista({
    this.info,
  });

  factory VendasLista.fromJson(String str) =>
      VendasLista.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VendasLista.fromMap(Map<String, dynamic> json) => VendasLista(
        info: json["Info"] == null ? null : Info.fromMap(json["Info"]),
      );

  Map<String, dynamic> toMap() => {
        "Info": info == null ? null : info.toMap(),
      };
}

class Info {
  final DateTime dataGeracao;
  final String funcao;
  final int quantidade;
  final int pagina;
  final List<Iten> itens;

  Info({
    this.dataGeracao,
    this.funcao,
    this.quantidade,
    this.pagina,
    this.itens,
  });

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        dataGeracao: json["DataGeracao"] == null
            ? null
            : DateTime.parse(json["DataGeracao"]),
        funcao: json["Funcao"] == null ? null : json["Funcao"],
        quantidade: json["Quantidade"] == null ? null : json["Quantidade"],
        pagina: json["Pagina"] == null ? null : json["Pagina"],
        itens: json["Itens"] == null
            ? null
            : List<Iten>.from(json["Itens"].map((x) => Iten.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "DataGeracao":
            dataGeracao == null ? null : dataGeracao.toIso8601String(),
        "Funcao": funcao == null ? null : funcao,
        "Quantidade": quantidade == null ? null : quantidade,
        "Pagina": pagina == null ? null : pagina,
        "Itens": itens == null
            ? null
            : List<dynamic>.from(itens.map((x) => x.toMap())),
      };
}

class Iten {
  final int cliente;
  final int esCodigo;
  final String esLogin;
  final String esFantasia;
  final String razaoSocial;
  final String fantasia;
  final int pedido;
  final DateTime data;
  final double valorAFaturar;

  Iten({
    this.cliente,
    this.esCodigo,
    this.esLogin,
    this.esFantasia,
    this.razaoSocial,
    this.fantasia,
    this.pedido,
    this.data,
    this.valorAFaturar,
  });

  factory Iten.fromJson(String str) => Iten.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Iten.fromMap(Map<String, dynamic> json) => Iten(
        cliente: json["cliente"] == null ? null : json["cliente"],
        esCodigo: json["es_codigo"] == null ? null : json["es_codigo"],
        esLogin: json["es_login"] == null ? null : json["es_login"],
        esFantasia: json["es_fantasia"] == null ? null : json["es_fantasia"],
        razaoSocial: json["razao_social"] == null ? null : json["razao_social"],
        fantasia: json["fantasia"] == null ? null : json["fantasia"],
        pedido: json["pedido"] == null ? null : json["pedido"],
        data: json["data"] == null ? null : DateTime.parse(json["data"]),
        valorAFaturar: json["valorAFaturar"] == null
            ? null
            : json["valorAFaturar"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "cliente": cliente == null ? null : cliente,
        "es_codigo": esCodigo == null ? null : esCodigo,
        "es_login": esLogin == null ? null : esLogin,
        "es_fantasia": esFantasia == null ? null : esFantasia,
        "razao_social": razaoSocial == null ? null : razaoSocial,
        "fantasia": fantasia == null ? null : fantasia,
        "pedido": pedido == null ? null : pedido,
        "data": data == null ? null : data.toIso8601String(),
        "valorAFaturar": valorAFaturar == null ? null : valorAFaturar,
      };
}
