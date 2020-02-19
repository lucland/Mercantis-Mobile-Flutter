import 'dart:convert';

class ClienteDetalhe {
  final Info info;

  ClienteDetalhe({
    this.info,
  });

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
  final dynamic quantidade;
  final dynamic pagina;
  final Cliente cliente;

  Info({
    this.dataGeracao,
    this.funcao,
    this.quantidade,
    this.pagina,
    this.cliente,
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
  final dynamic telefone;
  final String fj;
  final dynamic classificacao;
  final String inscricaoEstadual;
  final dynamic inscricaoMunicipal;
  final DateTime dtCadastro;
  final DateTime dtAtualizacao;
  final dynamic tipo;
  final dynamic setor;
  final String dsSetor;
  final dynamic cnpjOk;
  final dynamic tipoCliente;
  final dynamic indicadorIe;
  final List<Endereco> enderecos;
  final List<Contato> contatos;
  final List<Recebimento> recebimentos;
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
        inscricaoEstadual: json["InscricaoEstadual"] == null
            ? null
            : json["InscricaoEstadual"],
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
        tipoCliente: json["TipoCliente"],
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
            : List<Recebimento>.from(
                json["Recebimentos"].map((x) => Recebimento.fromMap(x))),
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
        "InscricaoEstadual":
            inscricaoEstadual == null ? null : inscricaoEstadual,
        "InscricaoMunicipal": inscricaoMunicipal,
        "DtCadastro": dtCadastro == null ? null : dtCadastro.toIso8601String(),
        "DtAtualizacao":
            dtAtualizacao == null ? null : dtAtualizacao.toIso8601String(),
        "Tipo": tipo == null ? null : tipo,
        "Setor": setor == null ? null : setor,
        "DS_Setor": dsSetor == null ? null : dsSetor,
        "CNPJ_Ok": cnpjOk,
        "TipoCliente": tipoCliente,
        "IndicadorIE": indicadorIe == null ? null : indicadorIe,
        "Enderecos": enderecos == null
            ? null
            : List<dynamic>.from(enderecos.map((x) => x.toMap())),
        "Contatos": contatos == null
            ? null
            : List<dynamic>.from(contatos.map((x) => x.toMap())),
        "Recebimentos": recebimentos == null
            ? null
            : List<dynamic>.from(recebimentos.map((x) => x.toMap())),
        "Pedidos": pedidos == null
            ? null
            : List<dynamic>.from(pedidos.map((x) => x.toMap())),
      };
}

class Contato {
  final dynamic contato;
  final String nome;
  final String cargo;
  final dynamic dtNascimento;
  final dynamic dsTel1;
  final dynamic prefixo1;
  final dynamic numero1;
  final dynamic dsTel2;
  final dynamic prefixo2;
  final dynamic dsTipoEmail;
  final dynamic email;
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

  factory Contato.fromJson(String str) => Contato.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contato.fromMap(Map<String, dynamic> json) => Contato(
        contato: json["Contato"] == null ? null : json["Contato"],
        nome: json["Nome"] == null ? null : json["Nome"],
        cargo: json["Cargo"] == null ? null : json["Cargo"],
        dtNascimento: json["DtNascimento"],
        dsTel1: json["Ds_Tel1"],
        prefixo1: json["Prefixo1"],
        numero1: json["Numero1"],
        dsTel2: json["Ds_Tel2"],
        prefixo2: json["Prefixo2"],
        dsTipoEmail: json["Ds_TipoEmail"],
        email: json["Email"],
        obervacao: json["Obervacao"],
      );

  Map<String, dynamic> toMap() => {
        "Contato": contato == null ? null : contato,
        "Nome": nome == null ? null : nome,
        "Cargo": cargo == null ? null : cargo,
        "DtNascimento": dtNascimento,
        "Ds_Tel1": dsTel1,
        "Prefixo1": prefixo1,
        "Numero1": numero1,
        "Ds_Tel2": dsTel2,
        "Prefixo2": prefixo2,
        "Ds_TipoEmail": dsTipoEmail,
        "Email": email,
        "Obervacao": obervacao,
      };
}

class Endereco {
  final dynamic tipoEndereco;
  final String endereco;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;
  final dynamic numero;
  final dynamic complemento;
  final dynamic codTipoEnd;

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
        numero: json["Numero"],
        complemento: json["Complemento"],
        codTipoEnd: json["Cod_Tipo_End"] == null ? null : json["Cod_Tipo_End"],
      );

  Map<String, dynamic> toMap() => {
        "TipoEndereco": tipoEndereco == null ? null : tipoEndereco,
        "Endereco": endereco == null ? null : endereco,
        "Bairro": bairro == null ? null : bairro,
        "Cidade": cidade == null ? null : cidade,
        "Estado": estado == null ? null : estado,
        "CEP": cep == null ? null : cep,
        "Numero": numero,
        "Complemento": complemento,
        "Cod_Tipo_End": codTipoEnd == null ? null : codTipoEnd,
      };
}

class Pedido {
  final dynamic cliente;
  final dynamic esCodigo;
  final String esLogin;
  final String esFantasia;
  final String razaoSocial;
  final String fantasia;
  final dynamic pedido;
  final DateTime data;
  final dynamic valorAFaturar;

  Pedido({
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

  factory Pedido.fromJson(String str) => Pedido.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pedido.fromMap(Map<String, dynamic> json) => Pedido(
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

class Recebimento {
  final dynamic numeroCr;
  final String status;
  final DateTime vencimento;
  final DateTime dtRecebimento;
  final dynamic valor;
  final dynamic valorRecebido;

  Recebimento({
    this.numeroCr,
    this.status,
    this.vencimento,
    this.dtRecebimento,
    this.valor,
    this.valorRecebido,
  });

  factory Recebimento.fromJson(String str) =>
      Recebimento.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Recebimento.fromMap(Map<String, dynamic> json) => Recebimento(
        numeroCr: json["NumeroCR"] == null ? null : json["NumeroCR"],
        status: json["Status"] == null ? null : json["Status"],
        vencimento: json["Vencimento"] == null
            ? null
            : DateTime.parse(json["Vencimento"]),
        dtRecebimento: json["DtRecebimento"] == null
            ? null
            : DateTime.parse(json["DtRecebimento"]),
        valor: json["Valor"] == null ? null : json["Valor"],
        valorRecebido:
            json["ValorRecebido"] == null ? null : json["ValorRecebido"],
      );

  Map<String, dynamic> toMap() => {
        "NumeroCR": numeroCr == null ? null : numeroCr,
        "Status": status == null ? null : status,
        "Vencimento": vencimento == null ? null : vencimento.toIso8601String(),
        "DtRecebimento":
            dtRecebimento == null ? null : dtRecebimento.toIso8601String(),
        "Valor": valor == null ? null : valor,
        "ValorRecebido": valorRecebido == null ? null : valorRecebido,
      };
}
