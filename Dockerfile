cat > Dockerfile <<'EOF'
FROM wordpress:latest

# Força un únic MPM i evita el crash
RUN a2dismod mpm_event mpm_worker 2>/dev/null || true \
 && a2enmod mpm_prefork rewrite
EOF
