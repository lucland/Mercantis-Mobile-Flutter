// To parse this JSON data, do
//
//     final clienteDetalhe = clienteDetalheFromJson(jsonString);

import 'dart:convert';

class ClienteDetalhe {
  final Info info;

  ClienteDetalhe({
    this.info,
  });

  ClienteDetalhe copyWith({
    Info info,
  }) =>
      ClienteDetalhe(
        info: info ?? this.info,
      );

  factory ClienteDetalhe.fromJson(String str) =>
      ClienteDetalhe.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClienteDetalhe.fromMap(Map<String, dynamic> json) => ClienteDetalhe(
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
  final Cliente cliente;

  Info({
    this.dataGeracao,
    this.funcao,
    this.quantidade,
    this.pagina,
    this.cliente,
  });

  Info copyWith({
    DateTime dataGeracao,
    String funcao,
    int quantidade,
    int pagina,
    Cliente cliente,
  }) =>
      Info(
        dataGeracao: dataGeracao ?? this.dataGeracao,
        funcao: funcao ?? this.funcao,
        quantidade: quantidade ?? this.quantidade,
        pagina: pagina ?? this.pagina,
        cliente: cliente ?? this.cliente,
      );

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        dataGeracao: json["DataGeracao"] == null
            ? null
            : DateTime.parse(json["DataGeracao"]),
        funcao: json["Funcao"] == null ? null : json["Funcao"],
        quantidade: json["Quantidade"] == null ? null : json["Quantidade"],
        pagina: json["Pagina"] == null ? null : json["Pagina"],
        cliente: json["Item"] == null ? null : Cliente.fromMap(json["Item"]),
      );

  Map<String, dynamic> toMap() => {
        "DataGeracao":
            dataGeracao == null ? null : dataGeracao.toIso8601String(),
        "Funcao": funcao == null ? null : funcao,
        "Quantidade": quantidade == null ? null : quantidade,
        "Pagina": pagina == null ? null : pagina,
        "Item": cliente == null ? null : cliente.toMap(),
      };
}

class Cliente {
  final dynamic cliente;
  final String status;
  final String nome;
  final String fantasia;
  final String cnpj;
  final String telefone;
  final String fj;
  final dynamic classificacao;
  final dynamic inscricaoEstadual;
  final dynamic inscricaoMunicipal;
  final DateTime dtCadastro;
  final DateTime dtAtualizacao;
  final dynamic tipo;
  final dynamic setor;
  final String dsSetor;
  final dynamic cnpjOk;
  final String tipoCliente;
  final dynamic indicadorIe;
  final List<Endereco> enderecos;
  final List<Contato> contatos;
  final List<dynamic> recebimentos;
  final List<Pedido> pedidos;

  Cliente({
    this.cliente,
    this.status,
    this.nome,
    this.fantasia,
    this.cnpj,
    this.telefone,
    this.fj,
    this.classificacao,
    this.inscricaoEstadual,
    this.inscricaoMunicipal,
    this.dtCadastro,
    this.dtAtualizacao,
    this.tipo,
    this.setor,
    this.dsSetor,
    this.cnpjOk,
    this.tipoCliente,
    this.indicadorIe,
    this.enderecos,
    this.contatos,
    this.recebimentos,
    this.pedidos,
  });

  Cliente copyWith({
    int cliente,
    String status,
    String nome,
    String fantasia,
    String cnpj,
    String telefone,
    String fj,
    int classificacao,
    dynamic inscricaoEstadual,
    dynamic inscricaoMunicipal,
    DateTime dtCadastro,
    DateTime dtAtualizacao,
    int tipo,
    int setor,
    String dsSetor,
    dynamic cnpjOk,
    String tipoCliente,
    int indicadorIe,
    List<Endereco> enderecos,
    List<Contato> contatos,
    List<dynamic> recebimentos,
    List<Pedido> pedidos,
  }) =>
      Cliente(
        cliente: cliente ?? this.cliente,
        status: status ?? this.status,
        nome: nome ?? this.nome,
        fantasia: fantasia ?? this.fantasia,
        cnpj: cnpj ?? this.cnpj,
        telefone: telefone ?? this.telefone,
        fj: fj ?? this.fj,
        classificacao: classificacao ?? this.classificacao,
        inscricaoEstadual: inscricaoEstadual ?? this.inscricaoEstadual,
        inscricaoMunicipal: inscricaoMunicipal ?? this.inscricaoMunicipal,
        dtCadastro: dtCadastro ?? this.dtCadastro,
        dtAtualizacao: dtAtualizacao ?? this.dtAtualizacao,
        tipo: tipo ?? this.tipo,
        setor: setor ?? this.setor,
        dsSetor: dsSetor ?? this.dsSetor,
        cnpjOk: cnpjOk ?? this.cnpjOk,
        tipoCliente: tipoCliente ?? this.tipoCliente,
        indicadorIe: indicadorIe ?? this.indicadorIe,
        enderecos: enderecos ?? this.enderecos,
        contatos: contatos ?? this.contatos,
        recebimentos: recebimentos ?? this.recebimentos,
        pedidos: pedidos ?? this.pedidos,
      );

