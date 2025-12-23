#!/bin/sh
set -e

# Runtime fix: assegura que només hi ha 1 MPM actiu
rm -f /etc/apache2/mods-enabled/mpm_*.load /etc/apache2/mods-enabled/mpm_*.conf || true
a2enmod mpm_prefork rewrite >/dev/null 2>&1 || true

# Debug ràpid: imprimeix MPM actiu a logs
apache2ctl -M 2>/dev/null | grep mpm || true

# Executa l'entrypoint original de WordPress
exec /usr/local/bin/docker-entrypoint.sh "$@"
