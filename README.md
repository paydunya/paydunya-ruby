# PAYDUNYA - Client Ruby API
============================
PAYDUNYA Client Ruby

## Documentation Officielle
https://paydunya.com/developers/ruby

## Installation

Ajouter cette ligne au fichier Gemfile de votre application:

    gem 'paydunya'

Et exécuter ensuite la commande:

    $ bundle

Ou installer le directement en tapant:

    $ gem install paydunya

## Utilisation

## Configuration de vos clés d'API

Si vous utilisez Ruby on Rails vous pouvez créer un fichier au niveau de `RAILS_ROOT/config/initializers` et y insérer les paramètres suivants:

    Paydunya::Setup.master_key = "VOTRE_CLE_PRINCIPALE"
    Paydunya::Setup.public_key = "VOTRE_CLE_PUBLIQUE"
    Paydunya::Setup.private_key = "VOTRE_CLE_PRIVEE"
    Paydunya::Setup.mode = "test|live"
    Paydunya::Setup.token = "VOTRE_TOKEN"

## Configuration des informations de votre service/activité/entreprise
Configurer ensuite les informations de votre service/activité/entreprise comme illustré ci-dessous.
La plupart des paramètres sont optionels mais il serait tout de meme intéressant de configurer le nom de l'entreprise et le slogan.

    Paydunya::Checkout::Store.name = "NOM_DE_VOTRE_ENTREPRISE"
    Paydunya::Checkout::Store.tagline = "SLOGAN_DE_VOTRE_ENTREPRISE"
    Paydunya::Checkout::Store.postal_address = "ADRESSE_DE_VOTRE_ENTREPRISE"
    Paydunya::Checkout::Store.phone_number = "NUMERO_DE_TELEPHONE_DE_VOTRE_ENTREPRISE"
    Paydunya::Checkout::Store.website_url = "URL_DU_SITE_WEB_DE_VOTRE_ENTREPRISE"
    Paydunya::Checkout::Store.logo_url = "URL_DU_LOGO_DE_VOTRE_ENTREPRISE"

## Configuration d'une URL de redirection après annulation de paiement

Vous pouvez optionnellement définir une URL à laquelle seront redirigés vos clients après une annulation de commande.

    # Configuration globale de l'URL de redirection après annulation de paiement.
    Paydunya::Checkout::Store.cancel_url = "URL_DE_REDIRECTION_APRES_ANNULATION"


## Configuration d'une URL de redirection après confirmation de paiement

PAYDUNYA redirigera automatiquement le client à cette adresse URL après un paiement fructueux.
Cette configuration est facultative et il fortement recommandé de ne pas s'en servir, à moins que vous voulez personnaliser l'expérience de paiement de vos clients.
Si cette URL de redirection n'est pas définie, PAYDUNYA redirigera le client vers une page affichant son reçu électronique.

    # Configuration globale de l'URL de redirection après confirmation de paiement.
    Paydunya::Checkout::Store.return_url = "URL_DE_REDIRECTION_APRES_SUCCES"


## Initialisation d'un Paiement Avec Redirection (PAR)

    co = Paydunya::Checkout::Invoice.new

## Initialisation d'un Paiement Sans Redirection (PSR)

    co = Paydunya::Onsite::Invoice.new

Les paramètres attendus sont nom du produit, la quantité, le prix unitaire,
le prix total et une description optionelle. `addItem(nom_du_produit, quantité, prix_unitaire, prix_total, description_optionelle)`

    co.add_item("Clavier DELL", 2, 3000, 6000)
    co.add_item("Ordinateur Lenovo L440", 1, 400000, 400000, "Réduction de 10%")
    co.add_item("Casque Logitech", 1, 8000, 8000)

## Configuration du montant total de la facture! Important

PAYDUNYA s'attend à ce que vous préciser un montant total de facture. Ce sera ce montant qui sera facturé à votre client. Nous considérons que vous auriez déjà fait tous les calculs au niveau de votre serveur avant de fixer ce montant.

NOTE: PAYDUNYA n'effectuera pas de calculs au niveau de ses serveurs. Le montant total de la facture fixé à partir de votre serveur sera celui que PAYDUNYA utilisera pour facturer votre client.

    co.total_amount = 6500

## Ajouter une description de facture (Optionnel)

Vous pouvez de manière optionelle définir une description générale de facture
qui sera utilisée dans les cas où la facture n'a pas besoin d'une liste
des éléments ou dans les cas où vous avez besoin d'inclure des informations
supplémentaires à votre facture

    co.description = "Description Optionnelle"


