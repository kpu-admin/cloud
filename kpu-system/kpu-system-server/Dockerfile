FROM openjdk:17-jdk

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ARG JAR_FILE
RUN echo "JAR file path: ${JAR_FILE}"
COPY ${JAR_FILE} /app.jar

ENV PORT=9000
ENV DB_INFO=127.0.0.1:3306/blogx
ENV DB_USERNAME=root
ENV DB_PASSWORD=root
ENV EMAIL_HOST=smtp.qq.com
ENV EMAIL_PORT=465
ENV EMAIL_USERNAME=root@qq.com
ENV EMAIL_PASSWORD=root

ENTRYPOINT ["java", "-Xmx512m", "-jar", "/app.jar"]
CMD ["--spring.profiles.active=docker","--PORT=${PORT}", "--DB_INFO=${DB_INFO}", "--DB_USERNAME=${DB_USERNAME}", "--DB_PASSWORD=${DB_PASSWORD}", "--EMAIL_HOST=${EMAIL_HOST}", "--EMAIL_PORT=${EMAIL_PORT}", "--EMAIL_USERNAME=${EMAIL_USERNAME}", "--EMAIL_PASSWORD=${EMAIL_PASSWORD}"]
