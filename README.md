# A LIRE URGENT

# New ajout
implementation des cours et un espace chat

# Recommandation
Une fois cloner, faite un flutter clean et relancer l'apllication avec une bonne connection (j'ai du supprimer le build pour pouvoir le mettre sur gitbub pour cause d'espace)
mais avec une bonne connection tous les elements seront retelecharger

# Imperfection 1

au lancement un avertissement de "depreciate API" (cherchons a resoudre cela)
en mode debogage (avoir une connexion pour tester l'appli car j'utilise ImageNetwork pour recuperer l'image du compte google de l'utilisateur) une mauvaise connection peut generer des ptites erreurs (probleme de connection) qui sont pas visibles en mode normale

# Imperfection 2

en mode apk(lorsque je génère le .apk) l'authentification avec google ne passe pas(une fois l'utilisateur authentifié ca reste bloqué sur le loading),l'espace chat ne fonctionne pas auusi car ils sont basés sur firebase JE soupçonne l'erreur "depreciate API" d'en etre la cause

Sinon a part ca, en mode normal (tous est ok)

il reste les cours de francais a implementer.

voir l'image aRegler.jpg pour l'erreur "depreciate API".

