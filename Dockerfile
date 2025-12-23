FROM wordpress:latest

# Deixa només 1 MPM actiu (prefork) eliminant qualsevol mpm_* habilitat
RUN rm -f /etc/apache2/mods-enabled/mpm_*.load /etc/apache2/mods-enabled/mpm_*.conf \
 && a2enmod mpm_prefork rewrite \
 && apache2ctl -M | grep mpm
