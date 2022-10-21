i="sudo"
$i apt install proftpd-* openssl

echo "Création du groupe ftp"
$i groupadd ftp
echo "Ajout de l'utilisateur Merry et Ajout au groupe ftp"
$i useradd -m Merry && $i adduser Merry ftp
$i echo "Merry:kalimac" | $i chpasswd 

echo "Ajout de l'utilisateur Pippin et Ajout au groupe ftp"
$i useradd -m Pippin && $i adduser Pippin ftp
$i echo "Pippin:secondbreakfast" | $i chpasswd
 
echo "Génération des clefs de chiffrement"
$i mkdir /etc/proftpd/ssl
$i openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem

echo "Sauvegarde de l'ancien fichier proftpd.conf "
$i cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.bak

echo "Remplacement du fichier proftpd.conf"

$s cp proftpd.conf /etc/proftpd/proftpd.conf
$s chmod 600 /etc/proftpd/ssl/proftpd.* 

echo "Redémarage du service proftpd"
$s systemctl restart proftpd.service

echo "Installation terminée"
