class Association {
  String raisonSocial;
  String adresse;
  String ville;
  String gouvernorat;
  String tel;
  String type;
  String patante;
  String matriculeFiscal;
  String matriculeCnss;
  String numeroRne;
  String logo;

  Association(
      {this.raisonSocial,
      this.adresse,
      this.ville,
      this.gouvernorat,
      this.tel,
      this.type,
      this.patante,
      this.matriculeFiscal,
      this.matriculeCnss,
      this.numeroRne,
      this.logo});

  Association.fromJson(Map<String, dynamic> json) {
    raisonSocial = json['raisonSocial'];
    adresse = json['adresse'];
    ville = json['ville'];
    gouvernorat = json['gouvernorat'];
    tel = json['tel'];
    type = json['type'];
    patante = json['patante'];
    matriculeFiscal = json['matricule_fiscal'];
    matriculeCnss = json['matricule_cnss'];
    numeroRne = json['numero_rne'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raisonSocial'] = this.raisonSocial;
    data['adresse'] = this.adresse;
    data['ville'] = this.ville;
    data['gouvernorat'] = this.gouvernorat;
    data['tel'] = this.tel;
    data['type'] = this.type;
    data['patante'] = this.patante;
    data['matricule_fiscal'] = this.matriculeFiscal;
    data['matricule_cnss'] = this.matriculeCnss;
    data['numero_rne'] = this.numeroRne;
    data['logo'] = this.logo;
    return data;
  }
}

