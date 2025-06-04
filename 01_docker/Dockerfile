# 1. Utiliser une image légère Python 3.6
FROM python:3.6-alpine

# 2. Définir le répertoire de travail
WORKDIR /opt

# 3. Copier les fichiers de l'application dans le conteneur
COPY . /opt

# 4. Installer Flask à la version requise
RUN pip install --no-cache-dir flask==1.1.2

# 5. Ajouter releases.txt et exporter les variables d'environnement depuis ce fichier
# releases.txt doit être présent à la racine du repo, format :
# ODOO_URL https://...
# PGADMIN_URL https://...
# VERSION 1.0
RUN if [ -f releases.txt ]; then \
    export $(awk '{print $1"="$2}' releases.txt | xargs); \
    echo "ODOO_URL=$ODOO_URL" >> /etc/environment; \
    echo "PGADMIN_URL=$PGADMIN_URL" >> /etc/environment; \
    echo "VERSION=$VERSION" >> /etc/environment; \
    fi

# 6. Définir les variables d'environnement pour Flask (mode recommandée, reste sur le RUN pour l'automatisation CI/CD)
ENV ODOO_URL=${ODOO_URL} \
    PGADMIN_URL=${PGADMIN_URL} \
    VERSION=${VERSION}

# 7. Exposer le port par défaut de l'application Flask
EXPOSE 8080

# 8. Commande d'exécution principale de l'application
ENTRYPOINT ["python", "app.py"]