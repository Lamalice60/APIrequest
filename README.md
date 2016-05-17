# APIrequest

<h2>Partiel DI 2015-2016</h2>

Récuperation de l'API de l'ISS : Cliquez pour afficher la position de l'ISS

langage : Pocessing
langage de retour : JSON

<h3>>> Request par l'url : par exemple :</h3>

/iss-now.json : position de l'ISS  l'instant

mais pour autre api comme RATP :
<h6>(http://data.ratp.fr/api/v1/console/datasets/1.0/search/)</h6>
regarder la domumentation mais souvent la même chose

/api/datasets/1.0/search/ qualite-de-lair-mesuree-dans-la-station-chatelet /prettyprint=true?
[adresse de request]/[tableau a regarder]/[option=true]?

<h3>>> Gerer la sortie des donnée : http://www.json.org/json-fr.html</h3>

Tous les valeurs/object/valeurs/... sont associé à une chaine de charactère, par exemple:"latitude": -50.729307362018346,
-> ne renvoie jamais une valeurs dans définition de cette chaine (qu'est ce que c'est)

- Differente catégorie comme dans processing : des int/float/char/images à extraitre par des .getFloat
bien regarder la formation du JSON (en prettyprint):
{} correspond à des JSONObject qu'il faux extraire puis allez chercher les valeur que l'on veux : comme un objet processing (balle.get[i]) et donc : .getJSONObject("iss_position")
[] correspond à une ArrayList et donc getJSONArray("iss_position")
...