## Ajout de taxes (Optionnel)

Vous pouvez représenter l'ajout d'informations de taxes au niveau de la page de paiement. Ces informations seront ensuite affichées sur la facture, le reçu électronique, le reçu imprimé et les téléchargements PDF.

    co.add_tax('TVA (18%)', 5000);
    co.add_tax('Autre taxe', 700);

## Ajout de données supplémentaires que vous pourrez récupérer par la suite

Si vous avez besoin d'ajouter des données supplémentaires à vos informations de requête de paiement à des fins d'utilisation ultérieure, nous vous offrons la possibilité de sauvegarder des données personnalisées sur nos serveurs et de les récupérer une fois le paiement réussi.

NOTE: Les données personnalisées ne sont affichées nulle part sur la page de paiement, les factures/reçus, les téléchargements et impressions.

    co.add_custom_data("Prénom", "Badara")
    co.add_custom_data("Nom", "Alioune")
    co.add_custom_data("CartId", 97628)
    co.add_custom_data("Coupon","NOEL")

## Redirection vers la page de paiement PAYDUNYA (Cas PAR)

Après avoir rajouté des articles à votre facture et configurer le montant total de la facture, vous pouvez rediriger votre client vers la page de paiement en appelant la méthode create depuis votre objet facture ($co). Veuillez s'il vous plaît noter que la méthode "$co->create()" retourne un booléen (true ou false) selon le fait que la facture ait été créée avec succès ou non. Cela vous permet de mettre une instruction if - else et gérer le résultat comme bon vous semble.

   # Le code suivant décrit comment créer une facture de paiement au niveau de nos serveurs,
   # rediriger ensuite le client vers la page de paiement
   # et afficher ensuite son reçu de paiement en cas de succès.
    if co.create
    	redirect_to co.invoice_url
    else
    	@message = co.response_text
    end

## Paiement de facture Sans Redirection (PSR)

La première étape consiste à récupérer l'adresse email ou le numéro de téléphone du client PAYDUNYA.
Passer le ensuite en paramètre la méthode `create` d'une instance de la classe `Paydunya::Onsite::Invoice`.
PAYDUNYA vous renverra un token PSR. Le client PAYDUNYA recevra également un code de confirmation par e-mail et SMS (uniquement pour les transactions réelles).

    if co.create("EMAIL_OU_NUMERO_DU_CLIENT_PAYDUNYA")
        @opr_token = co.token
    else
        @message = co.response_text
    end

La seconde étape nécessite que vous récupérer le code de confirmation envoyé au client, y ajouter votre token PSR pour ensuite facturer réellement le client. En cas de succès de paiement, vous devriez être en mesure d'accéder à l'URL du reçu électronique et d'autres informations listées au niveau de la documentation officielle.

    if co.charge("TOKEN_PSR", "CODE_DE_CONFIRMATION_DU_CLIENT")
        @receipt = co.receipt_url
        @customer_name = co.customer['name']
    else
        @message = co.response_text
    end

## Transfert d'argent via le service de Transfert Automatique (TFA)

Cette option s'avère très intéressante si vous souhaitez créer votre propre solution de paiement par dessus celle de PAYDUNYA ou si vous devez reverser un certain pourcentage à chaque vente. L'argent est reçu sur les comptes destinataires et le service n'est pas facturé.

Vous pouvez transférer des fonds vers d'autres comptes clients PAYDUNYA à partir de votre compte via l'API de Transfert Automatique (TFA). Pour des raisons de sécurité, vous devez explicitement activer l'option de Transfert Automatique (TFA) dans la configuration de votre intégration. Vous pouvez toujours activer ou désactiver le Transfert Automatique (TFA) en mettant à jour la configuration de votre intégration.

    direct_pay = Paydunya::DirectPay.new
    if (direct_pay.credit_account("EMAIL_OU_NUMERO_MOBILE_DU_CLIENT_PAYDUNYA", MONTANT_A_TRANSFERER))
      puts direct_pay.description
      puts direct_pay.response_text
      puts direct_pay.transaction_id
    else
      puts direct_pay.description
      puts direct_pay.response_text
    end

## Télécharger une application exemple Ruby on Rails
https://github.com/paydunya/paydunya-rails-demo-store

## Contribuer

1. Faire un Fork de ce dépôt
2. Créer une nouvelle branche (`git checkout -b new-feature`)
3. Faire un commit de vos modifications (`git commit -am "Ajout d'une nouvelle fonctionnalité"`)
4. Faire un Push au niveau de la branche (`git push origin new-feature`)
5. Créer un Pull Request

