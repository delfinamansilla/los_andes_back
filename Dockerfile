FROM tomcat:10.1-jdk21

# Eliminar aplicaciones por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar tu WAR como ROOT
COPY los_andes.war /usr/local/tomcat/webapps/ROOT.war

# CRÍTICO: Deshabilitar el puerto de shutdown
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# Exponer puerto
EXPOSE 8080

# Iniciar Tomcat
CMD ["catalina.sh", "run"]