  factory Cliente.fromJson(String str) => Cliente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cliente.fromMap(Map<String, dynamic> json) => Cliente(
        cliente: json["Cliente"] == null ? null : json["Cliente"],
        status: json["Status"] == null ? null : json["Status"],
        nome: json["Nome"] == null ? null : json["Nome"],
        fantasia: json["Fantasia"] == null ? null : json["Fantasia"],
        cnpj: json["CNPJ"] == null ? null : json["CNPJ"],
        telefone: json["Telefone"] == null ? null : json["Telefone"],
        fj: json["FJ"] == null ? null : json["FJ"],
        classificacao:
            json["Classificacao"] == null ? null : json["Classificacao"],
        inscricaoEstadual: json["InscricaoEstadual"],
        inscricaoMunicipal: json["InscricaoMunicipal"],
        dtCadastro: json["DtCadastro"] == null
            ? null
            : DateTime.parse(json["DtCadastro"]),
        dtAtualizacao: json["DtAtualizacao"] == null
            ? null
            : DateTime.parse(json["DtAtualizacao"]),
        tipo: json["Tipo"] == null ? null : json["Tipo"],
        setor: json["Setor"] == null ? null : json["Setor"],
        dsSetor: json["DS_Setor"] == null ? null : json["DS_Setor"],
        cnpjOk: json["CNPJ_Ok"],
        tipoCliente: json["TipoCliente"] == null ? null : json["TipoCliente"],
        indicadorIe: json["IndicadorIE"] == null ? null : json["IndicadorIE"],
        enderecos: json["Enderecos"] == null
            ? null
            : List<Endereco>.from(
                json["Enderecos"].map((x) => Endereco.fromMap(x))),
        contatos: json["Contatos"] == null
            ? null
            : List<Contato>.from(
                json["Contatos"].map((x) => Contato.fromMap(x))),
        recebimentos: json["Recebimentos"] == null
            ? null
            : List<dynamic>.from(json["Recebimentos"].map((x) => x)),
        pedidos: json["Pedidos"] == null
            ? null
            : List<Pedido>.from(json["Pedidos"].map((x) => Pedido.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Cliente": cliente == null ? null : cliente,
        "Status": status == null ? null : status,
        "Nome": nome == null ? null : nome,
        "Fantasia": fantasia == null ? null : fantasia,
        "CNPJ": cnpj == null ? null : cnpj,
        "Telefone": telefone == null ? null : telefone,
        "FJ": fj == null ? null : fj,
        "Classificacao": classificacao == null ? null : classificacao,
        "InscricaoEstadual": inscricaoEstadual,
        "InscricaoMunicipal": inscricaoMunicipal,
        "DtCadastro": dtCadastro == null ? null : dtCadastro.toIso8601String(),
        "DtAtualizacao":
            dtAtualizacao == null ? null : dtAtualizacao.toIso8601String(),
        "Tipo": tipo == null ? null : tipo,
        "Setor": setor == null ? null : setor,
        "DS_Setor": dsSetor == null ? null : dsSetor,
        "CNPJ_Ok": cnpjOk,
        "TipoCliente": tipoCliente == null ? null : tipoCliente,
        "IndicadorIE": indicadorIe == null ? null : indicadorIe,
        "Enderecos": enderecos == null
            ? null
            : List<dynamic>.from(enderecos.map((x) => x.toMap())),
        "Contatos": contatos == null
            ? null
            : List<dynamic>.from(contatos.map((x) => x.toMap())),
        "Recebimentos": recebimentos == null
            ? null
            : List<dynamic>.from(recebimentos.map((x) => x)),
        "Pedidos": pedidos == null
            ? null
            : List<dynamic>.from(pedidos.map((x) => x.toMap())),
      };
}

class Contato {
  final int contato;
  final String nome;
  final String cargo;
  final dynamic dtNascimento;
  final dynamic dsTel1;
  final String prefixo1;
  final String numero1;
  final dynamic dsTel2;
  final String prefixo2;
  final String dsTipoEmail;
  final String email;
  final dynamic obervacao;

  Contato({
    this.contato,
    this.nome,
    this.cargo,
    this.dtNascimento,
    this.dsTel1,
    this.prefixo1,
    this.numero1,
    this.dsTel2,
    this.prefixo2,
    this.dsTipoEmail,
    this.email,
    this.obervacao,
  });

  Contato copyWith({
    int contato,
    String nome,
    String cargo,
    dynamic dtNascimento,
    dynamic dsTel1,
    String prefixo1,
    String numero1,
    dynamic dsTel2,
    String prefixo2,
    String dsTipoEmail,
    String email,
    dynamic obervacao,
  }) =>
      Contato(
        contato: contato ?? this.contato,
        nome: nome ?? this.nome,
        cargo: cargo ?? this.cargo,
        dtNascimento: dtNascimento ?? this.dtNascimento,
        dsTel1: dsTel1 ?? this.dsTel1,
        prefixo1: prefixo1 ?? this.prefixo1,
        numero1: numero1 ?? this.numero1,
        dsTel2: dsTel2 ?? this.dsTel2,
        prefixo2: prefixo2 ?? this.prefixo2,
        dsTipoEmail: dsTipoEmail ?? this.dsTipoEmail,
        email: email ?? this.email,
        obervacao: obervacao ?? this.obervacao,
      );

  factory Contato.fromJson(String str) => Contato.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contato.fromMap(Map<String, dynamic> json) => Contato(
        contato: json["Contato"] == null ? null : json["Contato"],
        nome: json["Nome"] == null ? null : json["Nome"],
        cargo: json["Cargo"] == null ? null : json["Cargo"],
        dtNascimento: json["DtNascimento"],
        dsTel1: json["Ds_Tel1"],
        prefixo1: json["Prefixo1"] == null ? null : json["Prefixo1"],
        numero1: json["Numero1"] == null ? null : json["Numero1"],
        dsTel2: json["Ds_Tel2"],
        prefixo2: json["Prefixo2"] == null ? null : json["Prefixo2"],
        dsTipoEmail: json["Ds_TipoEmail"] == null ? null : json["Ds_TipoEmail"],
        email: json["Email"] == null ? null : json["Email"],
        obervacao: json["Obervacao"],
      );

  Map<String, dynamic> toMap() => {
        "Contato": contato == null ? null : contato,
        "Nome": nome == null ? null : nome,
        "Cargo": cargo == null ? null : cargo,
        "DtNascimento": dtNascimento,
        "Ds_Tel1": dsTel1,
        "Prefixo1": prefixo1 == null ? null : prefixo1,
        "Numero1": numero1 == null ? null : numero1,
        "Ds_Tel2": dsTel2,
        "Prefixo2": prefixo2 == null ? null : prefixo2,
        "Ds_TipoEmail": dsTipoEmail == null ? null : dsTipoEmail,
        "Email": email == null ? null : email,
        "Obervacao": obervacao,
      };
}

class Endereco {
  final int tipoEndereco;
  final String endereco;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;
  final String numero;
  final String complemento;
  final int codTipoEnd;

  Endereco({
    this.tipoEndereco,
    this.endereco,
    this.bairro,
    this.cidade,
    this.estado,
    this.cep,
    this.numero,
    this.complemento,
    this.codTipoEnd,
  });

  Endereco copyWith({
    int tipoEndereco,
    String endereco,
    String bairro,
    String cidade,
    String estado,
    String cep,
    String numero,
    String complemento,
    int codTipoEnd,
  }) =>
      Endereco(
        tipoEndereco: tipoEndereco ?? this.tipoEndereco,
        endereco: endereco ?? this.endereco,
        bairro: bairro ?? this.bairro,
        cidade: cidade ?? this.cidade,
        estado: estado ?? this.estado,
        cep: cep ?? this.cep,
        numero: numero ?? this.numero,
        complemento: complemento ?? this.complemento,
        codTipoEnd: codTipoEnd ?? this.codTipoEnd,
      );

  factory Endereco.fromJson(String str) => Endereco.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Endereco.fromMap(Map<String, dynamic> json) => Endereco(
        tipoEndereco:
            json["TipoEndereco"] == null ? null : json["TipoEndereco"],
        endereco: json["Endereco"] == null ? null : json["Endereco"],
        bairro: json["Bairro"] == null ? null : json["Bairro"],
        cidade: json["Cidade"] == null ? null : json["Cidade"],
        estado: json["Estado"] == null ? null : json["Estado"],
        cep: json["CEP"] == null ? null : json["CEP"],
        numero: json["Numero"] == null ? null : json["Numero"],
        complemento: json["Complemento"] == null ? null : json["Complemento"],
        codTipoEnd: json["Cod_Tipo_End"] == null ? null : json["Cod_Tipo_End"],
      );

  Map<String, dynamic> toMap() => {
        "TipoEndereco": tipoEndereco == null ? null : tipoEndereco,
        "Endereco": endereco == null ? null : endereco,
        "Bairro": bairro == null ? null : bairro,
        "Cidade": cidade == null ? null : cidade,
        "Estado": estado == null ? null : estado,
        "CEP": cep == null ? null : cep,
        "Numero": numero == null ? null : numero,
        "Complemento": complemento == null ? null : complemento,
        "Cod_Tipo_End": codTipoEnd == null ? null : codTipoEnd,
      };
}

class Pedido {
  final int esCodigo;
  final int pedido;
  final DateTime data;
  final int cliente;
  final String razaoSocial;
  final String fantasia;
  final String situacaofat;
  final String situacao;
  final double valorAFaturar;

  Pedido({
    this.esCodigo,
    this.pedido,
    this.data,
    this.cliente,
    this.razaoSocial,
    this.fantasia,
    this.situacaofat,
    this.situacao,
    this.valorAFaturar,
  });

  Pedido copyWith({
    int esCodigo,
    int pedido,
    DateTime data,
    int cliente,
    String razaoSocial,
    String fantasia,
    String situacaofat,
    String situacao,
    double valorAFaturar,
  }) =>
      Pedido(
        esCodigo: esCodigo ?? this.esCodigo,
        pedido: pedido ?? this.pedido,
        data: data ?? this.data,
        cliente: cliente ?? this.cliente,
        razaoSocial: razaoSocial ?? this.razaoSocial,
        fantasia: fantasia ?? this.fantasia,
        situacaofat: situacaofat ?? this.situacaofat,
        situacao: situacao ?? this.situacao,
        valorAFaturar: valorAFaturar ?? this.valorAFaturar,
      );

  factory Pedido.fromJson(String str) => Pedido.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pedido.fromMap(Map<String, dynamic> json) => Pedido(
        esCodigo: json["es_codigo"] == null ? null : json["es_codigo"],
        pedido: json["pedido"] == null ? null : json["pedido"],
        data: json["data"] == null ? null : DateTime.parse(json["data"]),
        cliente: json["cliente"] == null ? null : json["cliente"],
        razaoSocial: json["razao_social"] == null ? null : json["razao_social"],
        fantasia: json["fantasia"] == null ? null : json["fantasia"],
        situacaofat: json["situacaofat"] == null ? null : json["situacaofat"],
        situacao: json["situacao"] == null ? null : json["situacao"],
        valorAFaturar: json["valorAFaturar"] == null
            ? null
            : json["valorAFaturar"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "es_codigo": esCodigo == null ? null : esCodigo,
        "pedido": pedido == null ? null : pedido,
        "data": data == null ? null : data.toIso8601String(),
        "cliente": cliente == null ? null : cliente,
        "razao_social": razaoSocial == null ? null : razaoSocial,
        "fantasia": fantasia == null ? null : fantasia,
        "situacaofat": situacaofat == null ? null : situacaofat,
        "situacao": situacao == null ? null : situacao,
        "valorAFaturar": valorAFaturar == null ? null : valorAFaturar,
      };
}
